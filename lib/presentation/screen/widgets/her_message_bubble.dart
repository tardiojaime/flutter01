//bobble -> burbuja
import 'package:flutter/material.dart';
import 'package:hello_world_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //obtiene el tema establecido globalmente en el main.dart -> app_theme
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message.text,
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        _ImageBubble(url: message.imageUrl!), // ?? '',
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String url;

  const _ImageBubble({required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        // tiempo de carga, context = contexto actual del widget,  child = imagen, loadingProgress nivel de carga de la img
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            child: Text('cargando imagen'),
          );
        },
      ),
    );
  }
}
