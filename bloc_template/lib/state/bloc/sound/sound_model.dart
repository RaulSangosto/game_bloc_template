import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:bloc_template/state/bloc/sound/sound_data.dart';
import 'package:just_audio/just_audio.dart';

enum SoundType {
  place,
  improve,
  special,
  click,
  select,
  cancel,
  move,
  win,
  lose,
  open,
  close,
  openHelp,
  closeHelp,
  logoOpen,
}

enum ThemeSongs {
  mainMenu,
  playArea,
  tutorial,
  win,
  lose,
  credits,
}

class MusicPlayer {
  static final MusicPlayer _instance = MusicPlayer._();
  late AudioPlayer musicPlayer;
  late AudioPlayer helperPlayer;

  static MusicPlayer get instance => _instance;

  MusicPlayer._() {
    musicPlayer = AudioPlayer();
    helperPlayer = AudioPlayer();
  }
}

class SoundController {
  final double musicVolume;
  final double soundVolume;
  final double helperVolume;
  final int poliphony;
  final int activeAudioPlayer;
  final AudioPlayer helperAudioPlayer = MusicPlayer.instance.helperPlayer;
  final AudioPlayer musicAudioPlayer = MusicPlayer.instance.musicPlayer;
  final List<AudioPlayer> audioPlayers;
  ThemeSongs? currentSong;

  SoundController(
    this.musicVolume,
    this.soundVolume,
    this.helperVolume,
    this.poliphony,
    this.activeAudioPlayer,
    this.audioPlayers, {
    this.currentSong,
  });

  factory SoundController.initial() {
    return SoundController(
      .5,
      .5,
      .5,
      2,
      0,
      List.generate(2, (index) => AudioPlayer()),
    );
  }

  SoundController copyWith({
    double? musicVolume,
    double? soundVolume,
    double? helperVolume,
    int? poliphony,
    int? activeAudioPlayer,
    AudioPlayer? helperAudioPlayer,
    List<AudioPlayer>? audioPlayers,
  }) {
    return SoundController(
      musicVolume ?? this.musicVolume,
      soundVolume ?? this.soundVolume,
      helperVolume ?? this.helperVolume,
      poliphony ?? this.poliphony,
      activeAudioPlayer ?? this.activeAudioPlayer,
      audioPlayers ?? this.audioPlayers,
      currentSong: currentSong,
    );
  }

  bool musicMute() => musicVolume == 0;

  bool soundMute() => soundVolume == 0;

  bool helperMute() => helperVolume == 0;

  void setMusicVolume(double value) {
    musicAudioPlayer.setVolume(value * .3);
  }

  void _crossFadeSong(double musicVolume, String songPath) {
    double volume = musicVolume;
    bool decreasing = true;
    sleep(const Duration(milliseconds: 100));
    Timer.periodic(const Duration(milliseconds: 50), (Timer t) {
      if (decreasing) {
        volume -= .01;
      } else {
        volume += .01;
      }
      if (decreasing && volume <= 0) {
        decreasing = false;
        musicAudioPlayer.stop();
        musicAudioPlayer.setVolume(0);
        musicAudioPlayer.setAsset(songPath);
        musicAudioPlayer.play();
      }
      musicAudioPlayer.setVolume(volume);
      if (!decreasing && volume >= musicVolume) {
        t.cancel();
      }
    });
  }

  void setSoundVolume(double value) {
    final audioPlayer = audioPlayers[activeAudioPlayer];
    audioPlayer.setVolume(value);
  }

  void setHelperVolume(double value) {
    helperAudioPlayer.setVolume(value * .5);
  }

  void playSound(SoundType type) {
    final audioPlayer =
        audioPlayers[activeAudioPlayer.clamp(0, audioPlayers.length - 1)];
    audioPlayer.stop();
    final sound = _getRandomSoundType(type);
    setSoundVolume(soundVolume);
    audioPlayer.setAsset(sound);
    audioPlayer.play();
  }

  void playSong(ThemeSongs song) {
    if (song == currentSong) {
      return;
    }
    currentSong = song;
    musicAudioPlayer.setLoopMode(LoopMode.all);
    _crossFadeSong(musicVolume * .3, _getAssetSong(song));
  }

  void pauseAllSound() {
    musicAudioPlayer.pause();
    if (helperAudioPlayer.playing) {
      helperAudioPlayer.pause();
    }
    for (var audioPlayer in audioPlayers) {
      if (audioPlayer.playing) {
        audioPlayer.pause();
      }
    }
  }

  void resumeAllSound() {
    musicAudioPlayer.play();
  }

  void startTalkHelper() {
    final position = Duration(milliseconds: (Random().nextInt(10000)));
    helperAudioPlayer.stop();
    setHelperVolume(helperVolume);
    helperAudioPlayer.setAsset("assets/sounds/helper/talking.ogg");
    helperAudioPlayer.seek(position);
    helperAudioPlayer.play();
  }

  void stopTalkHelper() {
    helperAudioPlayer.stop();
  }

  void stopSong() {
    musicAudioPlayer.stop();
  }

  String _getAssetSong(ThemeSongs song) {
    String asset = "assets/music/";
    switch (song) {
      case ThemeSongs.mainMenu:
        asset += "pck404_lets_play.ogg";
        break;
      case ThemeSongs.playArea:
        asset += "pck404_cosy_bossa.ogg";
        break;
      case ThemeSongs.tutorial:
        asset += "pck404_cheerful_dub.ogg";
        break;
      case ThemeSongs.win:
        asset += "you_re_in_the_future.ogg";
        break;
      case ThemeSongs.lose:
        asset += "forever_lost.ogg";
        break;
      case ThemeSongs.credits:
        asset += "pck404_mirage_or_oasis.ogg";
        break;
      default:
    }
    return asset;
  }

  String _getRandomSoundType(SoundType type) {
    String sound;
    switch (type) {
      case SoundType.place:
        sound = placeSounds[Random().nextInt(placeSounds.length)];
        break;
      case SoundType.improve:
        sound = improveSounds[Random().nextInt(improveSounds.length)];
        break;
      case SoundType.special:
        sound = specialSounds[Random().nextInt(specialSounds.length)];
        break;
      case SoundType.select:
        sound = selectSounds[Random().nextInt(selectSounds.length)];
        break;
      case SoundType.click:
        sound = clickSounds[Random().nextInt(clickSounds.length)];
        break;
      case SoundType.win:
        sound = winSounds[Random().nextInt(winSounds.length)];
        break;
      case SoundType.lose:
        sound = loseSounds[Random().nextInt(loseSounds.length)];
        break;
      case SoundType.openHelp:
        sound = openHelpSounds[Random().nextInt(openHelpSounds.length)];
        break;
      case SoundType.closeHelp:
        sound = closeHelpSounds[Random().nextInt(closeHelpSounds.length)];
        break;
      case SoundType.open:
        sound = openSounds[Random().nextInt(openSounds.length)];
        break;
      case SoundType.close:
        sound = closeSounds[Random().nextInt(closeSounds.length)];
        break;
      case SoundType.logoOpen:
        sound = logoOpenSounds[Random().nextInt(logoOpenSounds.length)];
        break;
      default:
        sound = placeSounds[Random().nextInt(placeSounds.length)];
    }
    return "assets/$sound";
  }

  factory SoundController.fromJson(Map<String, dynamic> json) {
    final poliphony = json["poliphony"];
    return SoundController(
      json["musicVolume"],
      json["soundVolume"],
      json["helperVolume"],
      poliphony,
      json["activeAudioPlayer"],
      List.generate(poliphony, (index) => AudioPlayer()),
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json["musicVolume"] = musicVolume;
    json["soundVolume"] = soundVolume;
    json["helperVolume"] = helperVolume;
    json["poliphony"] = poliphony;
    json["activeAudioPlayer"] = activeAudioPlayer;
    return json;
  }
}
