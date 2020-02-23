import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ImageCapture/ImageCapture.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rehash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'REHASH'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bottles.jpeg"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('REHASH',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 80),
              textAlign: TextAlign.center),
          Text(
              'Rehash uses machine learning to catagorize bottles into three catagories:',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 25),
              textAlign: TextAlign.center),
          Text('Reusable',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 35),
              textAlign: TextAlign.center),
          Text('Recyclable',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 35),
              textAlign: TextAlign.center),
          Text('Trash',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 35),
              textAlign: TextAlign.center),
          Text('     ',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  height: 2,
                  fontStyle: FontStyle.italic,
                  fontSize: 35),
              textAlign: TextAlign.center),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImageCapture()),
              );
            },
            child: Text(
              'TRY IT!',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40),
            ),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
