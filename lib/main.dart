import 'package:chuong4/op_1_page/op1.dart';
import 'package:chuong4/op_2_page/op2.dart';
import 'package:chuong4/op_3_page/op3.dart';
import 'package:chuong4/video_url/video_url.dart';
import 'package:chuong4/video_youtobe/video_youtobe.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ImagePage()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  color: Colors.green,
                  child: const Text('Show by img'),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AvatarPage()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightGreenAccent,
                  child: const Text('Show profile item'),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SVGPage()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child: const Text('Show by svg'),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VideoURL()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child: const Text('Show video from URL'),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoYouTobe()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child: const Text('Show video from YouTobe'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
