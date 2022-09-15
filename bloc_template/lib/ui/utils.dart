import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget hideUntilReady({required Widget child, required Future<bool> ready}) {
  return FutureBuilder<bool>(
    future: ready,
    builder: (context, snapshot) {
      // Use Visibility here so that we have the space for the buttons
      // ready.
      return Visibility(
        visible: snapshot.data ?? false,
        maintainState: true,
        maintainSize: true,
        maintainAnimation: true,
        child: child,
      );
    },
  );
}

launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
