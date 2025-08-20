import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/routings/routers.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Doctors doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // عدد التابات
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(doctor.name ?? 'Doctor Info'),
          actions: [
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              verticalSpace(24),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/Image.png',
                        width: 70.w,
                        height: 70.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(4),
                          Text(
                            doctor.degree ?? '',
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(4),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              SizedBox(width: 4),
                              Text("4.8 (4,279 reviews)",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(FontAwesomeIcons.commentDots,
                        color: Colors.blue),
                  ],
                ),
              ),
              verticalSpace(16),
              const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Location"),
                  Tab(text: "Reviews"),
                ],
              ),
              verticalSpace(8),
              Expanded(
                child: TabBarView(
                  children: [
                    // About
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("About me",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          verticalSpace(8),
                          Text(
                            "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. "
                            "She achieved several awards for her wonderful contribution in medical field. She is available for private consultation.",
                            style: TextStyles.font14GreyRegular,
                          ),
                          verticalSpace(16),
                          const Text("Working Time",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          verticalSpace(12),
                          Text(
                            "Monday - Friday, ${doctor.startTime ?? "08.00 AM"} - ${doctor.endTime ?? "05.00 PM"}",
                            style: TextStyles.font14GreyRegular,
                          ),
                          verticalSpace(16),
                          const Text("STR",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          verticalSpace(16),
                          Text("4726482464",
                              style: TextStyles.font14GreyRegular),
                          verticalSpace(16),
                          const Text("Pengalaman Praktik",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          verticalSpace(16),
                          Text("RSPAD Gatot Soebroto\n2017 - sekarang",
                              style: TextStyles.font14GreyRegular),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Practice Place',
                              style: TextStyles.font16BlackBold),
                          verticalSpace(8),
                          Text(doctor.address.toString(),
                              style: TextStyles.font14GreyRegular),
                        ],
                      ),
                    ),
                    const Center(child: Text("Reviews content here")),
                  ],
                ),
              ),
              // Bottom button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorsManager.mainBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routers.bookAppointMent,
                        arguments: doctor,
                      );
                    },
                    child: const Text(
                      "Make An Appointment",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
