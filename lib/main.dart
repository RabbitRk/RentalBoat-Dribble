import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              FlutterLogo(),
              FlutterLogo(),
            ],
          ),
          FlutterLogo(),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
                FlutterLogo(size: 100,),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}