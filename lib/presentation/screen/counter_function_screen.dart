import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  // Una vez que se crea la clase crea un estado y luego llama a la otra clase
  @override
  State<CounterFunctionScreen> createState() => _CounterScreenState();
}

// state <Clase de la que ba a manejar el stado>
class _CounterScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter function'),
          //leading: const Icon(Icons.refresh_rounded),// al lado izquierda
          actions: [
            IconButton(
                onPressed: () {
                  clickCounter = 0;
                  setState(() {});
                },
                icon: const Icon(Icons.refresh_rounded))
          ],
        ),
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
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          // por defecto empieza en el top
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ActionButtonCustom(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
            const SizedBox(height: 10),
            ActionButtonCustom(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                if (clickCounter == 0) return;
                setState(() {
                  clickCounter--;
                });
              },
            ),
            const SizedBox(height: 10),
            ActionButtonCustom(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
          ],
        ));
  }
}

class ActionButtonCustom extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const ActionButtonCustom({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(), // clase para crear border redondeados
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
