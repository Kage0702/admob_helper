import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static const String testAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-XXXXXXXXXXXXX'; //YOUR AD ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-XXXXXXXXXXXXX'; //YOUR AD ID
    } else {
      // ignore: unnecessary_new
      throw new UnsupportedError('Unsupported platform');
    }
  }
}

class AdMob {
  BannerAd? _bannerAd;
  AdMob() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.testAdUnitId, //It can be replaced to bannerAdUnitId.
        listener: BannerAdListener(
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            // // Log
            // print('Ad failed to load: ${error.message}');
            // print('Error code: ${error.code}');
            // print('Error domain: ${error.domain}');
            // final responseInfo = error.responseInfo;
            // if (responseInfo != null) {
            //   print('Response info: ${responseInfo}');
            //   print(
            //       'Mediation adapter class name: ${responseInfo.mediationAdapterClassName}');
            //   print('Response ID: ${responseInfo.responseId}');
            // }
            ad.dispose();
          },
        ),
        request: const AdRequest());
  }

  void load() {
    _bannerAd?.load();
  }

  void dispose() {
    _bannerAd!.dispose();
  }

  Widget getAdBanner() {
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
