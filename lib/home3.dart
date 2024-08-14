import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import 'package:mailer/smtp_server/yahoo.dart';
import 'package:qmail/home2.dart';
import 'package:qmail/imagePick.dart';
import 'package:qmail/reusable/customButton.dart';
import 'package:qmail/reusable/otpField.dart';
import 'package:qmail/reusable/roundButtons.dart';
import 'package:qmail/reusable/textFieldnoicon.dart';
import 'package:animate_gradient/animate_gradient.dart';





class home3 extends StatefulWidget {
  const home3({super.key});

  @override
  State<home3> createState() => _home3State();
}

class _home3State extends State<home3> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController CpassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  File uploadimage= File("");

  bool haspfp = false;

  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  Future<void> chooseImage() async {
    var picker = ImagePicker();
    var choosedimage = await picker.pickImage(source: ImageSource.gallery);
    DateTime _selectedDate;
    //set source: ImageSource.camera to get image from camera
    setState(() {
      if (choosedimage != null) {
        uploadimage = File(choosedimage.path);
        haspfp = true;
      }
      else{
        uploadimage = File("assets/images/pfp1.jpg");
      }
    });
  }

  Future<void> uploadImage() async {

  }


  // Future<void> sendEmail() async {
  //   final smtpServer = hotmail('shreykc1@gmail.com', '@1Shreejibapa');
  //   final message = Message()
  //     ..from = Address('shreykc1@gmail.com', 'Shrey')
  //     ..recipients.add('igada54@gmail.com')
  //     ..subject = 'SUbject'
  //     ..text = 'This is the plain tex.';
  //
  //   try {
  //     final sendReport = await send(message, smtpServer);
  //     print('Message sent: ' + sendReport.toString());
  //   } on MailerException catch (e) {
  //     print('Message not sent. \n' + e.toString());
  //   }
  // }


  Future<void> sendEmail() async {
    final smtpServer = SmtpServer('mail.mithibaitechspark.in',
        username: 'me@mail.techspark.in',
        password: 'rishujiya',
        port: 587);
    final message = Message()
      ..from = Address('me@mail.mithibaitechspark.in', 'Shrey')
      ..recipients.add('blazeplaysop@gmail.com')
      ..subject = 'Subject'
      ..text = 'This is the plain text.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
    }
  }






  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        duration: Duration(seconds: 20),
        child: Stack(children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(


                child: Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0, right: width * 0.39),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 35,
                                  fontFamily: "Fahkwang",
                                ),
                              )),
                          const SizedBox(height: 35),
                          // Container(
                          //
                          //   alignment: Alignment.center,
                          //   width: double.infinity,
                          //   height: 150,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: Colors.white70,
                          //   ),
                          //   // color: Colors.grey[300],
                          //   child: _image != null
                          //       ? Image.file(_image!, fit: BoxFit.cover)
                          //       : const Text('Select an image'),
                          // ),
                        GestureDetector(

                          child:   Container(
                            padding: EdgeInsets.all(3),
                            width: 0.35*width,
                            height: 0.169*height,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0),
                              shape: BoxShape.circle,
                              color: Colors.white70,

                            ),
                            child:(uploadimage.path.toString()=="")?CircleAvatar(

                              backgroundImage:AssetImage('assets/images/pfp1.jpg',
                              ),

                            ):CircleAvatar(

                              backgroundImage:FileImage(uploadimage),


                            )
                            ,
                            //Image.network(globals.url+pfppic),
                          ),
                          onTap: chooseImage,
                        ),

                           // SizedBox(height: 0),

                        ]),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [

                          Container(
                            padding:  EdgeInsets.only(top: 0, left: width*0.01),
                            child: Column(
                              children: <Widget>[
                                TextInputWidgetnoIcon(
                                  labelText: 'Name', hiddenText: false, cname: nameController,),
                                TextInputWidgetnoIcon(
                                  labelText: 'Email', hiddenText: false, cname: emailController,),
                                TextInputWidgetnoIcon(
                                  labelText: 'Password', hiddenText: true, cname: passController,),
                                TextInputWidgetnoIcon(
                                  labelText: 'Confirm Password',
                                  hiddenText: true, cname: CpassController,),
                                MyButton(
                                    btnText: 'SIGN UP',
                                    widthh: 250,
                                    lengthh: 50,
                                    // onpressed: () {
                                    //   // Navigator.push(context, MaterialPageRoute(builder: (context) =>  ()),);
                                    //
                                    // },
                                    onpressed: sendEmail,
                                    tPad: 30,
                                    lPad: 11),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ]));
  }
}
