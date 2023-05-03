import 'package:attendance/homepage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageScreenState createState() => _IntroPageScreenState();
}

class _IntroPageScreenState extends State<IntroPage> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 2);
          });
        },
        children: [
          Container(
            height: 200,
            width: 20,
            color: const Color(0xFF486A71),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/images/intro1.png', scale: 1.2),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  "Search for records!",
                  style: TextStyle(fontSize: 28),
                )),
              ],
            ),
          ),
          Container(
            color: const Color(0xFF6A8A99),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/images/intro2.png', scale: 1.2),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  "Add new records!",
                  style: TextStyle(fontSize: 28),
                )),
              ],
            ),
          ),
          Container(
            color: const Color(0xFFDB823F),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/images/intro3.png', scale: 1.2),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  "View individual records!",
                  style: TextStyle(fontSize: 28),
                )),
              ],
            ),
          ),
        ],
      ),
      Container(
        alignment: Alignment(0, 0.9),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // skip button
          GestureDetector(
            onTap: () {
              _controller.jumpToPage(2);
            },
            child: const Text('Skip'),
          ),

          // dot indicator
          SmoothPageIndicator(controller: _controller, count: 3),

          // next/done button
          onLastPage
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: Text('Done'),
                )
              : GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Text('Next'),
                ),
        ]),
      ),
    ]));
  }
}
