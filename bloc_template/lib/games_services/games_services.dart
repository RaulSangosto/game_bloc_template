// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:games_services/games_services.dart' as gs;
import 'package:games_services/games_services.dart';

import '../../ids.dart';

/// Allows awarding achievements and leaderboard scores,
/// and also showing the platforms' UI overlays for achievements
/// and leaderboards.
///
/// A facade of `package:games_services`.
class GamesServicesController {
  final Completer<bool> _signedInCompleter = Completer();

  Future<bool> get signedIn => _signedInCompleter.future;

  /// Unlocks an achievement on Game Center / Play Games.
  ///
  /// You must provide the achievement ids via the [iOS] and [android]
  /// parameters.
  ///
  /// Does nothing when the game isn't signed into the underlying
  /// games service.
  Future<void> awardAchievement(
      {required String iOS, required String android}) async {
    if (!await signedIn) {
      return;
    }
    await gs.GamesServices.unlock(
      achievement: gs.Achievement(
        androidID: android,
        iOSID: iOS,
      ),
    );
  }

  Future<void> incrementAchievement(
      {required String iOS, required String android, int steps = 1}) async {
    if (!await signedIn) {
      return;
    }
    await gs.GamesServices.increment(
      achievement: gs.Achievement(
        androidID: android,
        iOSID: iOS,
        steps: steps,
      ),
    );
  }

  /// Signs into the underlying games service.
  Future<void> initialize() async {
    try {
      await gs.GamesServices.signIn();
      // The API is unclear so we're checking to be sure. The above call
      // returns a String, not a boolean, and there's no documentation
      // as to whether every non-error result means we're safely signed in.
      final signedIn = await gs.GamesServices.isSignedIn;
      _signedInCompleter.complete(signedIn);
    } catch (e) {
      debugPrint(e.toString());
      _signedInCompleter.complete(false);
    }
  }

  /// Launches the platform's UI overlay with achievements.
  Future<void> showAchievements() async {
    if (!await signedIn) {
      return;
    }

    final response = await gs.GamesServices.showAchievements();
    debugPrint(response);
  }

  Future<List<AchievementItemData>?> getAchievementsData() async {
    if (!await signedIn) {
      return null;
    }

    final response = await gs.GamesServices.loadAchievements();
    return response;
  }

  Future<List<LeaderboardScoreData>?> getLeaderboardScoreData() async {
    if (!await signedIn) {
      return null;
    }

    final response = await gs.GamesServices.loadLeaderboardScores(
      iOSLeaderboardID: IdsConstants.iosLeaderboardID,
      androidLeaderboardID: IdsConstants.androidLeaderboardID,
      scope: gs.PlayerScope.global,
      timeScope: gs.TimeScope.allTime,
      maxResults: 30,
    );
    return response;
  }

  /// Launches the platform's UI overlay with leaderboard(s).
  Future<void> showLeaderboard() async {
    if (!await signedIn) {
      return;
    }
    final response = await gs.GamesServices.showLeaderboards(
      iOSLeaderboardID: IdsConstants.iosLeaderboardID,
      androidLeaderboardID: IdsConstants.androidLeaderboardID,
    );
    debugPrint(response);
  }

  Future<String?> getPlayerID() async {
    return await gs.GamesServices.getPlayerID();
  }

  Future<String?> getPlayerName() async {
    return await gs.GamesServices.getPlayerName();
  }

  Future<int?> getPlayerScore() async {
    return await gs.GamesServices.getPlayerScore(
      iOSLeaderboardID: IdsConstants.iosLeaderboardID,
      androidLeaderboardID: IdsConstants.androidLeaderboardID,
    );
  }

  /// Submits [score] to the leaderboard.
  Future<void> submitLeaderboardScore(int? score) async {
    if (!await signedIn) {
      return;
    }
    await gs.GamesServices.submitScore(
      score: gs.Score(
        iOSLeaderboardID: IdsConstants.iosLeaderboardID,
        androidLeaderboardID: IdsConstants.androidLeaderboardID,
        value: score,
      ),
    );
  }
}
