import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitation_card/widgets/appcolors.dart' as AppColors;

double _aspectRatio = 2;
List googleFonts = GoogleFonts.asMap().keys.toList();

class SecondScreen extends StatefulWidget {
  String imgpath;
  SecondScreen(this.imgpath);
  @override
  State<StatefulWidget> createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {
  List<Widget> ls = [];
  double _scalefactor = 1.0;
  var _child;
  int valueHolder = 20;
  Color color = Colors.red;
  var text;
  var Font = "Lato";

  var texter;
  double width = 100.0, height = 100.0;
  var position;
  var message;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    position = Offset(100.0, 100.0); //iniitial posoition of new texts

    // ls.add(
    //   textwid("custom", 2.0, position),
    // ); //just copy  and paste this to add more texts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: <Widget>[
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.imgpath), fit: BoxFit.fill),
                    // border: Border.all(
                    //   color: AppColors.menu2Color,
                    //   width: 8,
                    // ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Stack(children: ls)),
            ),
          ]),
        ),
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.add_outlined,
                backgroundColor: Colors.pinkAccent,
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
            iconSelectedForegroundColor: Colors.black,
            barBackgroundColor: Color.fromRGBO(0, 68, 102, 1),
          ),
          scaleFactor: 1.5,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ));
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
          _child = showBottomsheet();
          break;
        case 3:
          _child = Container();
          break;
      }
    });
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
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Select")),
              ],
            ),
          ));
  showBottomsheet() {
    showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        backgroundColor: Color.fromRGBO(0, 68, 102, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(38))),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Text("Pick A Font",
                            style: GoogleFonts.pacifico(
                                fontSize: 30,
                                color: AppColors.menu1Color,
                                letterSpacing: 0.5)),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70.0, top: 8),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              backgroundColor: AppColors.menu1Color,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_outlined,
                                color: Color.fromRGBO(0, 68, 102, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white38,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        crossAxisCount: 3,
                        childAspectRatio: _aspectRatio,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: googleFonts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, elevation: 2),
                            onPressed: () {
                              print(googleFonts[index].toString());
                              setState(() {
                                Font = googleFonts[index].toString();
                              });
                            },
                            child: Text(
                              googleFonts[index].toString(),
                              style: GoogleFonts.getFont(
                                googleFonts[index],
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
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
                    controller: _controller,
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
                        setState(() {
                          message = _controller.text.toString();
                          ls.add(
                            textwid(message, 2.0, position, color, Font),
                          );
                          Navigator.pop(context);
                          _controller.clear();
                        });
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
}

class textwid extends StatefulWidget {
  var text;

  var size;
  double width = 100.0, height = 100.0;
  Offset position;
  var color;
  String Font;
  textwid(this.text, this.size, this.position, this.color, this.Font);

  @override
  _textwidState createState() => _textwidState();
}

class _textwidState extends State<textwid> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx,
      top: widget.position.dy - widget.height + 20,
      child: Draggable(
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: FlatButton(
              onPressed: () {
                {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) => EditScreen(
                          this,
                          widget.text,
                          widget.size,
                          widget.color,
                          widget.Font)));
                }
              },
              onLongPress: () {
                print(widget.text);
              },
              child: Container(
                child: Text(
                  widget.text,
                  style: GoogleFonts.getFont(widget.Font,
                      fontSize: widget.size * 10.0, color: widget.color),
                ),
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        feedback: Container(
          child: Material(
            color: Colors.transparent,
            child: FlatButton(
              onPressed: () {
                {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) => EditScreen(
                          this,
                          widget.text,
                          widget.size,
                          widget.color,
                          widget.Font)));
                }
              },
              onLongPress: () {
                print(widget.text);
              },
              child: Container(
                child: Text(
                  widget.text,
                  style: GoogleFonts.getFont(widget.Font,
                      fontSize: widget.size * 10.0, color: widget.color),
                ),
                color: Colors.blue,
                //	width: width,
                //		height: height,
              ),
            ),
          ),
        ),
        childWhenDragging: Container(),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() => widget.position = offset);
        },
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  _textwidState parent;
  String text;
  double _value;
  Color color;
  String Font;
  EditScreen(this.parent, this.text, this._value, this.color, this.Font);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.text;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.menu3Color,
        title: Text("Edit Text"),
      ),
      backgroundColor: Colors.white.withOpacity(0.85), // th
      body: Material(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
              ),
            ),
            Slider(
                value: widget._value,
                min: 1.0,
                max: 10.0,
                divisions: 10,
                activeColor: Colors.red,
                inactiveColor: Colors.black,
                label: 'Set a value',
                onChanged: (double newValue) {
                  setState(() {
                    widget._value = newValue;
                    print(newValue);
                  });
                },
                semanticFormatterCallback: (double newValue) {
                  return '${newValue.round()} dollars';
                }),
            FloatingActionButton(
              backgroundColor: AppColors.menu3Color,
              onPressed: pickColor,
              child: Icon(Icons.format_paint_outlined),
            ),
            ElevatedButton(
                onPressed: () async {
                  await showBottomsheet();
                },
                child: Text("Choose Font")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.menu3Color),
              onPressed: () {
                this.widget.parent.setState(() {
                  this.widget.parent.widget.text = _controller.text;
                  this.widget.parent.widget.size = widget._value;
                  this.widget.parent.widget.color = widget.color;
                  this.widget.parent.widget.Font = widget.Font;
                  print("value of parent changed" +
                      this.widget.parent.widget.Font.toString());
                });

                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      ), //
    );
  }

  Widget buildColorPicker() => ColorPicker(
      pickerColor: widget.color,
      onColorChanged: (color) => setState(() {
            this.widget.color = color;
          }));
  pickColor() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Select")),
              ],
            ),
          ));
  showBottomsheet() {
    showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        backgroundColor: Color.fromRGBO(0, 68, 102, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(38))),
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Text("Pick A Font",
                            style: GoogleFonts.pacifico(
                                fontSize: 30,
                                color: AppColors.menu1Color,
                                letterSpacing: 0.5)),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 70.0, top: 8),
                          child: Container(
                            height: 35,
                            width: 35,
                            child: FloatingActionButton(
                              backgroundColor: AppColors.menu1Color,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_outlined,
                                color: Color.fromRGBO(0, 68, 102, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white38,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        crossAxisCount: 3,
                        childAspectRatio: _aspectRatio,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: googleFonts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, elevation: 2),
                            onPressed: () {
                              print(googleFonts[index].toString());
                              setState(() {
                                this.widget.Font =
                                    googleFonts[index].toString();
                                Navigator.pop(context);
                              });
                            },
                            child: Text(
                              googleFonts[index].toString(),
                              style: GoogleFonts.getFont(
                                googleFonts[index],
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }
}
