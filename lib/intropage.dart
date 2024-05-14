import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/signup_page.dart';

class IntroPageFirst extends StatefulWidget {
  const IntroPageFirst({super.key});

  @override
  State<IntroPageFirst> createState() => _IntroPageFirstState();
}

class _IntroPageFirstState extends State<IntroPageFirst> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'assets/images/Innotime.png',
                title: "Quick Delivery At Your Doorstep",
                description:
                    "Enjoy quick pick-up and delivery to your destination",
              ),
              createPage(
                image: 'assets/images/rafiki.png',
                title: "Flexible Payment",
                description:
                    'Different modes of payment either before and after delivery without stress',
              ),
              createPage(
                image: 'assets/images/rafiki.png',
                title: "Flexible Payment",
                description:
                    "Different modes of payment either before and after delivery without stress",
              ),
            ],
          ),
          Positioned(
            bottom: 130,
            left: 170,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Container(
            height: 120,
            //color: Colors.amber,
            padding: const EdgeInsets.only(left: 19.0, right: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const SignUp()));
                    });
                  },
                  child: Container(
                      height: 28,
                      width: 116,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Color(0xff0277BD))),
                      child: Center(
                        child: Text("Skip"),
                      )),
                ),
                /////
                InkWell(
                    onTap: () {
                      // print(h);
                      // print(w);
                      setState(() {
                        if (currentIndex < 2) {
                          currentIndex++;
                          if (currentIndex < 3) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUp()));
                        }
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 116,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff0560FA)),
                      child: Center(
                        child: Text("Next"),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.0,
      width: 8.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: isActive ? Color(0xff0277BD) : Color(0xff8A97A0),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const createPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 23, right: 21),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //color: Colors.yellow,
            // margin: const EdgeInsets.only(top: 40.0),
            height: 346,
            width: 346,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff0277BD),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff3A3A3A),
            ),
          ),
        ],
      ),
    );
  }
}
