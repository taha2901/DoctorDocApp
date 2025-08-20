import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:doc/features/home/logic/home_cubit.dart';
import 'package:doc/features/home/ui/widget/speciality_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  final List<SpecializationsData?> specializationsDataList;
  const SpecialityListView(
      {super.key, required this.specializationsDataList});

  @override
  State<SpecialityListView> createState() =>
      _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: widget.specializationsDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                    specializationId: widget.specializationsDataList[index]?.id,
                  );
            },
            child: SpecialityListViewitem(
              itemIndex: index,
              specializationsData: widget.specializationsDataList[index],
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
