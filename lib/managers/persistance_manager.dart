import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback offCallBack;

  LifecycleEventHandler({
    required this.offCallBack, required Future<void> Function() resumeCallBack,
  });

  @override
  /*
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        await pauseCallBack();
        break;
      case AppLifecycleState.detached:
        await suspendingCallBack();
        break;
      case AppLifecycleState.resumed:
    }
  }
   */
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      await offCallBack;
    }
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/tasks.txt');
}

Future<File> writeTasks(int counter) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$counter');
}

Future<int> readTasks() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return int.parse(contents);
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}
/*
class AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(
        LifecycleEventHandler(resumeCallBack: () async => setState(() {
          // do something
        }), offCallBack: () async { readTasks(); })
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  ...
}
*/