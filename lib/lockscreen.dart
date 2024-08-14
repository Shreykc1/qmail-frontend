// import 'package:flutter/material.dart';
// import 'package:flutter_app_lock/flutter_app_lock.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
//
// class LockScreen extends StatefulWidget {
//   @override
//   _LockScreenState createState() => _LockScreenState();
// }
//
// class _LockScreenState extends State<LockScreen> {
//   final TextEditingController _pinController = TextEditingController();
//   final storage = FlutterSecureStorage(
//     aOptions: const AndroidOptions(encryptedSharedPreferences: true),
//   );
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _pinController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Enter your PIN',
//               ),
//             ),
//             ElevatedButton(
//               child: Text('Unlock'),
//               onPressed: () async {
//                 String? storedPin = await storage.read(key: 'pin');
//                 if (_pinController.text == storedPin) {
//                   AppLock.of(context)!.didUnlock();
//                   _pinController.clear();
//                 } else {
//                   // Show some error message
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   final storage = FlutterSecureStorage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Set PIN'),
//           onPressed: () async {
//             await storage.write(key: 'pin', value: '1234');
//           },
//         ),
//       ),
//     );
//   }
// }