import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  // Una vez que se crea la clase crea un estado y luego llama a la otra clase
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// state <Clase de la que ba a manejar el stado>
class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Counter scree'))),
      body: Center(
        //center -> centra el contenido
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centra en el eje y
          children: [
            Text(
              '$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              (clickCounter == 1) ? 'Click' : 'Clicks',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // vuelve a renderizar el widget
          setState(() {
            clickCounter++;
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
