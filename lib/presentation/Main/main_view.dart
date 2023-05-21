import 'package:flutter/material.dart';
import 'package:flutter_dev/Resources/colors_manager.dart';
import 'package:flutter_dev/Resources/strings_manager.dart';
import 'package:flutter_dev/Resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.home),
              Icon(Icons.search),
              Icon(Icons.notifications),
              Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 33,
            child: Center(
              child: Container(
                color: ColorManager.Black,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Expanded(
            flex: 33,
            child: Center(
              child: Container(
                // color: ColorManager.DarkGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(AppMargin.m8),
                      child: Text(
                        AppStrings.services,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FractionallySizedBox(
                            alignment: Alignment.bottomCenter,
                            heightFactor: 1,
                            child: Container(
                              margin: const EdgeInsets.all(AppMargin.m8),
                              // height: 100,
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: ColorManager.Black,
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                  ],
                ),
                // width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Expanded(
            flex: 33,
            child: Center(
              child: Container(
                color: ColorManager.error,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
