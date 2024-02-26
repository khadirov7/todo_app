import 'package:flutter/material.dart';
import '../../utils/colors/app_colors.dart';


class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: Text("Deafult"),),
      body: Center(child: const Text("HEllO"),),
    );
  }
}