// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';

// class DialogBox extends StatelessWidget {
//   const DialogBox({key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedButton(     
//       pressEvent: () {
//         AwesomeDialog(
//             context: context,
//             animType: AnimType.SCALE,
//             headerAnimationLoop: false,
//             dialogType: DialogType.SUCCES,
//             showCloseIcon: true,
//             title: 'Succes',
//             desc:
//                 'Your Order is placed successfully. We will confirmed you in 10 mins!',
//             btnOkOnPress: () {
//               debugPrint('OnClcik');
//             },
//             btnOkIcon: Icons.check_circle,
//             onDissmissCallback: (type) {
//               debugPrint('Dialog Dissmiss from callback $type');
//             })
//           .show();
//       },
//     );
//   }
// }
