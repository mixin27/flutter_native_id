import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:native_id/native_id.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _androidId = 'Unknown';
  String _uuid = 'Unknown';
  final _nativeIdPlugin = NativeId();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String androidId;
    String uuid;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      androidId = await _nativeIdPlugin.getId() ?? 'Unknown ANDROID_ID';
    } on PlatformException {
      androidId = 'Failed to get android id.';
    }

    try {
      uuid = await _nativeIdPlugin.getUUID() ?? 'Unknown UUID';
    } on PlatformException {
      uuid = 'Failed to get uuid.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _androidId = androidId;
      _uuid = uuid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ANDROID_ID: $_androidId'),
              const SizedBox(height: 20),
              Text('UUID: $_uuid'),
            ],
          ),
        ),
      ),
    );
  }
}
