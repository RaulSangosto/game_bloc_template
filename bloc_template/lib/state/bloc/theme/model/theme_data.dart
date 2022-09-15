import 'package:flutter/cupertino.dart';

import '../../../../ids.dart';
import '../../../../theme/colors.dart';

enum ThemeItemType {
  circles,
  special,
  warm,
  bubbles,
  night,
  modern,
  minimal,
  space,
  stars,
  ultra,
  mega,
  summer,
}

class ThemeItemData {
  final String name;
  final bool premium;
  final bool unlocked;
  final Color backgroundColor;
  final Color textColor;
  final Color accentColor;
  final Color secondaryColor;
  final Color darkColor;
  final Color lightColor;
  final double menuBlur;
  final double gameBlur;
  final Brightness brightness;
  final String? unlockText;
  final String? achivementUnlockId;
  final ThemeItemType type;

  ThemeItemData({
    required this.name,
    required this.type,
    required this.backgroundColor,
    required this.textColor,
    required this.accentColor,
    required this.secondaryColor,
    this.darkColor = black,
    this.lightColor = white,
    this.brightness = Brightness.light,
    this.menuBlur = 0,
    this.gameBlur = 10,
    this.premium = false,
    this.unlocked = false,
    this.unlockText,
    this.achivementUnlockId,
  });

  factory ThemeItemData.fromJson(Map<String, dynamic> json) {
    return ThemeItemData(
      name: json["name"],
      premium: json["premium"],
      unlocked: json["unlocked"],
      unlockText: json["unlockText"],
      achivementUnlockId: json["achivementUnlockName"],
      lightColor: Color(json["lightColor"]),
      darkColor: Color(json["darkColor"]),
      backgroundColor: Color(json["backgroundColor"]),
      textColor: Color(json["textColor"]),
      accentColor: Color(json["accentColor"]),
      secondaryColor: Color(json["secondaryColor"]),
      brightness: Brightness.values[json["brightness"]],
      menuBlur: json["menuBlur"],
      gameBlur: json["gameBlur"],
      type: ThemeItemType.values[json["type"]],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json["name"] = name;
    json["premium"] = premium;
    json["unlocked"] = unlocked;
    json["unlockText"] = unlockText;
    json["achivementUnlockName"] = achivementUnlockId;
    json["lightColor"] = lightColor.value;
    json["darkColor"] = darkColor.value;
    json["backgroundColor"] = backgroundColor.value;
    json["textColor"] = textColor.value;
    json["accentColor"] = accentColor.value;
    json["secondaryColor"] = secondaryColor.value;
    json["menuBlur"] = menuBlur;
    json["gameBlur"] = gameBlur;
    json["brightness"] = brightness.index;
    json["type"] = type.index;

    return json;
  }
}

List<ThemeItemData> themes = [
  ThemeItemData(
    name: "Circles",
    unlocked: true,
    gameBlur: 0,
    backgroundColor: white,
    textColor: black,
    accentColor: green,
    secondaryColor: purple,
    type: ThemeItemType.circles,
  ),
  ThemeItemData(
    name: "Special",
    unlockText: "unlock_theme_special_text",
    achivementUnlockId: IdsConstants.curiousAchievement, //"Champion",
    unlocked: false,
    gameBlur: 5,
    backgroundColor: black,
    textColor: white,
    accentColor: purple,
    secondaryColor: green,
    brightness: Brightness.dark,
    type: ThemeItemType.special,
  ),
  ThemeItemData(
    name: "Warm",
    unlockText: "unlock_theme_warm_text",
    achivementUnlockId: IdsConstants.winnerAchievement, //"Profesional",
    unlocked: false,
    gameBlur: 5,
    darkColor: warmBg,
    backgroundColor: warmBg,
    textColor: warmText,
    accentColor: warmAccent,
    secondaryColor: warmSecondary,
    brightness: Brightness.dark,
    type: ThemeItemType.warm,
  ),
  ThemeItemData(
    name: "Bubbles",
    unlockText: "unlock_theme_bubbles_text",
    achivementUnlockId: IdsConstants.easyChallengeAchievement, //"Specialist",
    unlocked: false,
    backgroundColor: bubbleBg,
    textColor: bubbleText,
    accentColor: bubbleAccent,
    secondaryColor: bubbleSecondary,
    type: ThemeItemType.bubbles,
  ),
  ThemeItemData(
    name: "Night",
    unlockText: "unlock_theme_night_text",
    achivementUnlockId: IdsConstants.puristAchievement,
    unlocked: false,
    menuBlur: 5,
    darkColor: nightBg,
    backgroundColor: nightBg,
    textColor: nightText,
    accentColor: nightAccent,
    secondaryColor: nightSecondary,
    brightness: Brightness.dark,
    type: ThemeItemType.night,
  ),
  ThemeItemData(
    name: "Modern",
    unlockText: "unlock_theme_modern_text",
    achivementUnlockId: IdsConstants.leyendAchievement,
    unlocked: false,
    gameBlur: 0,
    backgroundColor: modernBg,
    textColor: modernText,
    accentColor: modernAccent,
    secondaryColor: modernSecondary,
    type: ThemeItemType.modern,
  ),
  ThemeItemData(
    name: "Minimal",
    unlockText: "unlock_theme_minimal_text",
    achivementUnlockId: IdsConstants.patientAchievement,
    unlocked: false,
    gameBlur: 1,
    backgroundColor: minimalBg,
    textColor: minimalText,
    accentColor: minimalAccent,
    secondaryColor: minimalSecondary,
    brightness: Brightness.dark,
    type: ThemeItemType.minimal,
  ),
  ThemeItemData(
    name: "Candy",
    unlockText: "unlock_theme_candy_text",
    achivementUnlockId: IdsConstants.mediumChallengeAchievement,
    unlocked: false,
    gameBlur: 0,
    backgroundColor: candyBg,
    textColor: candyText,
    accentColor: candyAccent,
    secondaryColor: candySecondary,
    lightColor: candyBg,
    type: ThemeItemType.ultra,
  ),
  ThemeItemData(
    name: "Ice",
    gameBlur: 0,
    unlockText: "unlock_theme_ice_text",
    achivementUnlockId: IdsConstants.hardChallengeAchievement,
    unlocked: false,
    backgroundColor: iceBg,
    textColor: iceText,
    accentColor: iceAccent,
    secondaryColor: iceSecondary,
    lightColor: iceBg,
    type: ThemeItemType.special,
  ),
  ThemeItemData(
    name: "Space",
    unlockText: "unlock_theme_space_text",
    achivementUnlockId: IdsConstants.weeklyChallengeAchievement,
    unlocked: false,
    gameBlur: 5,
    menuBlur: 2,
    darkColor: spaceBg,
    backgroundColor: spaceBg,
    textColor: spaceText,
    accentColor: spaceAccent,
    secondaryColor: spaceSecondary,
    brightness: Brightness.dark,
    type: ThemeItemType.space,
  ),
  ThemeItemData(
    name: "Stars",
    premium: true,
    unlocked: true,
    backgroundColor: starsBg,
    textColor: starsText,
    accentColor: starsAccent,
    secondaryColor: starsSecondary,
    brightness: Brightness.dark,
    type: ThemeItemType.warm,
  ),
  ThemeItemData(
    name: "Pastel",
    premium: true,
    unlocked: true,
    gameBlur: 0,
    backgroundColor: pastelBg,
    textColor: pastelText,
    accentColor: pastelAccent,
    secondaryColor: pastelSecondary,
    lightColor: pastelBg,
    darkColor: pastelText,
    type: ThemeItemType.special,
  ),
  ThemeItemData(
    name: "Spicy",
    premium: true,
    unlocked: true,
    backgroundColor: spicyBg,
    textColor: spicyText,
    accentColor: spicyAccent,
    secondaryColor: spicySecondary,
    darkColor: spicyText,
    type: ThemeItemType.modern,
  ),
  ThemeItemData(
    name: "Dessert",
    premium: true,
    unlocked: true,
    gameBlur: 0,
    backgroundColor: dessertBg,
    textColor: dessertText,
    accentColor: dessertAccent,
    secondaryColor: dessertSecondary,
    lightColor: dessertBg,
    darkColor: dessertText,
    type: ThemeItemType.space,
  ),
  ThemeItemData(
    name: "Melon",
    premium: true,
    unlocked: true,
    backgroundColor: melonBg,
    textColor: melonText,
    accentColor: melonAccent,
    secondaryColor: melonSecondary,
    lightColor: melonBg,
    darkColor: melonText,
    type: ThemeItemType.minimal,
  ),
  ThemeItemData(
    name: "Fire",
    premium: true,
    unlocked: true,
    gameBlur: 0,
    backgroundColor: fireBg,
    textColor: fireText,
    accentColor: fireAccent,
    secondaryColor: fireSecondary,
    lightColor: fireText,
    darkColor: fireBg,
    brightness: Brightness.dark,
    type: ThemeItemType.ultra,
  ),
  ThemeItemData(
    name: "Summer",
    premium: true,
    unlocked: true,
    backgroundColor: white,
    textColor: black,
    accentColor: summerMiddle,
    secondaryColor: summerAccent,
    type: ThemeItemType.summer,
  ),
];
