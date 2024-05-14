import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            child: Image.asset("asset/images/mainpagePic.jpg"),
          ),
          SizedBox(
            height: 384,
          ),
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
