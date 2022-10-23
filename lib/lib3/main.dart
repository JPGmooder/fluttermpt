import 'package:flutter/material.dart';

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

  static const List<String> choiceList = [
    'All',
    'Bible in a Year',
    'Dailies',
    'Minutes',
    'November'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
         
          title: const Text(
            "Meditate",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            )
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: choiceList.length,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 5,
                    ),
                    itemBuilder: ((context, index) {
                      return ChoiceChip(
                          selectedColor: Color.fromRGBO(3, 158, 162, 1),
                          disabledColor: Color.fromRGBO(230, 254, 255, 1),
                          label: Text(
                            choiceList[index],
                            style: TextStyle(
                                color: index == 0
                                    ? Color.fromARGB(255, 255, 255, 255)
                                    : Color.fromRGBO(3, 158, 162, 1)),
                          ),
                          selected: index == 0);
                    }),
                  ),
                ),
              ),
              DefaultCard(
                isMain: true,
                title: "A song of moon",
                assetPath: "assets/pejzag.png",
                sub: "Start with basics",
                sessionText: "9 sessions",
                color: Colors.blueGrey,
              ),
              ...List.generate(2, (index) {
                late Widget childF;
                late Widget childS;
                switch (index) {
                  case 0:
                    childF = DefaultCard(
                      isMain: false,
                      title: "The sleep hour",
                      assetPath: "assets/pejzag.png",
                      sub: "Asha Mukhereje",
                      sessionText: "3 sessions",
                      color: Colors.orange,
                    );
                    childS = DefaultCard(
                      isMain: false,
                      title: "Easy on the Mission",
                      assetPath: "assets/pejzag.png",
                      sub: "Peter Mach",
                      sessionText: "5 minutes",
                      color: Colors.amber,
                    );
                    break;
                  case 1:
                    childS = DefaultCard(
                      isMain: false,
                      title: "Sun and Energy",
                      assetPath: "assets/pejzag.png",
                      sub: "Micheal Hiu",
                      sessionText: "3 sessions",
                      color: Colors.lightBlue,
                    );
                    childF = DefaultCard(
                      isMain: false,
                      title: "Relax with Me",
                      assetPath: "assets/pejzag.png",
                      sub: "Amanda James",
                      sessionText: "5 minutes",
                      color: Colors.teal,
                    );
                    break;
                  default:
                }
                return Row(
                  children: [
                    childF,
                    childS,
                  ],
                );
              })
            ],
          ),
        ));
  }
}

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {Key? key,
      required this.color,
      required this.assetPath,
      required this.title,
      required this.sub,
      required this.sessionText,
      required this.isMain})
      : super(key: key);
  final Color color;
  final String assetPath;
  final String title;
  final String sub;
  final String sessionText;
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isMain ? null : MediaQuery.of(context).size.height * 0.33,
      width: isMain ? null : MediaQuery.of(context).size.width * 0.5,
      child: Transform.scale(
        scale: isMain ? 1 : 0.9,
        child: Padding(
          padding: EdgeInsets.all(isMain ? 20.0 : 0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: ColoredBox(
                    color: color,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Image.asset(assetPath),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    // so here your custom shadow goes:
                    BoxShadow(
                      color: Colors.black.withAlpha(
                          20), // the color of a shadow, you can adjust it
                      spreadRadius:
                          -3, //also play with this two values to achieve your ideal result
                      blurRadius: 5,
                      offset: Offset(0,
                          5), // changes position of shadow, negative value on y-axis makes it appering only on the top of a container
                    ),
                  ],
                ),
                child: Card(
                  elevation: 0,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  margin: EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMain ? 25 : 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              sub,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: isMain ? 20 : 15),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              sessionText,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(),
                            Text(
                              "Start",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
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
