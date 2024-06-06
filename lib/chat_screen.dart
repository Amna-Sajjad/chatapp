import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = ChatMessage(text: text);
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: IconThemeData(color: Colors.green,),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: "Enter message"),
                  maxLines: 3,
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                )
            ),
            IconButton(
                onPressed: () => _handleSubmitted(_textController.text),
                icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0,),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
