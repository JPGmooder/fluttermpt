import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 10,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: ListTile(
              minLeadingWidth: 0,
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(360)),
                child: Image.asset("assets/chel2.png"),
              ),
              title: Text(
                "Good evening!",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              subtitle: Text(
                "Dan Smith",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            actions: [
              FloatingActionButton(
                elevation: 1,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                mini: true,
                onPressed: () => null,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              FloatingActionButton(
                elevation: 1,
                mini: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                onPressed: () => null,
                child: Stack(children: const [
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: 2,
                    right: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(360)),
                      child: ColoredBox(
                        color: Colors.amber,
                        child: SizedBox.square(
                          dimension: 10,
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
          body: Body()),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Tasks(tasksName: "My Weekly Tasks"),
              SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  children: [
                    InfoCard(
                      chips: [
                        Chip(
                          label: Text(
                            "UI/UX Design",
                            style: TextStyle(color: Colors.purple),
                          ),
                          backgroundColor: Colors.purple[200]!.withOpacity(0.5),
                        ),
                        Chip(
                          label: Text(
                            "High",
                            style: TextStyle(color: Colors.red),
                          ),
                          backgroundColor: Colors.red[200]!.withOpacity(0.5),
                        )
                      ],
                      time: "Mon, 12 July 2022",
                      title: "Create a Landing Page",
                      plusTimes: "3+",
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    InfoCard(
                        chips: [
                          Chip(
                            label: Text(
                              "Development",
                              style: TextStyle(color: Colors.orange),
                            ),
                            backgroundColor:
                                Colors.orange[200]!.withOpacity(0.5),
                          ),
                          Chip(
                            label: Text(
                              "Low",
                              style: TextStyle(color: Colors.green),
                            ),
                            backgroundColor:
                                Colors.green[200]!.withOpacity(0.5),
                          )
                        ],
                        time: "Mon, 30 July 2022",
                        plusTimes: "2+",
                        title: "Develop a             website"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Tasks(tasksName: "Today's Tasks"),
              HoriznotalCard(
                titleText: "Design 2 App Screens",
                subtitleText: "Crypto Wallet App",
                timeText: "Mon, 10 July",
                isCompleted: true,
              ),
              HoriznotalCard(
                titleText: "Design Homepage",
                subtitleText: "Company Website",
                timeText: "Mon, 17 July",
                isCompleted: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HoriznotalCard extends StatelessWidget {
  const HoriznotalCard(
      {Key? key,
      required this.subtitleText,
      required this.timeText,
      required this.titleText,
      required this.isCompleted})
      : super(key: key);
  final String titleText, subtitleText, timeText;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
        child: Column(children: [
          ListTile(
            horizontalTitleGap: 8,
            title: Text(
              titleText,
              textScaleFactor: 1.3,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decorationThickness: 2,
                  decoration: !isCompleted ? null : TextDecoration.lineThrough),
            ),
            subtitle: Text(subtitleText),
            trailing: !isCompleted
                ? null
                : ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(360)),
                    child: ColoredBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.indigo[300]!,
                    )),
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_month_rounded),
              SizedBox(
                width: 5,
                height: 5,
              ),
              Text(
                timeText,
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: 110,
                  height: 70,
                  child: Stack(children: [
                    ...List.generate(3, (index) {
                      String? pickedImage;
                      switch (index) {
                        case 0:
                          pickedImage = "assets/woman2.png";
                          break;
                        case 1:
                          pickedImage = "assets/woman3.png";

                          break;
                        case 2:
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
                                        "1+",
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
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class Tasks extends StatelessWidget {
  const Tasks({Key? key, required this.tasksName}) : super(key: key);
  final String tasksName;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: ListTile(
              title: Text(
                tasksName,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("18 Tasks Pending"),
            ),
          ),
          Spacer(),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => null,
              icon: Icon(Icons.settings_input_composite_rounded)),
          VerticalDivider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.grey,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => null,
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key,
      required this.chips,
      required this.time,
      required this.plusTimes,
      required this.title})
      : super(key: key);
  final List<Chip> chips;
  final String title;
  final String time;
  final String plusTimes;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: chips
                      .map((e) =>
                          Padding(padding: const EdgeInsets.all(3.0), child: e))
                      .toList()),
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: 200,
                  height: 70,
                  child: Stack(children: [
                    ...List.generate(3, (index) {
                      String? pickedImage;
                      switch (index) {
                        case 0:
                          pickedImage = "assets/woman2.png";
                          break;
                        case 1:
                          pickedImage = "assets/woman3.png";

                          break;
                        case 2:
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
                                        plusTimes,
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
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_month_rounded),
                  SizedBox(
                    width: 5,
                    height: 5,
                  ),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
