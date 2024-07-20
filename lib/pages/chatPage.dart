import 'dart:convert';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:finalproject/widgets/massage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

HttpClient createHttpClient() {
  final HttpClient client = HttpClient()
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  return client;
}

final IOClient httpClient = IOClient(createHttpClient());

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  TextEditingController _controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Message> msgs = [];
  bool isTyping = false;
  String chatbotType = "match"; //match  gemini
  void sendMsg() async {
    String text = _controller.text;
    //String apiKey = "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";
    _controller.clear();
    try {
      if (text.isNotEmpty) {
        setState(() {
          msgs.insert(0, Message(true, text));
          isTyping = true;
        });
        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        // var response = await http.post(
        //     Uri.parse('https://uswahasana.ddns.net/chat/match'),
        //     headers: {
        //       'Content-Type': 'application/json',
        //       'USKSCH':'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77'
        //     },
        //     body: jsonEncode({
        //       'question':text
        //       // "model": "gpt-3.5-turbo",
        //       // "messages": [
        //       //   {"role": "user", "content": text}
        //       //]
        //     }));
        try {
          var requestBody = jsonEncode({'question': text});
          var response = await httpClient.post(
            Uri.parse(
              'https://192.168.1.100:3000/chat/$chatbotType',
            ),
            headers: {
              'Content-Type': 'application/json',
              'USKSCH':
                  'yXccy2jyLA8jCSzoo37ma6EWnk9V8E4lGubVBZs5vYB1vvBqgxcDfQpGRWmVUirX1UjdkdQoujqnERqSuJClugUCsi77'
            },
            body: requestBody,
          );
          print(response.statusCode);
          print("aaaaaaaa${response.body}");
          if (response.statusCode == 200) {
            print('success');
            var json = jsonDecode(response.body);
            setState(() {
              isTyping = false;
              msgs.insert(
                  0, Message(false, json["response"].toString().trimLeft()));
            });
            scrollController.animateTo(0.0,
                duration: const Duration(seconds: 1), curve: Curves.easeOut);
          }
        } catch (e) {
          print(e.toString());
        }
      }
    } on Exception {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Some error occurred, please try again!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey.shade300,
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                  height: heightR(80, context),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: msgs.length,
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: isTyping && index == 0
                                ? Column(
                                    children: [
                                      BubbleNormal(
                                        text: msgs[0].msg,
                                        isSender: true,
                                        color: Colors.blue.shade100,
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 16, top: 4),
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Typing...")),
                                      )
                                    ],
                                  )
                                : BubbleNormal(
                                    text: msgs[index].msg,
                                    isSender: msgs[index].isSender,
                                    color: msgs[index].isSender
                                        ? Colors.blue.shade100
                                        : Colors.grey.shade200,
                                  ));
                      }),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              controller: _controller,
                              textCapitalization: TextCapitalization.sentences,
                              onSubmitted: (value) {
                                sendMsg();
                              },
                              textInputAction: TextInputAction.send,
                              showCursor: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Chat by $chatbotType'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        sendMsg();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Color(0xff13a795),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: heightR(100, context),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF16A896),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightR(49.2, context),
                  left: widthR(20, context),
                  right: widthR(20, context)),
              child: Row(children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: widthR(97, context),
                ),
                Text(
                  "ChatBot",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeR(24, context),
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    _askedToLead();
                  },
                  icon: Image(
                      image:
                          AssetImage("assets/icons/Chatbot Chat Message.png")),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future openDialog() => showConfirmationDialog(
        context: context,
        title: 'Choose ChatBot type',
        actions: [
          AlertDialogAction(key: 0, label: 'Gemine'),
          AlertDialogAction(
              key: 1,
              label: 'Match',
              isDefaultAction: true,
              isDestructiveAction: true),
          AlertDialogAction(key: 2, label: 'AceGpt')
        ],
      );

  Future<void> _askedToLead() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          //print("\n\n\n\n$chatbotType\n");
          return SimpleDialog(
            title: const Text('Select Type'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    chatbotType = 'match';
                  });
                  Navigator.pop(context);
                },
                child: const Text('Match'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    chatbotType = 'gemini';
                  });
                  Navigator.pop(context);
                },
                child: const Text('Gemini'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  setState(() {
                    chatbotType = 'localbot';
                  });
                  Navigator.pop(context);
                },
                child: const Text('AceGpt'),
              ),
            ],
          );
        });
  }
}
