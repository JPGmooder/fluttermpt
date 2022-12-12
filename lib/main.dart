import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode currentMode;
  @override
  void initState() {
    currentMode = ThemeMode.system;
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("CurrentModeLight")) {
        setState(() {
          currentMode = value.getBool("CurrentModeLight")!
              ? ThemeMode.light
              : ThemeMode.dark;
        });
      } else {
        value.setBool("CurrentModeLight",
            Theme.of(context).brightness == Brightness.light);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      themeMode: currentMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: FirstScreen(
            changeTheme: (themeMode) => setState(() {
              currentMode = themeMode;
              SharedPreferences.getInstance().then((value) {
                value.setBool(
                    "CurrentModeLight", currentMode == ThemeMode.light);
              });
            }),
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey("text")) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => SecondScreen(
                    changeTheme: widget.changeTheme,
                  ),
              settings: RouteSettings(arguments: value.getString("text"))),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ThemeChanger(
        changeTheme: widget.changeTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                  controller: controller,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    SharedPreferences.getInstance().then((value) {
                      value.setString("text", controller.text);
                    });
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => SecondScreen(
                              changeTheme: widget.changeTheme,
                            ),
                        settings: RouteSettings(arguments: controller.text)),
                  );
                },
                child: Text("Переход"))
          ],
        ),
      ),
    );
  }
}

class ThemeChanger extends StatefulWidget {
  const ThemeChanger({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;

  @override
  State<ThemeChanger> createState() => _ThemeChangerState();
}

class _ThemeChangerState extends State<ThemeChanger> {
  late StreamController<ThemeMode> _pushController;

  @override
  void initState() {
    _pushController = StreamController<ThemeMode>();
    _pushController.stream
        .debounceTime(Duration(milliseconds: 300))
        .listen((event) {
      widget.changeTheme(event);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      _pushController.add(Theme.of(context).brightness == Brightness.light
          ? ThemeMode.dark
          : ThemeMode.light);
    });
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.changeTheme}) : super(key: key);
  final void Function(ThemeMode) changeTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ThemeChanger(changeTheme: changeTheme),
      body: Center(
          child: Text(
              (ModalRoute.of(context)?.settings.arguments as String?) ?? "")),
    );
  }
}
