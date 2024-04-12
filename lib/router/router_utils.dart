enum Pages {
  welcomeScreen,
  singInScreen,
  signUpScreen,
  homeScreen,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.welcomeScreen => "/",
      Pages.singInScreen => "singIn",
      Pages.signUpScreen => "signUp",
      Pages.homeScreen => "/home",
    };
  }

  String get screenName {
    return switch (this) {
      Pages.welcomeScreen => "WELCOME",
      Pages.singInScreen => "SINGIN",
      Pages.signUpScreen => "SINGUP",
      Pages.homeScreen => "HOME",
    };
  }
}
