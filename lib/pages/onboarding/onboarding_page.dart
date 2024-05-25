import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:latihan_responsi/pages/user_account/login.dart';
import 'package:latihan_responsi/pages/user_account/register.dart';
import 'package:latihan_responsi/widgets/buttons.dart';
import '../../widgets/texts.dart';
import '../../utils/colors.dart';
import '../../data/onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnboardingPage> {
  final CarouselController _controller = CarouselController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  _carouselSlider(),
                  const SizedBox(
                    height: 20,
                  ),
                  _indicator(),
                  const SizedBox(
                    height: 15,
                  ),
                  customButton(context, "Login", darkBlueColor, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  customButton(
                    context,
                    "Register",
                    paleBlueColor,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _carouselSlider() {
    return (CarouselSlider(
      items: itemList,
      carouselController: _controller,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 1,
        viewportFraction: 1,
        height: 300,
        onPageChanged: (index, reason) {
          setState(() {
            this.index = index; // Track page changes
          });
        },
      ),
    ));
  }

  List<Widget> itemList = imgList
      .map(
        (OnboardingItem e) => SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      e.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      titleText(e.title, darkBlueColor, TextAlign.center),
                      const SizedBox(height: 5),
                      subText(e.desc, TextAlign.center)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      .toList();

  Widget _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(entry.key),
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == entry.key ? darkBlueColor : paleBlueColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}
