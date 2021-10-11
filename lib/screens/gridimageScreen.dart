import 'dart:convert';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitation_card/screens/secondscreen.dart';
import 'package:invitation_card/widgets/appcolors.dart' as AppColors;

double ScaleFactor = 1.0;

class gridImageScreen extends StatefulWidget {
  const gridImageScreen({Key? key}) : super(key: key);

  @override
  _gridImageScreenState createState() => _gridImageScreenState();
}

class _gridImageScreenState extends State<gridImageScreen> {
  var bannerImages;
  final List<String> gridImages = [
    'assets/images/back1.jpeg',
    'assets/images/back2.jpeg',
    'assets/images/back3.jpeg',
    'assets/images/back4.jpeg',
    'assets/images/back5.jpeg',
    'assets/images/back6.jpeg',
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 68, 102, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Invitation",
            style: GoogleFonts.pacifico(
                fontSize: 30, color: Colors.white, letterSpacing: 0.5)),
        centerTitle: true,
        elevation: 0,
        leading: Icon(Icons.menu_outlined),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
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
      body: SafeArea(
          child: Container(
              child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: -20,
                      right: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                            controller: PageController(viewportFraction: 0.9),
                            itemCount:
                                bannerImages == null ? 0 : bannerImages.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: (3 / 3),
                    ),
                    itemCount: gridImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: BouncingWidget(
                        scaleFactor: ScaleFactor,
                        onPressed: () {
                          print("Kinu: " + gridImages[index].toString());
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SecondScreen(
                                            gridImages[index].toString())));
                          });
                        },
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(gridImages[index]),
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
