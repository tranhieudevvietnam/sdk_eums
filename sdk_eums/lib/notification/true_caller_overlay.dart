import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:sdk_eums/gen/assets.gen.dart';
import 'package:simple_shadow/simple_shadow.dart';

class TrueCallerOverlay extends StatefulWidget {
  const TrueCallerOverlay({Key? key}) : super(key: key);

  @override
  State<TrueCallerOverlay> createState() => _TrueCallerOverlayState();
}

class _TrueCallerOverlayState extends State<TrueCallerOverlay> {
  bool isGold = true;

  @override
  void initState() {
    super.initState();
    FlutterOverlayWindow.overlayListener.listen((event) {
      log("$event");
      setState(() {
        isGold = !isGold;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Shadow>? shadows = [
      Shadow(
        color: Colors.grey.shade900.withOpacity(.5),
        offset: const Offset(1.0, 1.0),
        blurRadius: 1.0,
      ),
    ];
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          width: MediaQuery.of(context).size.width,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.transparent,
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: isGold ? _goldColors : _silverColors,
            // ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Stack(
            children: [
              Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await FlutterOverlayWindow.closeOverlay();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SimpleShadow(
                          opacity: 1, // Default: 0.5
                          sigma: 1,
                          color: Colors.grey.shade900.withOpacity(.5),
                          offset: const Offset(1.0, 1.0),
                          child: Image.asset(Assets.watchAdsNow.path,
                              package: "sdk_eums",
                              width: 30,
                              height: 30), // Default: 2
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "광고 바로 시청하기",
                          style: TextStyle(
                              color: Colors.white,
                              shadows: shadows,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                              fontSize: 23),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      FlutterOverlayWindow.shareData(
                          "Heyy this is a data from the overlay");
                    },
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 1,
                        child: Draggable(
                          data: Colors.amber,
                          feedback: Image.asset(
                            Assets.logo.path,
                            package: 'sdk_eums',
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
                          ),
                          childWhenDragging: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
                          ),
                          child: Image.asset(
                            Assets.logo.path,
                            package: 'sdk_eums',
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      await FlutterOverlayWindow.closeOverlay();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SimpleShadow(
                          opacity: 1, // Default: 0.5
                          sigma: 1,
                          color: Colors.grey.shade900.withOpacity(.5),
                          offset: const Offset(1.0, 1.0),
                          child: Image.asset(Assets.saveAdvertise.path,
                              package: "sdk_eums",
                              width: 30,
                              height: 30), // Default: 2
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "광고 보관하기",
                          style: TextStyle(
                              color: Colors.white,
                              shadows: shadows,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                              fontSize: 23),
                        )
                      ],
                    ),
                  )
                ],
              ),

              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: IconButton(
              //     onPressed: () async {
              //       await FlutterOverlayWindow.closeOverlay();
              //     },
              //     icon: const Icon(
              //       Icons.close,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),

              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [

              //     // ListTile(
              //     //   leading: Container(
              //     //     height: 80.0,
              //     //     width: 80.0,
              //     //     decoration: BoxDecoration(
              //     //       border: Border.all(color: Colors.black54),
              //     //       shape: BoxShape.circle,
              //     //       image: const DecorationImage(
              //     //         image: NetworkImage(
              //     //             "https://api.multiavatar.com/x-slayer.png"),
              //     //       ),
              //     //     ),
              //     //   ),
              //     //   title: const Text(
              //     //     "X-SLAYER",
              //     //     style: TextStyle(
              //     //         fontSize: 20.0, fontWeight: FontWeight.bold),
              //     //   ),
              //     //   subtitle: const Text("Sousse , Tunisia"),
              //     // ),
              //     // const Divider(color: Colors.black54),
              //     // Padding(
              //     //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
              //     //   child: Row(
              //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //     children: [
              //     //       Column(
              //     //         crossAxisAlignment: CrossAxisAlignment.start,
              //     //         children: const [
              //     //           Text("+216 21065826"),
              //     //           Text("Last call - 1 min ago"),
              //     //         ],
              //     //       ),
              //     //       const Text(
              //     //         "Flutter Overlay",
              //     //         style: TextStyle(
              //     //             fontSize: 15.0, fontWeight: FontWeight.bold),
              //     //       ),
              //     //     ],
              //     //   ),
              //     // )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
