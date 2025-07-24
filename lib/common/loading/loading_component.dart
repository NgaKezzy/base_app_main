import 'package:baseApp/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Center(
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: LoadingAnimationWidget.threeArchedCircle(
          color: AppColors.orange5,
          size: screenWidth * 0.08,
        ),
      ),
    );
  }
}
