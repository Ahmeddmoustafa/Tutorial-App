import 'dart:async';

import 'package:flutter_dev/Domain/models.dart';
import 'package:flutter_dev/presentation/Base/baseviewmodel.dart';

import '../../../Resources/assets_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  // stream controllers outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late int _currentPageIndex;
  late final List<OnBoardingSlider> _list;

  @override
  void start() {
    _currentPageIndex = 0;
    _list = _getSliderData();
    _sendToVIew();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextindex = ++_currentPageIndex;
    if (nextindex == _list.length) nextindex = 0;
    return nextindex;
  }

  @override
  void onPageChanged(int index) {
    _currentPageIndex = index;
    _sendToVIew();
  }

  @override
  Sink get inputSliderObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

// PRIVATE FUNCTIONS

  void _sendToVIew() {
    inputSliderObject.add(SliderViewObject(
        _list[_currentPageIndex], _list.length, _currentPageIndex));
  }

  List<OnBoardingSlider> _getSliderData() => [
        OnBoardingSlider("title", "subtitle", AssetsManager.OnBoardingLogo),
        OnBoardingSlider("title2", "subtitle2", AssetsManager.OnBoardingLogo2),
        OnBoardingSlider("title3", "subtitle3", AssetsManager.OnBoardingLogo3),
        OnBoardingSlider("title4", "subtitle4", AssetsManager.OnBoardingLogo4),
      ];
}

abstract class OnBoardingViewModelInput {
  int goNext();
  void onPageChanged(int index);
  Sink get inputSliderObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderObject;
}
