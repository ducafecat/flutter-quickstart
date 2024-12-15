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

  /// 文字
  final String? text;

  /// 高度
  final double? height;

  /// 宽度
  final double? widget;

  /// 圆角
  final double? radius;

  /// 点击事件
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // 阴影高度
        elevation: WidgetStateProperty.all(0),
        // 最小尺寸
        minimumSize: WidgetStateProperty.all(
            Size(widget ?? double.infinity, height ?? double.infinity)),
        // 形状 圆角
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 18),
            ),
          ),
        ),
      ),
      child: Text(
        // 文字
        text ?? "",
        // 文字样式
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }
}
