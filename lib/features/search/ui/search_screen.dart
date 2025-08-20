import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/features/search/data/doctor_filter_model.dart';
import 'package:doc/features/search/logic/doctor_filter_cubit.dart';
import 'package:doc/features/search/logic/doctor_filter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});

  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  // late DoctorFilterCubit searchCubit;

  // @override
  // void initState() {
  //   super.initState();
  //   searchCubit = getit<DoctorFilterCubit>();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Search'),
        leading: const BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          // searchCubit.search(value); //

                          BlocProvider.of< DoctorFilterCubit>(context).search(value);
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.filter_list),
                ),
              ],
            ),
            verticalSpace(16),
            BlocBuilder<DoctorFilterCubit, DoctorFilterState>(
              builder: (context, state) {
                if (state is DoctorFilterLoading) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is DoctorFilterLoaded) {
                  final doctors = state.doctors;
                  return Expanded(
                      child: AnimationLimiter(
                          child: ListView.builder(
                    itemCount: doctors.length, // <== أضف السطر ده!
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: _buildDoctorCardFromModel(doctors[index]),
                          ),
                        ),
                      );
                    },
                  )));
                } else if (state is DoctorFilterError) {
                  return Expanded(child: Center(child: Text(state.message)));
                } else {
                  return const Expanded(
                      child:
                          Center(child: Text("Start searching for doctors")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCardFromModel(DoctorFilterResponseModel doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/Image.png',
                  width: 80.w, height: 80.h, fit: BoxFit.cover)),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(doctor.name,
                //     style: const TextStyle(fontWeight: FontWeight.bold)),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: _highlightText(
                        doctor.name ?? '', _searchController.text),
                  ),
                ),

                Text("${doctor.email} | ${doctor.name}",
                    style: const TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    verticalSpace(4),
                    Text("${doctor.phone}",
                        style: const TextStyle(fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<TextSpan> _highlightText(String source, String query) {
  if (query.isEmpty || source.isEmpty) return [TextSpan(text: source)];

  final List<TextSpan> spans = [];
  int start = 0;

  final lowerSource = source.toLowerCase();
  final lowerQuery = query.toLowerCase();

  while (start < source.length) {
    final index = lowerSource.indexOf(lowerQuery, start);

    if (index == -1) {
      spans.add(TextSpan(text: source.substring(start)));
      break;
    }

    // الجزء اللي قبل الماتش
    if (index > start) {
      spans.add(TextSpan(text: source.substring(start, index)));
    }

    // حساب نهاية الماتش بدقة
    final end = (index + query.length).clamp(0, source.length);

    spans.add(TextSpan(
      text: source.substring(index, end),
      style: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ));

    start = end;
  }

  return spans;
}
