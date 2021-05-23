import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = new Logger(
  printer: PrettyPrinter(),
);

final loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class LoggerRoute extends StatefulWidget {
  const LoggerRoute();

  @override
  _LoggerRouteState createState() => _LoggerRouteState();
}

class _LoggerRouteState extends State<LoggerRoute> {
  @override
  void initState() {
    super.initState();

    logger.v('Verbose log');
    loggerNoStack.v('Verbose log');
    logger.d('Debug log');
    loggerNoStack.d('Debug log');
    logger.i('Info log');
    loggerNoStack.i('Info log');
    logger.w('Warning log');
    loggerNoStack.w('Warning log');
    logger.e('Error log');
    loggerNoStack.e('Error log');
    logger.wtf('What a terrible failure log');
    loggerNoStack.wtf('What a terrible failure log');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logger Route'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text('Logger'),
        ),
      ),
    );
  }
}
