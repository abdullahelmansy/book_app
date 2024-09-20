import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BackButtonWidegt extends StatelessWidget {
  const BackButtonWidegt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 41,
        height: 41,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.accentColor, width: 1.5),
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor,
        ),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}
