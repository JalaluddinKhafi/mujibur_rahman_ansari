import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'درباره برنامه',
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble_text),
          SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body:Column(
        children: [

        ],
      ),
    );
  }
}
