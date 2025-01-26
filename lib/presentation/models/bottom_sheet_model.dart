// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BottomSheetModel {
  final String bottomName;
  final IconData icon;
  final VoidCallback onPressed;

  BottomSheetModel({
    required this.bottomName,
    required this.icon,
    required this.onPressed,
  });
}
