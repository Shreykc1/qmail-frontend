import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qmail/home2.dart';
import 'package:qmail/reusable/customButton.dart';
import 'package:qmail/reusable/customtextfield.dart';
import 'package:qmail/reusable/roundButtons.dart';
import 'package:qmail/reusable/textFieldnoicon.dart';

import 'Controller/LocalController.dart';
import 'my_icons_icons.dart';



class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController smtp = TextEditingController();
  TextEditingController enc = TextEditingController();
  TextEditingController ssl = TextEditingController();
  TextEditingController port = TextEditingController();

  TextEditingController server = TextEditingController();
  bool isFieldsVisible = false;
  bool isothervisible = false;
  bool isportvisible = false;



  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    var Local_control=Get.put(LocalController());

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
      duration: Duration(seconds:10),
      child:Stack(
      children:[

        Scaffold(
            backgroundColor: Colors.transparent,

            body:SingleChildScrollView(
              child:  Container(

                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height*0.20, right: width*0.34),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width*0.12,
                          fontFamily: "Fahkwang",

                        ),
                      ),
                    ),
                    TextInputWidgetnoIcon(labelText:"EMAIL" , hiddenText: false, cname: emailController,),
                    TextInputWidgetnoIcon(labelText:"PASSWORD" , hiddenText: true, cname:passController,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 130,
                                    padding: EdgeInsets.only(left:60,top: 20),
                                    // alignment: Alignment.center,
                                    child: Text(
                                      "SMTP",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white70,
                                        fontFamily: 'Fahkwang-Regular',

                                      ),
                                    )),
                                Container(
                                  width: width * 0.5,
                                  height: height*0.1,


                                  child: TextField(


                                    style: TextStyle(
                                        // color: Color(0xFFD8D8D8),
                                        color: Colors.white60,
                                        fontSize: 18.0), // Set the text color
                                    cursorColor: Color(0xFFD8D8D8),
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top:38,left: 15),
                                      filled: true,
                                      fillColor: Colors
                                          .transparent, // Set the background color to transparent
                                      border: InputBorder.none,
                                    ),
                                    controller: enc,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.only(top: 15),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(
                                            () {
                                          isFieldsVisible = !isFieldsVisible;
                                        },
                                      );
                                    })
                              ],
                            ),
                            Visibility(
                              visible: isFieldsVisible,
                              child: Column(
                                children: [
                                  Container(

                                    width: MediaQuery.of(context).size.width,

                                    child: ElevatedButton(

                                      onPressed: () {
                                        enc.text = "www.outlook.com";
                                        setState(() {
                                          isFieldsVisible = !isFieldsVisible;
                                          isothervisible = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        textStyle: TextStyle(
                                          color: Colors.white70,
                                          fontFamily: 'Fahkwang-Regular',
                                        ),

                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right:width*0.47),

                                           // Set alignment to left
                                          child: Text(
                                            "OUTLOOK",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontFamily: 'Fahkwang-Regular',
                                              decoration: TextDecoration
                                                  .underline, // Set text underline
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ),

                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        enc.text = "imap.mail.yahoo.com";
                                        setState(
                                              () {
                                            isFieldsVisible = !isFieldsVisible;
                                            isothervisible = false;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set button background color to transparent
                                        elevation: 0, // Set button elevation to 0
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right:width*0.53),// Set alignment to left
                                          child: Text(
                                            "YAHOO",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontFamily: 'Fahkwang-Regular',
                                              decoration: TextDecoration
                                                  .underline, // Set text underline
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        enc.text = "imap.gmx.com";
                                        setState(
                                              () {
                                            isFieldsVisible = !isFieldsVisible;
                                            isothervisible = false;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right:width*0.59),
                                        // Set alignment to left
                                          child: Text(
                                            "GMX",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontFamily: 'Fahkwang-Regular',
                                              decoration: TextDecoration
                                                  .underline, // Set text underline
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        enc.text = "other";
                                        setState(
                                              () {
                                            isFieldsVisible = !isFieldsVisible;
                                            isothervisible = true;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right:width*0.53),
                                          child: Text(
                                            "OTHER",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontFamily: 'Fahkwang-Regular',
                                              decoration: TextDecoration
                                                  .underline, // Set text underline
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: isothervisible,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: width*0.15),

                                          alignment: Alignment.center,
                                          child: Text(
                                            "SSL",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Fahkwang',
                                              color: Colors.white70,
                                            ),
                                          )),
                                      Container(
                                        width: width*0.15,
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Fahkwang-Regular',
                                            color: Colors.white70,), // Set the text color
                                          cursorColor: Color(0xFFD8D8D8),
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors
                                                .transparent, // Set the background color to transparent
                                            border: InputBorder.none,
                                          ),
                                          controller: ssl,
                                        ),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(
                                                  () {
                                                ssl.text = "true";
                                                isportvisible = !isportvisible;
                                              },
                                            );
                                          })
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: isportvisible,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ssl.text = "true";
                                        setState(() {
                                          isportvisible = !isportvisible;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0,
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Fahkwang-Regular',
                                          color: Colors.white70,
                                        )
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right: width*0.35 ),

                                          child: Text(
                                            "true",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Fahkwang-Regular',
                                              color: Colors.white70,
                                              decoration: TextDecoration
                                                  .underline, // Set text underline
                                            ),
                                            textAlign: TextAlign.left,
                                          ),

                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        ssl.text = "false";
                                        setState(
                                              () {
                                            isportvisible = !isportvisible;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .transparent, // Set button background color to transparent
                                        elevation: 0, // Set button elevation to 0
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Fahkwang-Regular',
                                          color: Colors.white70,
                                        )
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(right: width*0.34 ),

                                          child: Text(
                                            "false",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFFD8D8D8),
                                              decoration: TextDecoration
                                                  .underline, // Set text underline
                                            ),
                                            textAlign: TextAlign.left,
                                          ),

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: isothervisible,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: width*0.15),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "PORT",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                            ),
                                          )),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        child: TextField(
                                          style: TextStyle(
                                              color: Color(0xFFD8D8D8),
                                              fontSize: 18.0), // Set the text color
                                          cursorColor: Color(0xFFD8D8D8),
                                          decoration: InputDecoration(
                                            hintText: "Enter port number",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors
                                                .transparent, // Set the background color to transparent
                                            border: InputBorder.none,
                                          ),
                                          controller: port,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: width*0.15),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "SERVER",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                            ),
                                          )),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.6,
                                        child: TextField(
                                          style: TextStyle(
                                              color: Color(0xFFD8D8D8),
                                              fontSize: 18.0), // Set the text color
                                          cursorColor: Color(0xFFD8D8D8),
                                          decoration: InputDecoration(
                                            hintText: "Enter server name",
                                            hintStyle: TextStyle(color: Colors.grey),
                                            filled: true,
                                            fillColor: Colors
                                                .transparent, // Set the background color to transparent
                                            border: InputBorder.none,
                                          ),
                                          controller: server,

                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            MyButton(btnText: 'SIGN IN', widthh: 250, lengthh: 50,onpressed: (){
                              LocalController.instance.loginUser(emailController.text, passController.text,smtp.text);
                            }, tPad: 30, lPad: 11,),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
        ),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   child: Image.asset('assets/images/moon.png'), // replace with your image
        // ),
    ])
    );
  }
}







class MyBottomTexts extends StatelessWidget{
  const MyBottomTexts({super.key});

  @override
  Widget build(BuildContext context){
    return const Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 130,bottom: 10),
        child: Text("DON'T HAVE AN ACCOUNT?",
          style: TextStyle(
            color: Colors.white38,
            fontSize: 15,
          ),

        ),


      ),


    ]);
  }
}



