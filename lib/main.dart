import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _offset = Offset(200, 250);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context,constraints){
            return Stack(
              children: [
                Positioned(
                  left: _offset.dx,
                    top: _offset.dy,
                    child: LongPressDraggable(
                      feedback: Image.network("https://tinyurl.com/95ncjeuu",height: 200,color: Colors.orangeAccent,colorBlendMode: BlendMode.colorBurn,),
                child: Image.network("https://tinyurl.com/95ncjeuu",height: 200),
                    onDragEnd: (details){
                        setState(() {
                          double adjustment = MediaQuery.of(context).size.height - constraints.maxHeight;
                          _offset = Offset(details.offset.dx, details.offset.dy - adjustment);
                        });
                    },
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}


