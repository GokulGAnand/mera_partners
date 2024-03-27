import 'dart:developer';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket? socket;

  SocketService getInstance() {
    return SocketService();
  }

  connectToSocket() {
    socket = IO.io('ws://192.168.1.10:8000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket?.on('getBidInfo', (data) {
      log('Received message: $data');
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
        log('Received message: $data');
      });
    } catch (e) {
      CustomToast.instance.showMsg('socket on failed');
    }
  }
}
