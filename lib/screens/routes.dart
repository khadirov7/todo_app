import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen/home_screen.dart';
import 'package:todo_app/screens/on_boarding/on_boarding.dart';
import 'package:todo_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RouteNames.homeScreen:
        {
          return navigate(const HomeScreen());
        }
      case RouteNames.onboardingScreen:{
        return navigate(const OnBoardingScreen());
      }
      case RouteNames.splashScreen:
        {
          return navigate(const SplashScreen());
        }
      default:{
        return navigate(const Scaffold(body: Center(child: Text('Bunday screen yoq'),),));
      }

    }
  }
  static navigate(Widget widget){
    return MaterialPageRoute(builder: (context)=>widget);
  }
}

class RouteNames{
  static const String splashScreen = 'splash_route';
  static const String onboardingScreen = "board_route";
  static const String homeScreen ='home_route';
}