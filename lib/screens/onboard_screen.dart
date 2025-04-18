import 'package:expenz/contants/colors.dart';
import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //Page controller
  final PageController _pageController = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //onboarding Screen
                PageView(
                  controller: _pageController,
                  onPageChanged: (indext) {
                    setState(() {
                      showDetailsPage = indext == 3;
                    });
                  },
                  children: [
                    const FrontPage(),
                    //First onbrding screen
                    SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[0].title,
                        imagePath:
                            OnboardingData.onboardingDataList[0].imagePath,
                        description:
                            OnboardingData.onboardingDataList[0].description),
                    //Second onbrding screen
                    SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[1].title,
                        imagePath:
                            OnboardingData.onboardingDataList[1].imagePath,
                        description:
                            OnboardingData.onboardingDataList[1].description),
                    //Third onbrding screen
                    SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[2].title,
                        imagePath:
                            OnboardingData.onboardingDataList[2].imagePath,
                        description:
                            OnboardingData.onboardingDataList[2].description),
                  ],
                ),
                //page dot indicator
                Container(
                  alignment: const Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: const WormEffect(
                        activeDotColor: kMainColor, dotColor: kLightGrey),
                  ),
                ),
                //Navigation
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: !showDetailsPage
                            ? GestureDetector(
                                onTap: () {
                                  _pageController.animateToPage(
                                    _pageController.page!.toInt() + 1,
                                    duration: Duration(microseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: CustomButton(
                                    buttonName: showDetailsPage
                                        ? "Get Started"
                                        : "Next",
                                    buttonColor: kMainColor),
                              )
                            : GestureDetector(
                                onTap: () {
                                  // Naviation to user data Page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserDataScreen()));
                                },
                                child: CustomButton(
                                    buttonName: showDetailsPage
                                        ? "Get Started"
                                        : "Next",
                                    buttonColor: kMainColor),
                              )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
