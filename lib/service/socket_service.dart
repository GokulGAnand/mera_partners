import 'dart:convert';
import 'dart:developer';
import 'package:mera_partners/model/response/live/live_cars_list_response.dart';
import 'package:mera_partners/view_model/home/live/live_cars_list_view_model.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket? socket;

  SocketService getInstance() {
    return SocketService();
  }

  connectToSocket() {
    //todo change url
    socket = IO.io('ws://13.201.64.137:8080', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    List<Data> parseCarDataList(String jsonString) {
      final parsed = jsonDecode(jsonString).cast<Map<String, dynamic>>();
      return parsed.map<Data>((json) => Data.fromJson(json)).toList();
    }

    socket?.on('getBidInfo', (data) {
      log('Received message: $data');
      if (data != null) {
        List<Data> carList = parseCarDataList(data);
        Get.find<LiveCarsListViewModel>().liveCarsResponse.value.data = carList;
        Get.find<LiveCarsListViewModel>().updateBid(carList);
        Get.find<LiveCarsListViewModel>().liveCarsResponse.refresh();
        //todo changes
        // Get.find<BidCarsListViewModel>().bidCarsResponse.value.data = carList;
        // Get.find<BidCarsListViewModel>().bidCarsResponse.refresh(); // Manually trigger UI update
      }
    });

    socket?.connect();

    socket?.onConnect((_) {
      log('Connected to the socket server');
    });

    socket?.onDisconnect((_) {
      log('Disconnected from the socket server');
    });
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
