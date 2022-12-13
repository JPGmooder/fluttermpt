import 'dart:async';

import 'package:cubitapp/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  ThemeMode currentMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: currentMode,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: 'Material App',
      home: Scaffold(
        body: BlocProvider(
          create: (context) => ThemeCubit(),
          child: BodyWidget(
            changeMode: (currentMode) => setState(() {
              this.currentMode = currentMode;
            }),
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  BodyWidget({Key? key, required this.changeMode}) : super(key: key);
  void Function(ThemeMode currentMode) changeMode;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  List<String> values = [];
  late Timer _timer;
  SharedPreferences? currentPrefs;
  int currentValue = 0;

  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      if (value.containsKey('theme')) {
        context
            .read<ThemeCubit>()
            .changeTheme(ThemeMode.values[value.getInt('theme')!]);
      }
      if (value.containsKey("count")) {
        setState(() {
          currentPrefs = value;
          values = value.getStringList("count")!;
          currentValue = value.getInt("value")!;
        });
      }
    });
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      context.read<ThemeCubit>().calculateTheme(
          Theme.of(context).brightness == Brightness.light
              ? ThemeMode.light
              : ThemeMode.dark,
          false);
    });
    super.initState();
  }

  Timer getTimer() => Timer.periodic(Duration(seconds: 5), (timer) {
        context.read<ThemeCubit>().calculateTheme(
            Theme.of(context).brightness == Brightness.light
                ? ThemeMode.light
                : ThemeMode.dark,
            false);
      });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeCubitState>(
      listener: (context, state) {
        if (state is ThemeValueAddedState) {
          setState(() {
            currentValue += state.currentValue;
            values.add(
                "Значение: $currentValue, Тема: ${Theme.of(context).brightness.name}");
          });

          currentPrefs?.setStringList("count", values);
          currentPrefs?.setInt("value", currentValue);
        } else if (state is ThemeModeChangedState) {
          widget.changeMode(state.currentTheme);
          currentPrefs?.setInt("theme", state.currentTheme.index);
        }
      },
      child: Stack(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: ListView(
                clipBehavior: Clip.none,
                children:
                    values.reversed.map((e) => Center(child: Text(e))).toList(),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ColoredBox(
              color: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              _timer.cancel();
                              _timer = getTimer();
                              context.read<ThemeCubit>().calculateTheme(
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ThemeMode.light
                                      : ThemeMode.dark,
                                  false);
                            },
                            child: Icon(Icons.add)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FloatingActionButton(
                            onPressed: () {
                              _timer.cancel();
                              _timer = getTimer();
                              context.read<ThemeCubit>().calculateTheme(
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? ThemeMode.light
                                      : ThemeMode.dark,
                                  true);
                            },
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      currentValue.toString(),
                      textScaleFactor: 2,
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        FloatingActionButton(
                          onPressed: () => context
                              .read<ThemeCubit>()
                              .changeTheme(Theme.of(context).brightness ==
                                      Brightness.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light),
                          child: Icon(Icons.change_circle),
                        ),
                        if (currentPrefs != null &&
                            currentPrefs!.containsKey("count"))
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: FloatingActionButton(
                              onPressed: () {
                                currentPrefs!.clear();
                                setState(() {
                                  values.clear();
                                  currentValue = 0;
                                  _timer.cancel();
                                  _timer = getTimer();
                                });
                              },
                              child: Icon(Icons.delete),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
