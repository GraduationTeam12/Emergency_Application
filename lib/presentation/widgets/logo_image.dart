import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_images.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        //color: Colors.amber,
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 5,
          child: Image.asset(
            Assets.imagesAuthImagesLogooo,
             fit: BoxFit.contain,
          )),
    );
  }
}
