import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    
    final pr = ProgressDialog(
      context,
      type: ProgressDialogType.Download,
    );

    pr.style(
      message: 'Downloading...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
      ),
      messageTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 19.0,
        fontWeight: FontWeight.w600,
      ),
      progressWidget: Container(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );

    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text(
            'Show Dialog',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          onPressed: () async {
            await pr.show();
            await Future.delayed(Duration(seconds: 2));
            percentage = 30.0;
            pr.update(
              progress: percentage,
              message: "Please wait...",
            );
            await Future.delayed(Duration(seconds: 2));
            percentage = 60.0;
            pr.update(
              progress: percentage,
              message: "Almost there...",
            );
            await Future.delayed(Duration(seconds: 3));
            percentage = 95.0;
            pr.update(
              progress: percentage,
              message: "Completing...",
            );
            await Future.delayed(Duration(seconds: 1));
            pr.hide();
          },
        ),
      ),
    );
  }
}
