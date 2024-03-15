// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class RequestContainer extends StatelessWidget {
//   final String name;
//   final String prelon;
//   final String prelat;
//   final String deslat;
//   final String deslon;
//   final Function onPresss;
//   final bool isDeleted;
//   const RequestContainer(
//       {Key? key,
//       required this.name,
//       required this.prelon,
//       required this.prelat,
//       required this.deslat,
//       required this.deslon,
//       required this.isDeleted,
//       required this.onPresss})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Container(
//           width: double.infinity,
//           height: 160,
//           decoration: const BoxDecoration(
//             color: Colors.cyan,
//             borderRadius: BorderRadius.all(Radius.circular(4)),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(name),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(prelon),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(prelat),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(deslon),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(deslat),
//                   ],
//                 ),
//                 Center(
//                   child: IconButton(
//                     icon: const Icon(Icons.delivery_dining),
//                     onPressed: () => onPresss() ,
//                   )
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:carconnect/Pages/booked.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestContainer extends StatelessWidget {
  final String user;
  final String userlocation;
  final String userDestination;

  const RequestContainer({
    Key? key,
    required this.user,
    required this.userlocation,
    required this.userDestination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('User: $user'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start Location : $userlocation',
                    softWrap: true,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Destination : $userDestination',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              ElevatedButton(
                child: const Text('Book This Ride'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Confirmation()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
