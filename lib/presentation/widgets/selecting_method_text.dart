import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

class SelectingMethodText extends StatelessWidget {
  const SelectingMethodText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text("Welcome to our unique new system", style: AppStyle.styleBold20(context) ,),
        Text("enter the category you belong to", style: AppStyle.styleBold20(context)),
        Text("choose wisely please", style: AppStyle.styleBold20(context)),
    
    
                
    
      ],
    );
  }
}

