import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:playground_flutter/core/base_response.dart';
import 'package:playground_flutter/domain/core/error_validator.dart';
import 'package:playground_flutter/uikit/widgets/loading.dart';

typedef ContentBuilder<T> = Widget Function(BuildContext context, T value);
typedef ErrorBuilder = Widget Function(BuildContext context);

class WidgetError<T> extends StatefulWidget {
  BaseResponse<T> response;
  bool? waiting = true;
  String? error;

  WidgetError({
    required this.response,
    this.waiting = true,
    this.error,
  });

  @override
  _WidgetErrorState<T> createState() => _WidgetErrorState();
}

class _WidgetErrorState<T> extends State<WidgetError<T>> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (widget.response is Error<T>) {
          return _alertDialog(context);
        } else if (widget.response is Loading<T>) {
          return LoadingWidget(isLoading: true);
        } else if (widget.response is Success<T>) {
          return const SizedBox.shrink();
        } else if (widget.response is Waiting<T> && widget.waiting == true) {
          return const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _alertDialog(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.5,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        // Adicione o BackdropFilter logo abaixo do ModalBarrier
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Center(
          child: AlertDialog(
            title: Text('Erro'),
            content: Text(validateError(widget.response.getErrorOrNull()) ??
                widget.error ??
                'Ocorreu um erro'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.response = Waiting<T>();
                  });
                },
                child: Text('Ok'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
