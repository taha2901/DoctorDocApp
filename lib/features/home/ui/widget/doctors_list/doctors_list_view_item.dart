import 'package:cached_network_image/cached_network_image.dart';
import 'package:doc/core/helpers/spacing.dart';
import 'package:doc/core/theming/colors.dart';
import 'package:doc/core/theming/styles.dart';
import 'package:doc/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorsModel;
  final VoidCallback onTap;
  
  const DoctorsListViewItem({
    super.key,
    this.doctorsModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        splashColor: ColorsManager.mainBlue.withOpacity(0.2),
        highlightColor: ColorsManager.lightGrey.withOpacity(0.5),
        child: Container(
          padding: EdgeInsets.all(12.h),
          margin: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl:
                    "https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050",
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Shimmer.fromColors(
                    baseColor: ColorsManager.lightGrey,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 110.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                imageBuilder: (context, imageProvider) => Container(
                  width: 110.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorsModel?.name ?? 'taha',
                      style: TextStyles.font18DarkBlueBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(5),
                    Text(
                      '${doctorsModel?.degree} | ${doctorsModel?.phone}',
                      style: TextStyles.font12GrayMedium,
                    ),
                    verticalSpace(5),
                    Text(
                      doctorsModel?.email ?? 'Email@email.com',
                      style: TextStyles.font12GrayMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}