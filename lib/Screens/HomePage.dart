
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile/Screens/aboutUsScreen.dart';
import 'package:profile/Screens/achievmentScreen.dart';
import 'package:profile/Screens/clipScreen.dart';
import 'package:profile/Screens/goodStuffScreen.dart';
import 'package:profile/Screens/speakScreen.dart';
import 'package:profile/Screens/tafserScreen.dart';
import 'package:profile/constants/constants.dart';
import 'package:profile/mainScroller.dart';

import 'lifeScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];
  int? rowNumber;
  void getPostsData() {
    List<dynamic> responseList = achievement;
    List<Widget> listItems = [];
    responseList.forEach(
      (ListItems) {
        listItems.add(
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(100), blurRadius: 10.0),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return onTapFile(ListItems["newScreen"]);
                      },
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/${ListItems["image"]}",
                        fit: BoxFit.cover,
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ListItems["name"],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    setState(
      () {
        itemsData = listItems;
      },
    );
  }

  onTapFile(int index) {
    if (index == 0) {
      return Biography();
    } else if (index == 1) {
      return spScreen();
    } else if (index == 2) {
      return tafserScreen();
    } else if (index == 3) {
      return clipScreen();
    } else if (index == 4) {
      return achievScreen();
    } else if (index == 5) {
      return stuff();
    } else if (index == 6) {
      return aboutUs();
    }
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle:true,
          title:const Text(
            'شهید مولانا مجیب الرحمن انصاری (رح)',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          actions: [
            SizedBox(width: 10,),
            Icon(CupertinoIcons.chat_bubble_text),
            SizedBox(
              width: 4,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, rowNumber) {
                    double scale = 1.0;
                    if (topContainer > 0.5) {
                      scale = rowNumber + 0.5 - topContainer;
                      if (scale < 0) {
                        scale = 0;
                      } else if (scale > 1) {
                        scale = 1;
                      }
                    }
                    return GestureDetector(
                      onTap: () {
                        this.rowNumber = rowNumber;
                        debugPrint(rowNumber.toString());
                      },
                      child: Opacity(
                        opacity: scale,
                        child: Transform(
                          transform: Matrix4.identity()..scale(scale, scale),
                          alignment: Alignment.bottomCenter,
                          child: Align(
                              heightFactor: 0.7,
                              alignment: Alignment.topCenter,
                              child: itemsData[rowNumber]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
