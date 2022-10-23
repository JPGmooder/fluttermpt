import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uchebaf/lib1/consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: ColoredBox(
                    color: Colors.amber,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset("assets/pejzag.png"),
                    )),
              ),
            ),
          ),
          Text(
            "Peter Mach",
            style: TextStyle(color: Colors.grey),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Mind Deep Relax",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Join the Community as we prepare over 33 days to relax and feel joy with the mind and happnies session across the World.",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: ElevatedButton(
              onPressed: () => null,
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Color.fromRGBO(3, 158, 162, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.play_arrow_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Play Next Session', textScaleFactor: 1.3),
                  ],
                ),
              ),
            ),
          ),
          ...List.generate(6, (index) {
            if (index % 2 != 0) {
              return const Divider(
                height: 5,
              );
            } else {
              Color? color;
              late String title;
              switch (index ~/ 2) {
                case 0:
                  title = "Sweet Memories";
                  break;
                case 1:
                  title = "A Day Dream";

                  color = Color.fromRGBO(3, 158, 162, 1);
                  break;
                case 2:
                  title = "Mind Explore";

                  color = Colors.orange;
                  break;
                default:
              }
              return ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'December 29 Pre-Launch',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.more_horiz,
                  size: 30,
                ),
                leading: SizedBox.square(
                  dimension: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14)))),
                    onPressed: () => null,
                    child: Icon(Icons.play_arrow_outlined),
                  ),
                ),
              );
            }
          })
        ],
      ),
    ));
  }
}
