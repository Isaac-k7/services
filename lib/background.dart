import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(  
        children: <Widget>[
          Positioned(
            top: 0,
            left:0,
            width: size.width*0.3,
            child: Image.asset('assets/image/main_top.png'),
          ),
          Positioned(
            bottom : 0,
            left:0,
            width: size.width*0.3,
            child: Image.asset('assets/image/main_bottom.png'),
          ),
          child,
        ],
      ),
    );
  }
}
