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
        padding: EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned.fill(
                        child: ColoredBox(
                      color: Colors.blue,
                    )),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          whalePngPath,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                    Positioned(
                      left: 15,
                      top: 15,
                      child: FloatingActionButton(
                        onPressed: () => null,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25,
                        ),
                        elevation: 0,
                        mini: true,
                        backgroundColor: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.28,
                      left: -MediaQuery.of(context).size.height * 0.08,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width + 100,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(460))),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      left: MediaQuery.of(context).size.width / 2.6,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Transform.scale(
                          scale: 2,
                          child: ElevatedButton(
                            onPressed: () => null,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                elevation: 0,
                                shape: CircleBorder(),
                                side: BorderSide(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    width: 5)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: MediaQuery.of(context).size.width / 7.5,
                        child: Text(
                          "Secrets of Atlantis",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              OutlinedButton(
                  onPressed: () => null,
                  style: OutlinedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      side: BorderSide(
                        color: Colors.orange,
                      )),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Follow"),
                  )),
              Card(
                color: cardColor,
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 55,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(360)),
                              child: Image.asset(
                                "assets/woman1.jpg",
                                fit: BoxFit.fill,
                              )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Codin",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Card(
                              color: bottomCardColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  "Host",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text:
                                    "The Secrets of Atlantis podcast is designed for all fantasy enthusiasts, everything from debunking underwat...",
                                style: TextStyle(color: Colors.white),
                              ),
                              WidgetSpan(
                                  child: GestureDetector(
                                child: Text(
                                  " See more..",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () => print("Нажал"),
                              ))
                            ]),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                            3,
                            (index) => index == 1
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.circle,
                                        size: 5, color: Colors.white))
                                : Card(
                                    color: bottomCardColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: index == 0
                                        ? Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(children: [
                                              Text(
                                                "4.8",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Icon(Icons.star_border_rounded,
                                                  color: Colors.white),
                                              Text(
                                                "(10)",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ]),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Fantasy",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))),
                        Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ]),
              ),
              Card(
                margin: EdgeInsets.all(0),
                color: bottomCardColor,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Stack(children: [
                          ...List.generate(5, (index) {
                            String? pickedImage;
                            switch (index) {
                              case 0:
                                pickedImage = "assets/woman2.png";
                                break;
                              case 1:
                                pickedImage = "assets/woman3.png";

                                break;
                              case 2:
                                pickedImage = "assets/woman4.png";

                                break;
                              case 3:
                                pickedImage = "assets/woman5.png";

                                break;
                              case 4:
                                break;
                              default:
                            }
                            return Positioned(
                              left: 10 + index * 28,
                              top: 20,
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(999)),
                                  child: SizedBox.square(
                                    dimension: 40,
                                    child: pickedImage == null
                                        ? Container(
                                            color: Colors.orange,
                                            child: Center(
                                                child: Text(
                                              "+10",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                          )
                                        : Image.asset(pickedImage),
                                  )),
                            );
                          })
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.live_tv,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Live",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Card(
                  color: Colors.amber[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.red,
                            )),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  "Invite your friends to join",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  textScaleFactor: 1.3,
                                ),
                              ),
                              Icon(Icons.share)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
