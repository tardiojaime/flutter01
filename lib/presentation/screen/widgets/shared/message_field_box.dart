import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue; //
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    // para acceder al texto
    final textController = TextEditingController();
    // asignar foco
    final foucusNode = FocusNode();
    final inputdecoration = InputDecoration(
        hintText: 'End your message with a  "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: false, //filled = lleno
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              //menejo de valot
              onValue(textValue);
              //foucusNode.requestFocus();
              textController.clear();
            },
            icon: const Icon(Icons.send_outlined)));
    return TextFormField(
      // click fuera del text field
      onTapOutside: (event) {
        foucusNode.unfocus();
      },
      focusNode: foucusNode,
      // asignamos el controlador de text
      controller: textController,
      decoration: inputdecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        onValue(value);
        //foucusNode.requestFocus();
      },
    );
  }
}
