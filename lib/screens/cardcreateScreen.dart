import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:invitation_card/screens/secondscreen.dart';
import 'package:invitation_card/widgets/appcolors.dart' as AppColors;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _child;
  TextEditingController _controller = new TextEditingController();

  var controller;
  var text;
  var top = 10.0;
  var left = 10.0;
  int valueHolder = 20;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Invitation"),
          centerTitle: true,
          backgroundColor: AppColors.menu3Color),
      backgroundColor: AppColors.background,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Container()),
            ListTile(
              leading: Icon(Icons.next_plan),
              trailing: Text("secondScreen"),
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => SecondScreen()));
              },
            )
          ],
        ),
      ),
      extendBody: true,
      body: Container(
        // mainAxisSize: MainAxisSize.min,
        child: GestureDetector(
          // color: Colors.grey,
          // height: 300,
          // width: 300,
          child: Stack(
            children: [
              Positioned(
                top: top,
                left: left,
                child: Text(
                  "Drag Me...",
                  style:
                      TextStyle(fontSize: valueHolder.toDouble(), color: color),
                ),
              ),
              Positioned(
                top: top + 30,
                left: left + 30,
                child: Text(
                  "Drag Me-2...",
                  style:
                      TextStyle(fontSize: valueHolder.toDouble(), color: color),
                ),
              ),
            ],
          ),
          onVerticalDragUpdate: (DragUpdateDetails dd) {
            print(dd);
            setState(() {
              top = dd.localPosition.dy;
              left = dd.localPosition.dx;
            });
          },
        ),
      ),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              icon: Icons.add_outlined,
              backgroundColor: Colors.indigo,
              extras: {'label': "home"}),
          FluidNavBarIcon(
              icon: Icons.format_paint_outlined,
              backgroundColor: Color(0xFFEC4143),
              extras: {'label': "bookmark"}),
          FluidNavBarIcon(
              icon: Icons.font_download_outlined,
              backgroundColor: Color(0xFFFCBA02),
              extras: {'label': "partner"}),
          FluidNavBarIcon(
              icon: Icons.share,
              backgroundColor: Color(0xFF34A950),
              extras: {'label': "phone"}),
        ],
        onChange: _handleNavigationBarChange,
        style: FluidNavBarStyle(
            iconUnselectedForegroundColor: Colors.white,
            barBackgroundColor: AppColors.menu3Color),
        scaleFactor: 1.5,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }

  _handleNavigationBarChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = _addDialogue();
          break;
        case 1:
          _child = pickColor();
          break;
        case 2:
          _child = changeSize();
          break;
        case 3:
          _child = Container();
          break;
      }
    });
  }

  _addDialogue() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)), //this right here
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.close_outlined,
                          color: Colors.black,
                          size: 30,
                        )),
                  ),
                  Center(
                    child: Text("Add Text",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.030)),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: 'Enter something',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: AppColors.menu3Color),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: AppColors.loveColor),
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text("Add"),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          primary: AppColors.menu3Color,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildColorPicker() => ColorPicker(
      pickerColor: color,
      onColorChanged: (color) => setState(() {
            this.color = color;
          }));
  pickColor() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
                Center(
                  child: Text("Pick Color",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              MediaQuery.of(context).size.height * 0.030)),
                ),
                SizedBox(height: 20),
                buildColorPicker(),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Select")),
              ],
            ),
          ));
  changeSize() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Pick Size"),
          content: Center(
              child: Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Slider(
                    value: valueHolder.toDouble(),
                    min: 1,
                    max: 100,
                    divisions: 100,
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    label: '${valueHolder.round()}',
                    onChanged: (double newValue) {
                      setState(() {
                        valueHolder = newValue.round();
                      });
                    },
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()}';
                    })),
            Text(
              '$valueHolder',
              style: TextStyle(fontSize: 22),
            )
          ]))));
}
// Slider(
//                   value: valueHolder.toDouble(),
//                   min: 1,
//                   max: 100,
//                   divisions: 100,
//                   activeColor: Colors.green,
//                   inactiveColor: Colors.grey,
//                   label: '${valueHolder.round()}',
//                   onChanged: (double newValue) {
//                     setState(() {
//                       valueHolder = newValue.round();
//                     });
//                   },
//                   semanticFormatterCallback: (double newValue) {
//                     return '${newValue.round()}';
//                   }),
