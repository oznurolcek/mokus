import 'package:flutter/material.dart';
import 'package:proje/core/extensions/context_extension.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 19),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: context.screenWidth * 0.8,
      decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
