<<<<<<< HEAD
import 'package:chat_bot/SpeechScreen.dart';
import 'package:chat_bot/api_services.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/chat_model.dart';
=======
import 'dart:convert';
import 'package:chat_bot/SpeechScreen.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/chat_model.dart';
import 'package:http/http.dart' as http;
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
import 'package:speech_to_text/speech_to_text.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var isListening = false;
  SpeechToText speechToText = SpeechToText();
  final List<ChatMessage> messages = [];
  String userInput = '';
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final scrollController = ScrollController();
  scrollMethod(){
    scrollController.animateTo(scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }


  @override
  Widget build(BuildContext context) {

<<<<<<< HEAD
=======
    void getChatBotRef() async {
      print(userInput);
      String apiUrl =
          'http://api.brainshop.ai/get?bid=175891&key=QttM520P9kyQGE1y&uid=12345&msg=[$userInput]';
      try {
        http.Response response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          String botResponse = response.body;
          print(botResponse);
          Map<String, dynamic> responseJson = json.decode(botResponse);
          String botResponseText = responseJson["cnt"];
          print(botResponse);
          setState(() {
            messages.add(
              ChatMessage(
                text: botResponseText,
                type: ChatMessageType.bot,
              ),
            );
            userInput = '';
          });
          Future.delayed(const Duration(milliseconds: 200), () {
            scrollMethod();
          });
        } else {
          messages.add(
            ChatMessage(
              text: 'Request failed with status: ${response.statusCode}',
              type: ChatMessageType.bot,
            ),
          );
        }
      // ignore: empty_catches
      } catch (e) {}
    }

>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ChatBot',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
<<<<<<< HEAD
=======
            // 处理返回按钮的操作
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
<<<<<<< HEAD
=======
                // color: Colors.grey[200],
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var chat = messages[index];
                    return ChatBubble(text: chat.text!, type: chat.type);
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              child: TextField(
                                controller: _textEditingController,
                                focusNode: _focusNode,
                                onChanged: (text) {
                                  setState(() {
                                    userInput = text;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type a message',
                                  contentPadding: EdgeInsets.all(10.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child: GestureDetector(
<<<<<<< HEAD
                                onTap: () async {
=======
                                onTap: () {
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
                                  if (userInput.isNotEmpty) {
                                    setState(() {
                                      messages.add(
                                        ChatMessage(
                                          text: userInput,
                                          type: ChatMessageType.user,
                                        ),
                                      );
                                      _textEditingController.clear();
                                      _focusNode.unfocus();
<<<<<<< HEAD
                                      Future.delayed(const Duration(milliseconds: 100), () {
                                        scrollMethod();
                                      });
                                    });
                                    var msg = await ApiServices.sendMessage(userInput);
                                    print(msg);
                                    setState(() {
                                      messages.add(ChatMessage(text: msg, type: ChatMessageType.bot,),);
                                    });
                                    Future.delayed(const Duration(milliseconds: 200), () {
                                      scrollMethod();
=======
                                      Future.delayed(const Duration(milliseconds: 200), () {
                                        scrollMethod();
                                      });
                                      getChatBotRef();
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
                                    });
                                  }
                                },
                                child: Container(
<<<<<<< HEAD
                                  width: double.infinity,
=======
                                  width: double.infinity, // 设置容器的宽度
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTapDown: (details) async {
                        if (!isListening) {
                          var available = await speechToText.initialize();
                          if (available) {
                            setState(() {
                              speechToText.listen(
                                onResult: (result) {
                                  setState(() {
                                    userInput = result.recognizedWords;
                                    print(userInput);
                                  });
                                },
                              );
                            });
                          }
                        }
                      },
                      onTapUp: (details) async {
                        speechToText.stop();
<<<<<<< HEAD
                        await Future.delayed(Duration(milliseconds: 100));
                        print(userInput);
                        setState(() {
                          messages.add(ChatMessage(text: userInput, type: ChatMessageType.user,),);
                        });
                        var msg = await ApiServices.sendMessage(userInput);
                        setState(() {
                          messages.add(ChatMessage(text: msg, type: ChatMessageType.bot,),);
                        });
                        Future.delayed(const Duration(milliseconds: 100), () {
                          scrollMethod();
                        });
                      },
                      child: Container(
=======
                        await Future.delayed(Duration(milliseconds: 500));
                        messages.add(
                          ChatMessage(
                            text: userInput,
                            type: ChatMessageType.user,
                          ),
                        );
                        getChatBotRef();
                      },
                      child: Container( // 设置容器的高度
>>>>>>> b5ea7970f6d219d369d0c24f14b17ec684842dee
                        child: FractionallySizedBox(
                          widthFactor: 0.8,
                          heightFactor: 0.8,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.mic,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Icon(Icons.message),
                        ),
                      ),
                  ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.mic),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SpeechScreen()),
                              );
                            },
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

  Widget ChatBubble({required String text, required ChatMessageType? type}) {
    return Align(
      alignment: type == ChatMessageType.user
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: type == ChatMessageType.user ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (type == ChatMessageType.bot)
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.radar),
                    backgroundColor: Colors.grey[400],
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            if (type == ChatMessageType.user)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.grey[400],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}