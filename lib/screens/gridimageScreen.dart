import 'dart:convert';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitation_card/screens/secondscreen.dart';
import 'package:invitation_card/widgets/appcolors.dart' as AppColors;

double ScaleFactor = 1.0;
var height, width;

class gridImageScreen extends StatefulWidget {
  const gridImageScreen({Key? key}) : super(key: key);

  @override
  _gridImageScreenState createState() => _gridImageScreenState();
}

class _gridImageScreenState extends State<gridImageScreen> {
  var bannerImages;
  final List<String> gridImages = [
    'assets/images/backhd1.jpg',
    'assets/images/backhd2.jpg',
    'assets/images/backhd3.jpg',
    'assets/images/backhd4.jpg',
    'assets/images/backhd5.jpg',
    'assets/images/backhd6.jpg',
    'assets/images/backhd7.jpg',
    'assets/images/backhd8.jpg',
  ];
  readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/bannerimages.json")
        .then((s) => {
              setState(() {
                bannerImages = json.decode(s);
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 68, 102, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Invitation",
            style: GoogleFonts.pacifico(
                fontSize: 30, color: Colors.white, letterSpacing: 0.5)),
        centerTitle: true,
        elevation: 0,

        // leading: Icon(Icons.menu_outlined),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 36,
              height: 36,
              child: Icon(
                Icons.notifications,
                color: AppColors.menu1Color,
              ),
            ),
          )
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Drawer(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Column(
                  children: [
                    // Image.asset(
                    //   'asset/images/drawinglogo.png',
                    //   height: 150,
                    //   width: 200,
                    // ),
                    DrawerHeader(
                        child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width * 0.7,
                          color: Colors.amber,
                        ),
                        Text(
                          "Invitation",
                          style: GoogleFonts.pacifico(
                              //fontStyle: FontStyle.italic,
                              fontSize: 30,
                              letterSpacing: 0.5,
                              color: Color.fromRGBO(0, 68, 102, 1)),
                        ),
                      ],
                    ))
                  ],
                ),
                Divider(
                  thickness: 3,
                  color: Color.fromRGBO(0, 68, 102, 1),
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined, color: Colors.black),
                  trailing: Text(
                    "Home",
                    style: GoogleFonts.mcLaren(
                        //fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                gridImageScreen()));
                  },
                ),
                Divider(
                  thickness: 3,
                  color: Color.fromRGBO(0, 68, 102, 1),
                ),
                ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.black),
                  trailing: Text(
                    "About Us",
                    style: GoogleFonts.mcLaren(
                        //fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  onTap: () {
                    //Navigator.of(context).restorablePush(_dialogBuilder);
                  },
                ),
                Divider(
                  thickness: 3,
                  color: Color.fromRGBO(0, 68, 102, 1),
                ),
                ListTile(
                  leading: Icon(Icons.share_outlined, color: Colors.black),
                  trailing: Text(
                    "Share",
                    style: GoogleFonts.mcLaren(
                        //fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  onTap: () {
                    //Share.share("https://github.com/KinnariDabgar");
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child:
                              Icon(Icons.favorite_outline, color: Colors.red)),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Designed By Kinnari",
                            style: GoogleFonts.mcLaren(
                                //fontStyle: FontStyle.italic,
                                fontSize: 15,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Container(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              left: -15,
                              right: 0,
                              child: Container(
                                height: 180,
                                child: PageView.builder(
                                    controller:
                                        PageController(viewportFraction: 0.9),
                                    itemCount: bannerImages == null
                                        ? 0
                                        : bannerImages.length,
                                    itemBuilder: (_, i) {
                                      return Container(
                                        height: 180,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    bannerImages[i]['image']))),
                                      );
                                    }),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Center(
                          child: Text("Pick Background",
                              style: GoogleFonts.pacifico(
                                fontSize: 30,
                                color: AppColors.background,
                                letterSpacing: 0.6,
                              ))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: (2 / 3),
                            ),
                            itemCount: gridImages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  child: BouncingWidget(
                                scaleFactor: ScaleFactor,
                                onPressed: () {
                                  print(
                                      "Kinu: " + gridImages[index].toString());
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SecondScreen(gridImages[index]
                                                    .toString())));
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image:
                                                AssetImage(gridImages[index]),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ));
                            }))
                  ],
                ),
              ))),
    );
  }
}
