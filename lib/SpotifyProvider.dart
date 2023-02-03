import 'dart:io';
import 'dart:typed_data';
import 'package:spotify_run_kt/UserPreferences.dart';
import 'package:spotify_run_kt/provider_utility.dart';
import 'package:spotify_sdk/models/player_options.dart' as player_options;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spotify_sdk/models/image_uri.dart';

import 'package:spotify_sdk/models/player_restrictions.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/models/track.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

import 'Constants.dart';


// Stream<PlayerState>? playerStateStream;


class SpotifyProvider extends ChangeNotifier {
  bool showPlayer = false;
  bool authenticationTried = false;
  ImageUri? currentTrackImageUri;
  late Widget oldImage;
  String clientId="00062cf894414e29b5158c040fbc96b5";
  String callBackUrlSpotify = 'spotify-ios-quick-start://spotify-login-callback';


  PlayerState playerState = PlayerState(
    null,
    1,
    0,
    player_options.PlayerOptions(player_options.RepeatMode.off, isShuffling: false),
    PlayerRestrictions(canSkipNext: true, canSkipPrevious: true, canRepeatTrack: true, canRepeatContext: true, canToggleShuffle: true, canSeek: true),
    isPaused: false,
  );
  Track? track;
  initSpotify() async{
    print("Init Spotify");
    try{
      bool result = false;
      if(Platform.isAndroid || UserPreferences.spotifyToken.isEmpty){
        result = await SpotifySdk.connectToSpotifyRemote(
          clientId: clientId,
          // redirectUrl: 'https://ansariacademy.com/Run-With-KT/spotify.php'
          redirectUrl: callBackUrlSpotify,
        );
        print("Init Spotify if ${result}");
      }
      else{
        //00062cf894414e29b5158c040fbc96b5
        result = await SpotifySdk.connectToSpotifyRemote(
          clientId: clientId,
          accessToken: UserPreferences.spotifyToken,
          //  redirectUrl: 'https://ansariacademy.com/Run-With-KT/spotify.php'
          redirectUrl: callBackUrlSpotify,
        );

        print("Init Spotify else ${result}");
      }

      if(!result && !authenticationTried){
        getAccessToken().then((value) {
          print(value);
          authenticationTried = true;
          initSpotify();
        });
      } else if(result){
        showPlayer = true;
        hiveBox.put(Constants.keyShowSpotifyPlayer, true);
        refreshStream();
      } else{
        print('Spotify could not be initiated');
      }
    } on PlatformException catch (e) {
      //  initSpotify();
      print('Spotify could not be initiated');
      showToast("Please Install Spotify App");
      print(e);
    } on MissingPluginException {
      print('error spotify');
    }
  }

  refreshStream(){
    print('subscribing spotify stream...');
    // playerStateStream = SpotifySdk.subscribePlayerState();
    notifyListeners();
  }

  Future<String> getAccessToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAccessToken(
          clientId: clientId,
          //redirectUrl: 'https://ansariacademy.com/Run-With-KT/spotify.php',
          //    redirectUrl: 'https://evam.handabots.com/',
          redirectUrl: callBackUrlSpotify,
          scope: 'app-remote-control, '
              'user-modify-playback-state, '
              'playlist-read-private, '
              'playlist-modify-public, '
              'user-read-currently-playing');
      print("autientication token is ${authenticationToken}");
      return authenticationToken;
    } on PlatformException catch (e) {
      return Future.error('$e.code: $e.message');
    } on MissingPluginException {
      return Future.error('not implemented');
    }
  }

  Future<void> disconnect() async {
    try {
      var result = await SpotifySdk.disconnect();
      if(result){
        showPlayer = false;
        hiveBox.put(Constants.keyShowSpotifyPlayer, true);
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print(e);
    } on MissingPluginException {
      print('error spotify');
    }
  }

  Future<void> pause() async {
    try {
      await SpotifySdk.pause();
      notifyListeners();
    } on PlatformException catch (e) {
      resume();
    } on MissingPluginException {

    }
  }

  Future<void> resume() async {
    try {
      await SpotifySdk.resume();
      notifyListeners();
    } on PlatformException catch (e) {
      pause();
    } on MissingPluginException {

    }
  }

  Future<void> skipNext() async {
    try {
      await SpotifySdk.skipNext();
    } on PlatformException catch (e) {

    } on MissingPluginException {

    }
  }

  Future<void> skipPrevious() async {
    try {
      await SpotifySdk.skipPrevious();
    } on PlatformException catch (e) {

    } on MissingPluginException {

    }
  }

  Widget spotifyImageWidget(ImageUri image) {
    return FutureBuilder(
        future: SpotifySdk.getImage(
          imageUri: image,
          dimension: ImageDimension.large,
        ),
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            oldImage = Image.memory(snapshot.data!, height: 90, width: screenWidth, fit: BoxFit.cover,);
            currentTrackImageUri = image;
            return oldImage;
          } else if (snapshot.hasError) {

            return Text('');
          } else {
            return Text('');
          }
        });
  }

}