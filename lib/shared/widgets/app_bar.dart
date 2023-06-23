import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_task_app/core/extensions/dimensions_ext.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key, this.bgImage, this.bgColor, this.imageAlignment, required this.child, this.bottom,  this.elevation = 0})
      : assert(bgImage == null ? imageAlignment == null : true);

  final String? bgImage;
  final Color? bgColor;
  final AlignmentGeometry? imageAlignment;
  final double elevation;

  final Widget child;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Material(
        elevation: elevation,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgColor,
                image: bgImage != null
                    ? DecorationImage(
                        image: AssetImage(bgImage!),
                        fit: BoxFit.cover,
                        alignment: imageAlignment ?? Alignment.center)
                    : null,
              ),
              width: double.infinity,
              child: child,
            ),
            bottom??const SizedBox()
            ,
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 150.getHeight());
}
