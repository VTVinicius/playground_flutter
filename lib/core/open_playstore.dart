

import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

void openPlayStoreOrShowToast({required String packageName}) async {
  String playStoreUrl = 'https://play.google.com/store/apps/details?id=$packageName';

  if (Platform.isAndroid) {
    if (await canLaunch(playStoreUrl)) {
      await launch(playStoreUrl);
    } else {
      Fluttertoast.showToast(
        msg: "Não foi possível abrir a Play Store",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
    }
  } else if (Platform.isIOS) {
    Fluttertoast.showToast(
      msg: "Participei apenas do desenvolvimento do aplicativo para Android",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }
}