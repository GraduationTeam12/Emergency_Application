import 'package:flutter/material.dart';
import 'package:user_accident/presentation/widgets/selecting_method_text.dart';

import 'logo_image.dart';

class SelectingMethodSection extends StatelessWidget {
  const SelectingMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      LogoImage(),
      SelectingMethodText(),
    ]);
  }
}
