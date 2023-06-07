import 'package:flutter/material.dart';
import 'package:sdk_eums/method_sdk/sdk_eums_platform_interface.dart';
import 'package:sdk_eums/notification/true_caller_overlay.dart';
import 'package:sdk_eums/sdk_eums.dart';
import 'package:sdk_eums/api_eums_offer_wall/eums_offer_wall_service.dart';

void main() {
  SdkEums.instant.init(
    onRun: () {
      runApp(const MyApp());
    },
  );
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: TrueCallerOverlay()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    SdkEums.instant.permission.checkPermission();
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // EumsOfferWallService.instance.authConnect(
                //     memId: "abeetest",
                //     memGen: "m",
                //     memBirth: "2023-06-02T06:51:17.205Z",
                //     memRegion: "hà nội");
                SdkEumsPlatform.instance.methodAdsync();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("Adsync"),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                // EumsOfferWallService.instance.userInfo();
                SdkEumsPlatform.instance.methodAdpopcorn();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("adpopcorn"),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                SdkEumsPlatform.instance.methodAppall();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("Appall"),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                SdkEumsPlatform.instance.methodMafin();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("mafin"),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                SdkEumsPlatform.instance.methodTnk();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("tkn"),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                SdkEumsPlatform.instance.methodOHC();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("ohc"),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                SdkEumsPlatform.instance.methodIvekorea();
              },
              child: const SizedBox(
                height: 50,
                width: 100,
                child: Text("Ivekorea"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
