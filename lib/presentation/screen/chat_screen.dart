import 'package:flutter/material.dart';
import 'package:hello_world_app/domain/entities/message.dart';
import 'package:provider/provider.dart';
import 'package:hello_world_app/presentation/providers/chat_provider.dart';
import 'package:hello_world_app/presentation/screen/widgets/her_message_bubble.dart';
import 'package:hello_world_app/presentation/screen/widgets/my_message_bubble.dart';
import 'package:hello_world_app/presentation/screen/widgets/shared/message_field_box.dart';

class Chatscreen extends StatelessWidget {
  static const String url =
      'https://e00-telva.uecdn.es/imagenes/2015/11/27/celebrities/1448615201_extras_noticia_head_moviles_1.jpg';
  const Chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Love'),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(url),
            ),
          ),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messages[index];
                  return (chatProvider.messages[index].fromwho == FromWho.me)
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              //onValue: chatProvider.sendMessage,
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
