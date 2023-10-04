import 'package:avatar_glow/avatar_glow.dart';
import 'package:chat_bot/TextChatScreen.dart';
import 'package:chat_bot/api_services.dart';
import 'package:chat_bot/tts.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  SpeechScreen({super.key});
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();
  var isListening = false;
  static const bgColor = Color(0xff00A67E);
  String userInput = "";

  @override
  Widget build(BuildContext context) {

    void processSpeech() async {
      await Future.delayed(Duration(milliseconds: 500));
      var msg = await ApiServices.sendMessage(userInput);
      print(msg);
      TextToSpeech.speak(msg);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ChatBot",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue[50],
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.9,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Center(
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          heightFactor: 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Center(
                              child: FractionallySizedBox(
                                widthFactor: 0.9,
                                heightFactor: 0.9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 1),
                                  ),
                                  child: Center(
                                    child: Image.asset('assets/helper.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Welocome',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'What can i do for u?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: AvatarGlow(
                    endRadius: 75.0,
                    animate: isListening,
                    duration: Duration(milliseconds: 2000),
                    glowColor: bgColor,
                    repeat: true,
                    repeatPauseDuration: Duration(milliseconds: 100),
                    showTwoGlows: true,
                    child: GestureDetector(
                      onTapDown: (details) async {
                        if (!isListening) {
                          var available = await speechToText.initialize();
                          if (available) {
                            setState(() {
                              isListening = true;
                              speechToText.listen(
                                  onResult: (result) {
                                    setState(() {
                                      userInput = result.recognizedWords;
                                      print(userInput);
                                    });
                                  }
                              );
                            });
                          }
                        }
                      },
                      onTapUp: (details) {
                        setState(() {
                          isListening = false;
                        });
                        speechToText.stop();
                        processSpeech();
                      },
                      child: CircleAvatar(
                        backgroundColor: bgColor,
                        radius: 35,
                        child: Icon(Icons.mic, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        heightFactor: 0.7,
                        child: Container(
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.message),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ChatPage()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FractionallySizedBox(
                        widthFactor: 0.7,
                        heightFactor: 0.7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.mic),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}