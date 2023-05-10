import 'package:flutter_dev/Resources/routes_manager.dart';
import 'package:flutter_dev/Resources/values_manager.dart';
import 'package:flutter_dev/provider/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dev/Resources/assets_manager.dart';
import 'package:flutter_dev/Resources/colors_manager.dart';
import 'package:flutter_dev/Resources/strings_manager.dart';
import 'package:provider/provider.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<OnBoardingSlider> _list = getSliderData();
  late PageController _pageController;
  // late GlobalKey _SkipButtonKey;
  // late GlobalKey _SkipButtonTextKey;
  int currentPageIndex = 0;
  List<OnBoardingSlider> getSliderData() => [
        OnBoardingSlider("title", "subtitle", AssetsManager.OnBoardingLogo),
        OnBoardingSlider("title2", "subtitle2", AssetsManager.OnBoardingLogo2),
        OnBoardingSlider("title3", "subtitle3", AssetsManager.OnBoardingLogo3),
        OnBoardingSlider("title4", "subtitle4", AssetsManager.OnBoardingLogo4),
      ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // _SkipButtonKey = GlobalKey();
    // _SkipButtonTextKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    // final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(bottom: AppSize.s100),
        child: PageView.builder(
          controller: _pageController,
          itemCount: 4,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
          },
        ),
      ),
      bottomSheet: Container(
        decoration: null,
        color: ColorManager.White,
        height: AppSize.s70,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: const Text(
                      AppStrings.skip,
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.mainRoute);
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: const Offset(1, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: Stack(
                    children: [
                      Align(
                          alignment: MediaQuery.of(context).size.width >= 300
                              ? Alignment.center
                              : Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: 0.25,
                            heightFactor: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(AssetsManager.HollowCircleIcon),
                                Image.asset(AssetsManager.HollowCircleIcon),
                                Image.asset(AssetsManager.HollowCircleIcon),
                                Image.asset(AssetsManager.HollowCircleIcon),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward,
                          color: ColorManager.White,
                        ),
                      )
                    ],
                  ),
                ),
                // color: AppTheme.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final OnBoardingSlider _sliderObject;
  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.onBoardingTitle,
                style: textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppSize.s8),
                child: Text(
                  AppStrings.onBoardingSubtitle,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Image.asset(
                _sliderObject.image,
                width: 200,
                height: 200,
              ),

              // add the provider to use this
              Switch(
                  value: Provider.of<ThemeProvider>(context).themeMode ==
                      ThemeMode.dark,
                  onChanged: (newval) => {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toogleThemeMode(),
                      }),

              // TextButton(
              //   onPressed: () => {
              //     _pageController.animateToPage(
              //       index + 1, // the page number you want to navigate to
              //       duration: const Duration(milliseconds: 200),
              //       curve: Curves.ease,
              //     )
              //   },
              //   child: const Text(
              //     "Skip",
              //   ),
              // ),

              // ElevatedButton(
              //   key: _SkipButtonKey,
              //   onPressed: () => {
              //     _pageController.animateToPage(
              //       index + 1, // the page number you want to navigate to
              //       duration: const Duration(milliseconds: 300),
              //       curve: Curves.ease,
              //     )
              //   },
              //   child: Text(
              //     "Skip",
              //     key: _SkipButtonTextKey,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingSlider {
  String title;
  String subtitle;
  String image;

  OnBoardingSlider(this.title, this.subtitle, this.image);
}
