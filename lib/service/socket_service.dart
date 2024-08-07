import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/model/response/live/live_cars_list_response.dart';
import 'package:mera_partners/utils/enum.dart';
import 'package:mera_partners/view_model/car_details/car_details_view_model.dart';
import 'package:mera_partners/view_model/home/live/live_cars_list_view_model.dart';
import 'package:mera_partners/view_model/home/orders/negotiation_cars_view_model.dart';
import 'package:mera_partners/view_model/home/orders/procured_bill_view_model.dart';
import 'package:mera_partners/view_model/home/otb/otb_view_model.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:mera_partners/utils/globals.dart' as globals;
import '../utils/constants.dart';
import '../utils/shared_pref_manager.dart';
import '../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  static IO.Socket? socket;

  SocketService._internal();

  factory SocketService() {
    return _instance;
  }

  connectToSocket() {
    //todo change url
    // socket = IO.io('ws://test.meracars.com', <String, dynamic>{
    //   'transports': ['websocket'],
    //   'autoConnect': false,
    // });

    socket = IO.io('ws://test.meracars.com', IO.OptionBuilder().setTransports(['websocket']).enableForceNew().build());


    List<Data> parseCarDataList(String jsonString) {
      final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
      return parsed.map<Data>((json) => Data.fromJson(json)).toList();
    }

    // List<UserData> parseUserData(String jsonString) {
    //   final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    //   return parsed.map<UserData>((json) => UserData.fromJson(json)).toList();
    // }

    void filterCars(List<Data> carList){
      List<Data> liveCarsList = <Data> [];
      // List<Data> otbCarsList = <Data> [];
      for(int i=0;i<carList.length;i++){
        if(carList[i].status?.toLowerCase() == CarStatus.live.name || carList[i].status?.toLowerCase() == CarStatus.scheduled.name){
          liveCarsList.add(carList[i]);
        }
        if(Get.isRegistered<CarDetailsScreenViewModel>()){
          if(Get.find<CarDetailsScreenViewModel>().carDetailsResponse.value.data?[0].sId == carList[i].sId){
            Get.find<CarDetailsScreenViewModel>().carDetailsResponse.value.data?[0] = carList[i];
            Get.find<CarDetailsScreenViewModel>().updateCarData(carList[i]);
            Get.find<CarDetailsScreenViewModel>().carDetailsResponse.refresh();
          }
        }
        // else if(carList[i].status?.toLowerCase() == CarStatus.otb.name){
        //   otbCarsList.add(carList[i]);
        // }
      }
      if (Get.isRegistered<LiveCarsListViewModel>()) {
        Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data!.value = liveCarsList;
        Get.find<LiveCarsListViewModel>().updateBid(liveCarsList);
        Get.find<LiveCarsListViewModel>().liveCarsResponse.value.count = liveCarsList.length;
        Get.find<LiveCarsListViewModel>().update();
        Get.find<LiveCarsListViewModel>().liveCarsResponse.refresh();
      }
    }

    socket?.on('getBidInfo', (data) {
      log('Received message: $data');
      if (data != null) {
        List<Data> carList = parseCarDataList(data);
        filterCars(carList);
        ///Auto bid notification
        // if ((Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data != null) && Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data!.isNotEmpty) {
        //   for (int i = 0; i < Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data!.length; i++) {
        //     num highestBid = Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data![i].highestBid ?? 0;
        //     if ((Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data![i].leaderBoard != null) && Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data![i].leaderBoard!.isNotEmpty) {
        //       if (Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data![i].leaderBoard!.any((element) => element.userId == globals.uniqueUserId && element.autoBidLimit != null && highestBid >= element.autoBidLimit!)) {
        //         NotificationService().showAutoBidNotification();
        //         Get.find<LiveCarsListViewModel>().showAlertDialog();
        //       }
        //     }
        //   }
        // }

        ///OTB data update
        if (Get.isRegistered<OTBCarsListViewModel>()) {
          // Get.find<OTBCarsListViewModel>().carsListResponse.value.data = otbCarsList;
          // Get.find<OTBCarsListViewModel>().updateCars(otbCarsList);
          // Get.find<OTBCarsListViewModel>().carsListResponse.refresh();
          Get.find<OTBCarsListViewModel>().infinitePagingController.refresh();
        }else{
          Get.put(OTBCarsListViewModel());
        }

        if (Get.isRegistered<BidCarsListViewModel>()) {
          Get.find<BidCarsListViewModel>().getCarData(1);
          Get.find<BidCarsListViewModel>().bidCarsResponse.refresh();
        }
      }
    });

    socket?.on('getUserInfo', (data) {
      log(data.toString());
      // List<UserData> userDetail = parseUserData(data);
      if (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false) {
      globals.documentStatus = DocumentStatus.VERIFIED.name;
      SharedPrefManager.instance.setStringAsync(Constants.documentStatus, DocumentStatus.VERIFIED.name);
      }
    },);

    socket?.on('getOffer', (data) {
      log('negotiation offer');
      log(data.toString());
      List<dynamic> offerData = jsonDecode(data);
      Data offer= Data.fromJson(offerData.first);
      if(Get.isRegistered<NegotiationViewModel>()){
        for(int i=0; i<Get.find<NegotiationViewModel>().searchNegotiationList.length; i++){
          if(Get.find<NegotiationViewModel>().searchNegotiationList[i].sId == offer.sId){
            Get.find<NegotiationViewModel>().searchNegotiationList[i] = offer;
            Get.find<NegotiationViewModel>().update();
          }
        }
      }
      log(offer.toString());
    },);

    socket?.on('getBill', (data) {
      log("bill message");
      log(data.toString());
      List<dynamic> billData = jsonDecode(data);
      Data bill= Data.fromJson(billData.first);
      if(Get.isRegistered<ProcuredScreenViewModel>()){
        for(int i=0; i<Get.find<ProcuredScreenViewModel>().searchList.length; i++){
          if(Get.find<ProcuredScreenViewModel>().searchList[i].sId == bill.sId){
            Get.find<ProcuredScreenViewModel>().searchList[i] = bill;
            Get.find<ProcuredScreenViewModel>().update();
            break;
          }
        }
      }
      log(bill.toString());
    },);

    socket?.connect();

    socket?.onConnect((_) {
      socket?.emit("joinDealerRoom", globals.uniqueUserId);
      socket?.emit("joinOfferRoom", globals.uniqueUserId);
      socket?.emit("joinBillRoom ", globals.uniqueUserId);
      log('Connected to the socket server');
    });

    socket?.onDisconnect((_) {
      log('Disconnected from the socket server');
    });
  }

  void disconnect() {
    socket?.disconnect();
    socket?.close();
  }

  void sendSocketRequest(event, data) {
    try {
      socket?.emit(
        event,
        data,
      );
    } catch (e) {
      CustomToast.instance.showMsg('socket emit failed');
    }
  }

  void getSocketResponse(
    event,
  ) {
    try {
      socket?.on(event, (data) {
        log('response from listener: $data');
        Get.find<LiveCarsListViewModel>().liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(data));
      });
    } catch (e) {
      CustomToast.instance.showMsg('socket on failed');
    }
  }
}
