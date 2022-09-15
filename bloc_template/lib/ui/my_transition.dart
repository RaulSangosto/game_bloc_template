// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../state/bloc/theme/model/theme_data.dart';
import '../state/bloc/theme/theme_bloc.dart';

CustomTransitionPage<T> buildMyTransition<T>({
  required Widget child,
  Brightness brightness = Brightness.dark,
  String? name,
  Object? arguments,
  String? restorationId,
  LocalKey? key,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeItemData theme = state.theme;
          Color dark = theme.brightness == Brightness.dark
              ? theme.backgroundColor
              : theme.textColor;
          Color light = theme.brightness == Brightness.dark
              ? theme.textColor
              : theme.backgroundColor;

          return _MyReveal(
            animation: animation,
            color: brightness == Brightness.dark ? dark : light,
            child: child,
          );
        },
      );
    },
    key: key,
    name: name,
    arguments: arguments,
    restorationId: restorationId,
    transitionDuration: const Duration(milliseconds: 700),
  );
}

class _MyReveal extends StatefulWidget {
  final Widget child;

  final Animation<double> animation;

  final Color color;

  const _MyReveal({
    required this.child,
    required this.animation,
    required this.color,
  });

  @override
  State<_MyReveal> createState() => _MyRevealState();
}

class _MyRevealState extends State<_MyReveal> {
  bool _finished = false;

  final _tween = Tween(begin: const Offset(1, 0), end: Offset.zero);

  @override
  void initState() {
    super.initState();

    widget.animation.addStatusListener(_statusListener);
  }

  @override
  void didUpdateWidget(covariant _MyReveal oldWidget) {
    if (oldWidget.animation != widget.animation) {
      oldWidget.animation.removeStatusListener(_statusListener);
      widget.animation.addStatusListener(_statusListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.animation.removeStatusListener(_statusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SlideTransition(
          position: _tween.animate(
            CurvedAnimation(
              parent: widget.animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeOutCubic,
            ),
          ),
          child: Container(
            color: widget.color,
          ),
        ),
        AnimatedOpacity(
          opacity: _finished ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: widget.child,
        ),
      ],
    );
  }

  void _statusListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        setState(() {
          _finished = true;
        });
        break;
      case AnimationStatus.forward:
      case AnimationStatus.dismissed:
      case AnimationStatus.reverse:
        setState(() {
          _finished = false;
        });
        break;
    }
  }
}
