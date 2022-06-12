import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:examples/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {
  List<ChatMessage> messages = media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media example'),
      ),
      body: DashChat(
        currentUser: user,
        inputOptions: InputOptions(
          trailing: <Widget>[
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 12),
                  icon: const Icon(Icons.camera),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
        onSend: (ChatMessage m) {
          setState(() {
            messages.insert(0, m);
          });
        },
        messages: messages,
      ),
    );
  }
}
