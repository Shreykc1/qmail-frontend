import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:qmail/home3.dart';
import 'package:qmail/reusable/customButton.dart';

import 'package:qmail/reusable/textFieldnoicon.dart';
import 'package:animate_gradient/animate_gradient.dart';





class home2 extends StatefulWidget {
  home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  final TextEditingController _pinPutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var otp;

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 43,
      height: 43,
      textStyle: const TextStyle(
          fontSize: 17,
          color: Colors.white54,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(43, 43, 43, 1).withOpacity(0)),
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromRGBO(43, 43, 43, 1).withOpacity(0.3),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    return AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [
        Colors.black38,
        Color(0XFF0E26A6),
    Colors.white38,
    ],
    secondaryColors: const [
    Color(0XFF0E26A6),
    Colors.white38,
    Color(0XFF000729),
    ],
    duration: Duration(seconds:20),
    child:Stack(
    children:[
      Scaffold(
        backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              child: Column(

                children: [
                  Padding(padding: EdgeInsets.only(top: height*0.25,right: width*0.31),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width*0.11,
                          fontFamily: "Fahkwang",
                        ),
                      )),
                  // RoundButtons(btnText: '↩', onpressed: (){}),

                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                          child: Container(
                              width: 300,

                              child: TextField(
                                style: const TextStyle(
                                  color: Colors.white60,
                                ),
                                keyboardType: TextInputType.phone,
                                controller:phoneController,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white38)),

                                  labelText: "PHONE",
                                  labelStyle: const TextStyle(
                                    color: Colors.white70,
                                    fontFamily: "Fahkwang-Regular",
                                    fontSize: 18,
                                  ),



                                ),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30,bottom: 0,right: 255),
                          child: Text('OTP',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontFamily: "Fahkwang-Regular",
                        ),),),
                        Container(
                          height: 70,
                          child:Pinput(
                          length: 6,
                          controller: _pinPutController,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          onCompleted: (String pin) async{
                            otp = pin;
                          },
                        ),),

                        MyButton(btnText: 'Register', widthh: 250, lengthh: 50, onpressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  home3()),
                          );}, tPad: 30, lPad: 11),
                      ],
                    ),
                  ),
                  Container(height: 300,)
                ],
              ),
            ),
          ],
        )
      ),
    )
    ]
    ));
  }
}
