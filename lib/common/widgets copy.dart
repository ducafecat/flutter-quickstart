import 'package:flutter/material.dart';

/// 按钮组件
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    this.height,
    this.widget,
    this.radius,
    this.onPressed,
    this.text,
  }) : super(key: key);

  final String? text;
  final double? height;
  final double? widget;
  final double? radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widget,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 18),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          minimumSize: WidgetStateProperty.all(Size.zero),
        ),
        child: Text(
          text ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
