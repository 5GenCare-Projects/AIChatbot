import 'package:chat_bot/tts.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/SpeechScreen.dart';
import 'package:chat_bot/TextChatScreen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  TextToSpeech.initTTS();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speech to Text Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
<<<<<<< HEAD
      home: ChatPage(),
=======
      home: SpeechScreen(),
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
    );
  }
}
