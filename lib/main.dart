import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatelessWidget {
  double _opacity = 0.0;
  Future<void> scratchCardDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  "You\'ve won a Scratch Card",
                  style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              content: StatefulBuilder(
                builder: (context, StateSetter setState) {
                  return Scratcher(
                    accuracy: ScratchAccuracy.low,
                    brushSize: 55,
                    imagePath: "assets/scratch card.jpg",
                    threshold: 75,
                    onThreshold: () {
                      setState((){
                        _opacity=1;
                      });
                    },
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: _opacity,
                      child: Container(
                        height: 300,
                        width: 300,
                        alignment: Alignment.center,
                        child: Text(
                          "nikal pehli fursat me nikal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.yellow),
                        ),
                      ),
                    ),
                  );
                },
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide.none,
        ),
        color: Colors.yellow,
        child: Text(
          "Get a Scratch Card!",
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        onPressed: () => scratchCardDialog(context),
      ),
    );
  }
}
