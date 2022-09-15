import 'package:flutter/material.dart';

class CollapsableAppBarScaffold extends StatelessWidget {
  const CollapsableAppBarScaffold(
      {Key? key,
      this.collapsableAppBar,
      required this.body,
      this.appBar,
      this.backgroundColor,
      this.drawer,
      this.endDrawer})
      : super(key: key);

  final AppBar? collapsableAppBar;
  final AppBar? appBar;
  final Widget body;
  final Color? backgroundColor;
  final Widget? drawer;
  final Widget? endDrawer;

  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.of(context).size.aspectRatio;
    final wide = ratio >= 1.2;
    final double margin =
        collapsableAppBar != null ? collapsableAppBar!.preferredSize.height : 0;
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: Stack(children: [
        if (collapsableAppBar != null)
          Positioned(top: 0, left: 0, right: 0, child: collapsableAppBar!),
        Positioned(
          top: 30 + (wide ? 0 : margin),
          left: 0,
          right: 0,
          bottom: 0,
          child: body,
        ),
      ]),
    );
  }
}
