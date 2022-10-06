import 'package:flutter/material.dart';

class VariedButton extends StatelessWidget {//自定义按钮组件
  VariedButton({
    this.colors,this.width,this.height,this.borderRadius,this.buttonTapCallBack,@required this.child
  });
  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback buttonTapCallBack;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme=Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: buttonTapCallBack,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height,width: width),
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: TextStyle(fontWeight: FontWeight.bold),
                child: child,
              ),
            ),),
          ),
        ),
      ),
    );
  }
  
}