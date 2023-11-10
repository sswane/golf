import 'package:flutter/material.dart';
import 'package:golf/app_state.dart';
import 'package:golf/course/course_info.dart';
import 'package:golf/player/add_player.dart';
import 'package:golf/player/list_players.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
            title: 'Golf',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Scaffold(
                appBar: AppBar(title: const Text('Golf')),
                body: const MyHomePage())));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
        child: ListView(padding: const EdgeInsets.all(20.0), children: [
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        ElevatedButton(
            onPressed: appState.players.length > 1
                ? () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CourseInfo()));
                  }
                : null,
            child: const Text('Add Course Info')),
      ]),
      const AddPlayer(),
      const ListPlayers()
    ]));
  }
}
