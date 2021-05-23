import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final int index;

  DetailView({Key? key, required this.index}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return Scaffold(
      body: Center(
        child: Container(
          height: 216,
          width: double.infinity,
          child: Stack(
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
                tag: "boat"+widget.index.toString(),
                child: Align(
                  alignment: Alignment.center,
                  child: RotatedBox(
                    quarterTurns: 1,
                      child: Container(color: Colors.black, height: 30, width: 200,)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//          tag: "new"+widget.index.toString(),