import 'dart:math';

import 'package:auora_container/detailedview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent a boat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Lato"
      ),
      home: AuoraContainer()
    );
  }
}

class AuoraContainer extends StatefulWidget {
  @override
  _AuoraContainerState createState() => _AuoraContainerState();
}

class _AuoraContainerState extends State<AuoraContainer> {

  ScrollController _controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(LineIcons.bars),
                    onPressed: () { print("Pressed"); }
                ),
                IconButton(
                    icon: Icon(LineIcons.user),
                    onPressed: () { print("Pressed"); }
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rent a boat", style: TextStyle(fontSize: 32, color: Color(0xFF313343))),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      labelText: 'Search',
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                // double scale = 1.0;
                // if (topContainer > 0.5) {
                //   scale = topContainer;
                //
                //   if (scale < 0) {
                //     scale = 0;
                //   } else if (scale > 1) {
                //     scale = 1;
                //   }
                // }
                return GestureDetector(
                  onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailView(index: index)),
                      );
                    },
                  child: ListContainer(index),
                );

                // return Opacity(  tag: "new$index",
                //   opacity: scale,
                //   child: Transform(
                //     transform:  Matrix4.identity()..scale(scale,scale),
                //     alignment: Alignment.bottomCenter,
                //     child: Align(
                //         alignment: Alignment.topCenter,
                //         child: ListContainer()),
                //   ),
                // );

              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    ));
  }

  Widget ListContainer(int index)
  {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const SizedBox(
          height: 216,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.amber,
        ),
        Hero(
          tag: "boat"+index.toString(),
          child: Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
                angle: 10.0,
                child: Container(color: Colors.black, height: 30, width: 200,)),
          ),
        )
      ],
    );
  }

  // Color generateRandomColor3() {
  //   Random random = Random();
  //
  //   return Color.fromARGB(
  //       255,
  //       random.nextInt(256),
  //       random.nextInt(256),
  //       random.nextInt(256));
  // }

  @override
  void initState() {
    super.initState();
    // _controller.addListener(() {
    //
    //   double value = _controller.offset/200;
    //
    //   setState(() {
    //     topContainer = value;
    //     print(value);
    //   });
    // });
  }
}