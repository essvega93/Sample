import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_color.dart';

class ScreenWithLoader extends StatefulWidget {
  final bool isLoading;
  Color color;
  final Widget child;

  ScreenWithLoader(
      {Key? key, this.isLoading = false, required this.child, this.color = Colors.white38}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScreenWithLoader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: widget.child,
        ),
        Visibility(
          visible: widget.isLoading,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: widget.color,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColor.WHITE),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
