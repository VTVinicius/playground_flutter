import 'package:flutter/material.dart';

class NeumorphicButton extends StatefulWidget {
  final String text;
  NeumorphicButton({required this.text});

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;
  double _elevation = 16.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapChange(true),
      onTapUp: (details) => _onTapChange(false),
      onTapCancel: () => _onTapChange(false),
      onTap: () =>  {_onTapChange2(true), _onTapChange2(false)},

      child: AnimatedPhysicalModel(
        duration: Duration(milliseconds: 100),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
        elevation: _elevation,
        color: Colors.white,
        shadowColor: Colors.black38,
        child: Container(
          width: 200,
          height: 60,
          alignment: Alignment.center,
          decoration: _isPressed ? BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey.shade200, Colors.white],
              stops: [0.5, 1.0],
            ),
          ) : null,
          child: Text(
            widget.text,
            style: TextStyle(fontSize: _isPressed ? 14.0 : 16.0),
          ),
        ),
      ),
    );
  }

  void _onTapChange(bool down) {
    setState(() {
      _isPressed = down;
      _elevation = down ? 2.0 : 10.0;
    });
  }
  void _onTapChange2(bool down) async {
    if(down) {
      setState(() {
        _isPressed = true;
        _elevation = 2.0;
      });
    } else {
      // adicionar um delay aqui
      await Future.delayed(Duration(milliseconds: 200));
      if(mounted) { // verifique se o widget ainda está na árvore de widgets
        setState(() {
          _isPressed = false;
          _elevation = 10.0;
        });
      }
    }
  }
}