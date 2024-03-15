class Request {
  String user;
  String userlocation;
  String userDestination;
  Request({
    required this.user,
    required this.userlocation,
    required this.userDestination,
  });
}




// class Request {
//   final int user;
//   final double presenetLocLongitude;
//   final double presenetLocLatitude;
//   final double destinationLocLongitude;
//   final double destinationLocLatitude;
//   final bool isDeleted;

//   Request({
//     required this.user,
//     required this.presenetLocLongitude,
//     required this.presenetLocLatitude,
//     required this.destinationLocLongitude,
//     required this.destinationLocLatitude,
//     required this.isDeleted,
//   });

//   factory Request.fromJson(Map<String, dynamic> json) {
//     return Request(
//       user: json['fields']['user'],
//       presenetLocLongitude: json['fields']['presenet_loc_longitude'],
//       presenetLocLatitude: json['fields']['presenet_loc_latitude'],
//       destinationLocLongitude: json['fields']['destination_loc_longitude'],
//       destinationLocLatitude: json['fields']['destination_loc_latitude'],
//       isDeleted: json['fields']['isDeleted'],
//     );
//   }
// }
