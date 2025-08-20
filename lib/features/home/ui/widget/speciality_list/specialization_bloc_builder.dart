import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/features/home/logic/home_cubit.dart';
import 'package:doc/features/home/logic/home_state.dart';
import 'package:doc/features/home/ui/widget/doctors_list/doctors_shimmer_loading.dart';
import 'package:doc/features/home/ui/widget/speciality_list/speciality_list_view.dart';
import 'package:doc/features/home/ui/widget/speciality_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () => setUpLoading(),
          specializationsSuccess: (specializationDataList) {
            var specializationsList = specializationDataList;
            return setUpSuccess(specializationsList);
          },
          specializationsError: (error) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setUpSuccess(specializationsList) {
    return SpecialityListView(
      specializationsDataList: specializationsList ?? [],
    );
  }

  Widget setUpLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
