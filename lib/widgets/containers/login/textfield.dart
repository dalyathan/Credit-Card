import 'package:flutter/material.dart';

import '../../../theme.dart';

class TextfieldContainer extends StatefulWidget {
  final double height;
  final double width;
  bool isPasswordField;
  TextfieldContainer(
      {Key? key,
      required this.height,
      required this.width,
      this.isPasswordField = false})
      : super(key: key);

  @override
  State<TextfieldContainer> createState() => _TextfieldContainerState();
}

class _TextfieldContainerState extends State<TextfieldContainer> {
  late bool hideText;

  @override
  void initState() {
    super.initState();
    hideText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    double textfieldBorderRadiusRatio = 0.3;
    double borderRadius = textfieldBorderRadiusRatio * widget.height;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Center(
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(230, 230, 230, 1),
                  Color.fromRGBO(240, 240, 240, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4],
                tileMode: TileMode.clamp,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
            ),
            child: TextField(
                style: TextStyle(fontSize: widget.height * 0.3),
                obscureText: hideText,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: widget.width * 0.075,
                    top: widget.width * 0.3,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                )),
          ),
        ),
        widget.isPasswordField
            ? Positioned(
                top: widget.height * 0.3,
                right: widget.width * 0.175,
                child: InkResponse(
                  radius: widget.height * 0.4,
                  onTap: () => setState(() {
                    hideText = hideText ? false : true;
                  }),
                  child: Icon(
                    hideText ? Icons.lock_rounded : Icons.lock_open_rounded,
                    color: MyTheme.darkBlue,
                    size: widget.height * 0.4,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
