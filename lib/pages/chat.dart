import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // input text controller
  final TextEditingController _controller = TextEditingController();
  final openAI = OpenAI.instance.build(
      token: 'YOUR_API_KEY',
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      isLog: true);

  List<Map<String, String>> _chat = [{}];

  void chat() {
    debugPrint('chat-1');
    final request = ChatCompleteText(
        messages: _chat, maxToken: 200, model: ChatModel.chatGptTurboModel);
    debugPrint('chat-2');
    openAI.onChatCompletionSSE(request: request).listen((data) {
      debugPrint('chat-3');
      setState(() {
        _chat.add({'content': data.choices[0].message!.content , 'role': 'bot'});
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 640.0,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // main chat display
                        Container(
                          height: 400,
                          child: ListView.builder(
                            itemCount: _chat.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(_chat[index]['content'] ?? ''),
                                subtitle: Text(_chat[index]['role'] ?? ''),
                              );
                            },
                          ),
                        ),
                        //input
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message',
                          ),
                        ),
                        // send button
                        ElevatedButton(
                          onPressed: () {
                            debugPrint('sub-2');
                            var text = _controller.text;
                            debugPrint('sub-1');
                            setState(() {
                              _chat.add({'content': text, 'role': 'user'});
                            });
                            debugPrint('sub-0');
                            chat();
                          },
                          child: const Text('Send'),
                        ),
                      ],
                    )))));
  }
}
