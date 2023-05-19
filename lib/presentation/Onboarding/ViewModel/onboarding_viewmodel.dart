import 'dart:async';

import 'package:flutter_dev/Domain/models.dart';
import 'package:flutter_dev/presentation/Base/baseviewmodel.dart';
import 'package:flutter_dev/presentation/Onboarding/onboarding_view.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  // stream controllers outputs
  StreamController _streamController = StreamController<SliderViewObject>();
  @override
  void start() {}

  @override
  void dispose() {}

  @override
  void goNext() {}

  @override
  void onPageChanged(int index) {}

  @override
  Sink get inputSliderObject => throw UnimplementedError();

  @override
  Sink get outputSliderObject => throw UnimplementedError();
}

abstract class OnBoardingViewModelInput {
  void goNext();
  void onPageChanged(int index);
  Sink get inputSliderObject;
}

abstract class OnBoardingViewModelOutput {
  Sink get outputSliderObject;
}
