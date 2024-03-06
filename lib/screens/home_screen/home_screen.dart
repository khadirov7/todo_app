import 'package:flutter/material.dart';
import '../../utils/colors/app_colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(title: Text("Deafult"),),
      body: Center(child: const Text("HEllO"),),
    );
  }
}