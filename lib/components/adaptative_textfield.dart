import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;

  AdaptativeTextField(
      {this.label,
      this.controller,
      this.onSubmitted,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            placeholder: label,
          )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label),
          );
  }
}
