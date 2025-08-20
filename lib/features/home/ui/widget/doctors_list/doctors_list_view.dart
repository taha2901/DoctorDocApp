// import 'package:doc/core/routings/routers.dart';
// import 'package:doc/features/home/data/models/specializations_response_model.dart';
// import 'package:doc/features/home/ui/widget/doctors_list/doctors_list_view_item.dart';
// import 'package:flutter/material.dart';

// class DoctorsListView extends StatelessWidget {
//   final List<Doctors?>? doctorsList;
//   const DoctorsListView({super.key, required this.doctorsList});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: doctorsList?.length,
//         itemBuilder: (context, index) {
//           final doctor = doctorsList?[index];
//           return Padding(
//             padding: const EdgeInsets.only(
//                 bottom: 16), // عشان يبقى فيه مسافة بين العناصر
//             child: Material(
//               color: Colors.white, // الخلفية اللي يظهر فوقها الـ Ripple
//               borderRadius: BorderRadius.circular(12),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(12),
//                 onTap: () {
//                   Navigator.pushNamed(
//                     context,
//                     Routers.doctorInfoDetails,
//                     arguments: doctor,
//                   );
//                 },
//                 child: DoctorsListViewItem(doctorsModel: doctor),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:doc/core/routings/routers.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:doc/features/home/ui/widget/doctors_list/doctors_list_view_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          final doctor = doctorsList?[index];
          return DoctorsListViewItem(
            doctorsModel: doctor,
            onTap: () {
              Navigator.pushNamed(
                context,
                Routers.doctorInfoDetails,
                arguments: doctor,
              );
            },
          );
        },
      ),
    );
  }
}