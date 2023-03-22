import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final Widget topBar;
  final Widget bottomBar;
  final Widget floatingActionButton;
  final dynamic error;

  const AppScaffold({
    Key? key,
    required this.body,
    this.topBar = const SizedBox.shrink(),
    this.bottomBar = const SizedBox.shrink(),
    this.floatingActionButton = const SizedBox.shrink(),
    this.error,
  }) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool _showErrorDialog = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: widget.topBar is PreferredSizeWidget
              ? widget.topBar as PreferredSizeWidget?
              : null,
          body: widget.body,
          bottomNavigationBar: widget.bottomBar,
          floatingActionButton: widget.floatingActionButton,
        ),
        if (widget.error != null && _showErrorDialog)
          _buildErrorDialog(context),
      ],
    );
  }

  Widget _buildErrorDialog(BuildContext context) {
    String errorMessage = "Ocorreu um erro";
    //
    // print('error print ${widget.error} ');
    // if (widget.error as Dio) {
    //   errorMessage = 'Ocorreu um erro de conexão';
    // } else if (widget.error is HttpException) {
    //   errorMessage = 'Ocorreu um erro ao processar os Dados';
    // } else {
    //   errorMessage = "Ops, ocorreu um erro";
    // }

    return AlertDialog(
      title: Text('Erro'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              _showErrorDialog = false;
            });
          },
          child: Text('Fechar'),
        ),
      ],
    );
  }
}
