import 'package:cubitapp/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
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

  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeCubitState>(
      listener: (context, state) {
        if (state is ThemeValueAddedState) {
          setState(() {
            currentValue += state.currentValue;
            values.add(
                "Значение: $currentValue, Тема: ${state.currentTheme.name}");
          });
        } else if (state is ThemeModeChangedState) {
          widget.changeMode(state.currentTheme);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                children: values.map((e) => Center(child: Text(e))).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () => context.read<ThemeCubit>().calculateTheme(
                      Theme.of(context).brightness == Brightness.light
                          ? ThemeMode.light
                          : ThemeMode.dark),
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () => context.read<ThemeCubit>().changeTheme(
                      Theme.of(context).brightness == Brightness.light
                          ? ThemeMode.dark
                          : ThemeMode.light),
                  child: Icon(Icons.theater_comedy),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
