import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = 200;
  double height = 300;
  Color color = Colors.red;
  double targetValue = 40;
  CrossFadeState state = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Implicit Animation"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: Duration(microseconds: 500),
          builder: (context, size, _){
            return IconButton(
                iconSize: size,
                icon: Icon(Icons.ac_unit_outlined),
                onPressed: (){
                  setState(() {
                    targetValue = targetValue == 40 ? 80 : 40;
                  });
                }
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            width = width == 200 ? 300 : 200;
            height = height == 300 ? 200 : 300;

            color = color == Colors.red ? Colors.purple : Colors.red;

            // opacity = opacity == 0.2 ? 1.0 : 0.2;

            state = state == CrossFadeState.showFirst ? CrossFadeState.showSecond : CrossFadeState.showFirst;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


