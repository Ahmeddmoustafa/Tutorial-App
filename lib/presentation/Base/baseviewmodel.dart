abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  //contains all the vars and funcs that is used accross the whole app
}

abstract class BaseViewModelInput {
  void start();

  void dispose();
}

abstract class BaseViewModelOutput {}
