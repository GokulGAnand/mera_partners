import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/model/response/live/live_cars_list_response.dart';
import 'package:evaluator_app/view_model/home/live/live_cars_list_view_model.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket? socket;

  SocketService getInstance() {
    return SocketService();
  }

  connectToSocket() {
    socket = IO.io('ws://192.168.1.26:8000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket?.on('getBidInfo', (data) {
      log('Received message: $data');
      Get.find<LiveCarsListViewModel>().liveCarsResponse.value = CarListResponse.fromJson(jsonDecode(data));
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
