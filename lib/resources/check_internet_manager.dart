import 'dart:async';
import 'package:flutter/material.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

class CheckInternet {
  StreamSubscription<DataConnectionStatus>? listener;
  var internetStatus = "Unknown";
  var contentmessage = "Unknown";

  checkConnection(BuildContext context) async {
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          internetStatus = "Connected to the Internet";
          contentmessage = "Connected to the Internet";
          break;
        case DataConnectionStatus.disconnected:
          internetStatus = "You are disconnected to the Internet. ";
          contentmessage = "Please check your internet connection";
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }


}