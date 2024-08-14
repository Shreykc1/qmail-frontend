import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:qmail/reusable/customButton.dart';
import 'package:qmail/reusable/textfieldnoicon2.dart';
import 'home.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';



final storage = FlutterSecureStorage();



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? storedPin = await storage.read(key: 'pin');

  runApp(AppLock(
    builder: (args) => MyApp(),
    lockScreen: storedPin == null ? SetPinScreen() : LockScreen(),
  ));
}


class MyApp extends StatelessWidget {
  MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {return MaterialApp(
    debugShowCheckedModeBanner: false,

      title: 'Qmail',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          fontFamily: 'Fahkwang',
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: const Color(0xFF1D1D1D)),
      home: MyHomePage(),
    // home: HomeScreen(),
    );
  }
}






class SetPinScreen extends StatefulWidget {
  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final TextEditingController _pinController = TextEditingController();
  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
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
                backgroundColor: Colors.transparent,

                body:SingleChildScrollView(
                  child:  Container(
                    padding: EdgeInsets.only(top: height*0.4,left: width*0.05),

                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        TextInputWidgetnoIcon2(labelText:"SET PIN" , hiddenText: true, cname: _pinController,),
                        MyButton(btnText: "SET", widthh: 200, lengthh: 50, onpressed: () async {
                          if (_pinController.text.length == 4) {
                            await storage.write(key: 'pin', value: _pinController.text);
                            AppLock.of(context)!.didUnlock();
                            _pinController.clear();
                          } else {
                            Fluttertoast.showToast(
                                msg: "PIN must be 4 digits",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black87,
                                textColor: Colors.white,
                                // fontSize: 16.0
                            );
                          }
                        },
                          tPad: height * 0.04,
                          lPad: width * 0.02,
                        )

                        // TextInputWidget(labelText: 'Enter a Valid Email id', prefixicon: Icon(Icons.mail_outline), hiddenText: false, width: 0.8, height: 0,),
                        // TextInputWidget(labelText: 'Enter Your Password',prefixicon: Icon(Icons.lock),hiddenText: true, width:0.8, height: 0,),



                        //add other widgets,classes
                      ],
                    ),
                  ),
                ),
              ),
            ])
    );
  }
}






class LockScreen extends StatefulWidget {
@override
_LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final TextEditingController _pinController = TextEditingController();
  final storage = FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: const [
          Colors.black38,
          Color(0XFF0E26A6),
          Colors.white38,
          // Colors.blue
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
                backgroundColor: Colors.transparent,

                body:SingleChildScrollView(
                  child:  Container(
                    padding: EdgeInsets.only(top: height*0.4,left: width*0.05),

                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        TextInputWidgetnoIcon2(labelText:"ENTER YOUR PIN" , hiddenText: true, cname: _pinController,),
                        MyButton(btnText: "Unlock", widthh: 250, lengthh: 50, onpressed: () async {
                          String? storedPin = await storage.read(key: 'pin');
                          if (_pinController.text == storedPin) {
                            AppLock.of(context)!.didUnlock();
                            _pinController.clear();
                          } else {
                            Fluttertoast.showToast(
                                msg: "Wrong Pin",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black87,
                                textColor: Colors.white,
                                // fontSize: 16.0,
                            );}
                        }, tPad: height*0.04, lPad: width*0.02)

                        // TextInputWidget(labelText: 'Enter a Valid Email id', prefixicon: Icon(Icons.mail_outline), hiddenText: false, width: 0.8, height: 0,),
                        // TextInputWidget(labelText: 'Enter Your Password',prefixicon: Icon(Icons.lock),hiddenText: true, width:0.8, height: 0,),



                        //add other widgets,classes
                      ],
                    ),
                  ),
                ),
              ),
            ])
    );
  }
}

