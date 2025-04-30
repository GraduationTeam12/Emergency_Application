import 'package:flutter/material.dart';

class EmergencySettingListView extends StatelessWidget {
  const EmergencySettingListView({super.key, required this.leading,required this.imageIcon, required this.trailing, required this.onTap});

  final Widget leading;
  final Widget trailing;
  final Widget imageIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: imageIcon,
      title: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
