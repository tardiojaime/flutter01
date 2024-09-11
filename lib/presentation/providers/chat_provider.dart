import 'package:flutter/material.dart';
import 'package:hello_world_app/config/helpers/get_yes_no_answer.dart';
import 'package:hello_world_app/domain/entities/message.dart';

// que puede notificar cuando se tenga cambios al extender de ChangeNotifier
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messages = [
    Message(text: 'Hola bebe', fromwho: FromWho.me),
    Message(text: 'ops..', fromwho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    //Todo - por hacer en espanol
    final message = Message(text: text, fromwho: FromWho.me);
    messages.add(message);
    if (text.endsWith('?')) {
      await herReply();
    }
    // metodo de ChangeNotifier que notificara a todos los widgets que
    // la estan escuchando
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
