import 'package:flutter/material.dart';
import 'package:hello_world_app/config/theme/app_theme.dart';
import 'package:hello_world_app/presentation/providers/chat_provider.dart';
import 'package:hello_world_app/presentation/screen/chat_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          //Tema instancia del AppThema  el metodo theme que retorna un tipo de ThemeData
          theme: AppTheme(selectedColor: 2).theme(),
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: const Chatscreen()),
    );
  }
}
