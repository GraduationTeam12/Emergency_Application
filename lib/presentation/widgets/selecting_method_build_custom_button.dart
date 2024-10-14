import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/widgets/selecting_method_custom_button.dart';


class OwnerButton extends StatelessWidget {
  const OwnerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SelectingMethodCustomButton(
      title: "Owner",
      icon: Assets.imagesAuthImagesOwnerButton,
      color: MyColors.premiumColor,
      textColor: Colors.white,
    );
  }
}

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SelectingMethodCustomButton(
        title: "Emergency",
        icon: Assets.imagesAuthImagesEmergencyButton,
        textColor: Colors.black);
  }
}
