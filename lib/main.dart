import 'package:bloc_state_management/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.toBlue);
              },
              backgroundColor: Colors.blue,
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.toAmber);
              },
              backgroundColor: Colors.amber,
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('BLoC State Management'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: colorBloc.stateStream,
                  initialData: Colors.blue,
                  builder: (context, snapshot) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 100,
                    height: 100,
                    color: snapshot.data as Color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
