enum Pages {
  welcomeScreen,
  singInScreen,
  signUpScreen,
  homeScreen,
  itemCoffee,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.welcomeScreen => "/welcome",
      Pages.singInScreen => "singIn",
      Pages.signUpScreen => "signUp",
      Pages.homeScreen => "/",
      Pages.itemCoffee => "itemCoffee",
    };
  }

  String get screenName {
    return switch (this) {
      Pages.welcomeScreen => "WELCOME",
      Pages.singInScreen => "SINGIN",
      Pages.signUpScreen => "SINGUP",
      Pages.homeScreen => "HOME",
      Pages.itemCoffee => "ITEMCOFFEE",
    };
  }
}
