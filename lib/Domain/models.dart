//****************************onBoarding Models ********************8

class OnBoardingSlider {
  String title;
  String subtitle;
  String image;

  OnBoardingSlider(this.title, this.subtitle, this.image);
}

class SliderViewObject {
  SliderViewObject(this.sliderObject, this.numOfSliders, this.currentIndex);

  OnBoardingSlider sliderObject;
  int numOfSliders;
  int currentIndex;
}
