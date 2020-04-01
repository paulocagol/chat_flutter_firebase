import 'package:flutter/material.dart';

class TextComposer extends StatefulWidget {
  

  TextComposer(this.sendMessage);

  Function(String text) sendMessage;
  
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration:
                  InputDecoration.collapsed(hintText: 'Enviar uma Mensagem...'),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text);
                _resetMessage();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing ? () {
              widget.sendMessage(_messageController.text);
              _resetMessage();

            } : null,
          ),
        ],
      ),
    );
  }

  void _resetMessage() {
    _messageController.clear();
    
    setState(() {
      _isComposing = false;
    });
  }
}
