import 'package:flutter/material.dart';

class TextInputWidgetnoIcon extends StatefulWidget {
  final String labelText;
  final TextEditingController cname;


  final bool hiddenText;

   TextInputWidgetnoIcon({Key? key,
    required this.labelText,

    required this.hiddenText,
    required this.cname,



  }): super(key: key);

  @override
  State<TextInputWidgetnoIcon> createState() => _TextInputWidgetnoIconState();
}

class _TextInputWidgetnoIconState extends State<TextInputWidgetnoIcon> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController cname = TextEditingController();

    return Column(children: <Widget>[

      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 30.0),
        child: Container(
          width: 300,

            child: TextField(
              
              style: const TextStyle(
                color: Colors.white60,
              ),
              obscureText: widget.hiddenText,
              controller:widget.cname,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white38)),

                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Colors.white70,
                  fontFamily: "Fahkwang-Regular",
                  fontSize: 18,
                ),



              ),
            )),
      ),

    ]);
  }
}