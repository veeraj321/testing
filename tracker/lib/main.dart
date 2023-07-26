import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracker/widget/expence_list/expanetracker.dart';

var Kcolorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 192, 198, 27));

var Kdarkscheme =
    ColorScheme.fromSeed(seedColor: Color.fromRGBO(12, 186, 230, 0.933));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: Kdarkscheme,
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: Kcolorscheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Kcolorscheme.onPrimaryContainer,
          foregroundColor: Kcolorscheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
          color: Kdarkscheme.onSecondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Kcolorscheme.primaryContainer,
        ),
      ),
    ),
    themeMode: ThemeMode.system,
    home: Expenses(),
  ));
}//);
//}
  
//".read": "auth.token.email=='messi@exathought.com' || auth.provider=='1234567'",
 //  ".write": "auth.token.email=='messi@exathought.com' || auth.provider=='1234567'",
//  Widget participantCard(BuildContext context, ScrumSessionParticipant participant, bool showEstimates) {
//   return AnimatedContainer(
//     duration: Duration(milliseconds: 300),
//     curve: Curves.easeIn,
//     height: (participant.currentEstimate != null && participant.currentEstimate != '')
//         ? 250
//         : 200,
//     width: (participant.currentEstimate != null && participant.currentEstimate != '')
//         ? 175
//         : 145,
//     child: Transform.rotate(
//       angle: showEstimates ? 0.5 : 0, // Adjust the angle as desired
//       child: Card(
//         elevation: 3.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/moroccan-flower.png"),
//                     fit: BoxFit.cover,
//                   ),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(5),
//                     topRight: Radius.circular(5),
//                   ),
//                 ),
//                 child: Center(
//                   child: CircleAvatar(
//                     child: (participant.currentEstimate == null || participant.currentEstimate == '')
//                         ? heading6(context: context, text: '')
//                         : showEstimates
//                             ? heading3(context: context, text: participant.currentEstimate ?? '').color(Colors.white)
//                             : heading6(context: context, text: 'Ready').color(Colors.white),
//                     radius: (participant.currentEstimate == null || participant.currentEstimate == '') ? 0 : 50,
//                     backgroundColor: showEstimates ? Colors.blue[900] : Colors.green[900],
//                   ),
//                 ),
//               ),
//             ),
//             body1(context: context, text: participant.name).paddingLRTB(left: 8, right: 8, top: 8, bottom: 16),
//           ],
//         ),
//       ),
//     ),
//   ).fadeInOut();
// }





// Widget participantCard(BuildContext context,
//     ScrumSessionParticipant participant, bool showEstimates) {
//   return AnimatedContainer(
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeIn,
//       height: (participant.currentEstimate != null &&
//               participant.currentEstimate != '')
//           ? 250
//           : 200,
//       width: (participant.currentEstimate != null &&
//               participant.currentEstimate != '')
//           ? 175
//           : 145,
//       child: TweenAnimationBuilder(
//           tween: Tween<double>(begin: 0, end: showEstimates ? pi : 0),
//           duration: Duration(seconds: 1),
//           builder: (BuildContext context, double val, __) {
//             return (Transform(
//               alignment: Alignment.center,
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.001)
//                 ..rotateY(val),
//               // Adjust the angle as desired
//               child: Card(
//                 elevation: 3.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image:
//                                 AssetImage("assets/images/moroccan-flower.png"),
//                             fit: BoxFit.cover,
//                           ),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(5),
//                             topRight: Radius.circular(5),
//                           ),
//                         ),
//                         child: Center(
//                           child: CircleAvatar(
//                             child: (participant.currentEstimate == null ||
//                                     participant.currentEstimate == '')
//                                 ? heading6(context: context, text: '')
//                                 : showEstimates
//                                     ? heading3(
//                                             context: context,
//                                             text: participant.currentEstimate ??
//                                                 '')
//                                         .color(Colors.white)
//                                     : heading6(context: context, text: 'Ready')
//                                         .color(Colors.white),
//                             radius: (participant.currentEstimate == null ||
//                                     participant.currentEstimate == '')
//                                 ? 0
//                                 : 50,
//                             backgroundColor: showEstimates
//                                 ? Colors.blue[900]
//                                 : Colors.green[900],
//                           ),
//                         ),
//                       ),
//                     ),
//                     body1(context: context, text: participant.name)
//                         .paddingLRTB(left: 8, right: 8, top: 8, bottom: 16),
//                   ],
//                 ),
//               ),
//             ));
//           })).fadeInOut();
// }
