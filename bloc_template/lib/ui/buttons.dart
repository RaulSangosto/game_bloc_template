import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc/theme/model/theme_data.dart';
import '../state/bloc/theme/theme_bloc.dart';
import '../theme/colors.dart';
import '../theme/main_theme.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    this.onPressed,
    this.padding = 0.0,
    this.radius,
  }) : super(key: key);
  final Color backgroundColor;
  final Widget icon;
  final VoidCallback? onPressed;
  final double padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: icon,
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
  }) : super(key: key);
  final ButtonStyle? style;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: onPressed,
            style: secondaryButtonStyle(state.theme),
            child: child,
          );
        },
      );
    });
  }
}

class AccentButton extends StatelessWidget {
  const AccentButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
  }) : super(key: key);
  final ButtonStyle? style;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ElevatedButton(
            onPressed: onPressed,
            style: accentButtonStyle(state.theme),
            child: child,
          );
        },
      );
    });
  }
}

_getStyle(ButtonStyle? style, BoxConstraints constraints) {
  final ButtonStyle buttonStyle = style ?? const ButtonStyle();
  return buttonStyle.copyWith(
    padding: MaterialStateProperty.all(
      const EdgeInsets.all(10),
    ),
    elevation: MaterialStateProperty.all(
      0,
    ),
  );
}

class BlockButton extends StatelessWidget {
  const BlockButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.style,
  }) : super(key: key);
  final ButtonStyle? style;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ElevatedButton(
        onPressed: onPressed,
        style: _getStyle(style, constraints),
        child: SizedBox.expand(child: Center(child: child)),
      );
    });
  }
}

class LightBlockButton extends StatelessWidget {
  const LightBlockButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final style = primaryButtonStyle(state.theme);
          return ElevatedButton(
            onPressed: onPressed,
            style: _getStyle(style, constraints),
            child: SizedBox.expand(child: Center(child: child)),
          );
        },
      );
    });
  }
}

class AccentBlockButton extends StatelessWidget {
  const AccentBlockButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final style = accentButtonStyle(state.theme);
          return ElevatedButton(
            onPressed: onPressed,
            style: _getStyle(style, constraints),
            child: SizedBox.expand(child: Center(child: child)),
          );
        },
      );
    });
  }
}

class SecondaryBlockButton extends StatelessWidget {
  const SecondaryBlockButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final style = secondaryButtonStyle(state.theme);
          return ElevatedButton(
            onPressed: onPressed,
            style: _getStyle(style, constraints),
            child: SizedBox.expand(child: Center(child: child)),
          );
        },
      );
    });
  }
}

class PremiumBlockButton extends StatelessWidget {
  const PremiumBlockButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.onPremiumPressed,
    this.premium = false,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onPremiumPressed;
  final bool premium;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final style = premium
              ? accentButtonStyle(state.theme)
              : premiumButtonStyle(state.theme);
          final icon = premium ? Icons.star_rounded : Icons.lock_rounded;

          return ElevatedButton(
            onPressed: premium ? onPremiumPressed : onPressed,
            style: _getStyle(style, constraints),
            child: SizedBox.expand(
                child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(icon),
                ),
                Center(child: child),
                if (!premium)
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.euro_rounded,
                          size: 20,
                        ),
                        const SizedBox.square(
                          dimension: 10,
                        ),
                        Text(
                          "premium_unlock_text",
                          style: bodyTextStyle(state.theme).copyWith(
                              color: white, fontWeight: FontWeight.bold),
                        ).tr(),
                      ],
                    ),
                  ),
              ],
            )),
          );
        },
      );
    });
  }
}

class CompletedBlockButton extends StatelessWidget {
  const CompletedBlockButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.onIncompletedPressed,
    this.completed = false,
    this.incompleteMessage,
    this.completedStyle,
    this.incompletedStyle,
    this.completeMessage,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final VoidCallback? onIncompletedPressed;
  final bool completed;
  final String? incompleteMessage;
  final String? completeMessage;
  final ButtonStyle? completedStyle;
  final ButtonStyle? incompletedStyle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final style = completed
              ? completedStyle ?? accentButtonStyle(state.theme)
              : incompletedStyle ?? premiumButtonStyle(state.theme);
          final textStyle = style.textStyle!.resolve({MaterialState.error});
          final icon =
              completed ? Icons.star_rounded : Icons.star_border_rounded;

          return ElevatedButton(
            onPressed:
                completed ? onPressed : onIncompletedPressed ?? onPressed,
            style: _getStyle(style, constraints),
            child: SizedBox.expand(
                child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(icon),
                ),
                Center(child: child),
                if (!completed && incompleteMessage != null ||
                    completed && completeMessage != null)
                  Positioned(
                    bottom: 10,
                    child: Text(
                      completed ? completeMessage! : incompleteMessage!,
                      style: textStyle!,
                    ),
                  ),
              ],
            )),
          );
        },
      );
    });
  }
}

class OutlinedBlockButton extends StatelessWidget {
  const OutlinedBlockButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.filled = false,
    this.style,
  }) : super(key: key);
  final ButtonStyle? style;
  final bool filled;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return OutlinedButton(
            onPressed: onPressed,
            style: _getStyle(
                filled ? _getFilledStyle(context, state.theme) : style,
                constraints),
            child: SizedBox.expand(child: Center(child: child)),
          );
        },
      );
    });
  }

  _getFilledStyle(BuildContext context, ThemeItemData theme) {
    return Theme.of(context).brightness == Brightness.light
        ? lightButtonStyle(theme)
        : darkButtonStyle(theme);
  }
}
