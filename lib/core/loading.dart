import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;

  LoadingWidget({required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Stack(
      children: const [
        Opacity(
          opacity: 0.5,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    )
        : Container();
  }
}