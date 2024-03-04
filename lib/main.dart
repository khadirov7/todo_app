import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/screens/product_screen.dart';


Future<void> main() async{
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      child: MaterialApp(
        home: ProductsScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
      ),
    );
  }
}