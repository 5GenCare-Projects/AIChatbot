import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech{

  static FlutterTts tts = FlutterTts();

  static initTTS() async{
    tts.setLanguage("en-US");
  }

  static speak(String text) async {
    tts.setStartHandler(() {
      print("TTS IS STARTED");
    });

    tts.setCompletionHandler(() {
      print("COMPLETE");
    });

    tts.setErrorHandler((message) {
      print(message);
    });

    await tts.awaitSpeakCompletion(true);

    tts.speak(text);
}

}