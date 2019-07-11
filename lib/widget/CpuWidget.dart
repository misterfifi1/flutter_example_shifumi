import 'package:flutter/material.dart';

class CpuWidget extends StatelessWidget {

  final bool isTop;

  CpuWidget({
      @required this.isTop,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          child: Container(

          ),
        ),
      ),
    );
  }
}