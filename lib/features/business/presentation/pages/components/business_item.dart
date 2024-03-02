
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';

class BusinessItem extends StatelessWidget {
  const BusinessItem({super.key, required this.business});

  final Business business;

  @override
  Widget build(BuildContext context) {
    String formatedDate(DateTime datetime) {
      return DateFormat('d MMM').format(datetime);
    }

    return Ink(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            business.title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: b2Medium(),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatedDate(business.timeStamp),
                style: b3Medium(colorText: CustomColor.primary700),
              ),
              Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: business.status == "To Do"
                      ? CustomColor.success600
                      : business.status == "In Progress"
                          ? CustomColor.preventive
                          : CustomColor.checklist,
                ),
                child: Text(business.status, style: b3Bold(colorText: CustomColor.primary100),),
              )
            ],
          )
        ],
      ),
    );
  }
}
