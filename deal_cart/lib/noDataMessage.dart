import 'package:flutter/widgets.dart';

class NoDataMessage extends StatelessWidget {
  final String message;

  const NoDataMessage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(message,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)));
  }
}
