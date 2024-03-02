
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
class MarketingItem extends StatelessWidget {
  const MarketingItem({super.key, required this.marketing});

  final Marketing marketing;

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
            marketing.title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: b2Medium(),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatedDate(marketing.timeStamp),
                style: b3Medium(colorText: CustomColor.primary700),
              ),
              Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: marketing.status == "To Do"
                      ? CustomColor.success600
                      : marketing.status == "In Progress"
                          ? CustomColor.preventive
                          : CustomColor.checklist,
                ),
                child: Text(marketing.status, style: b3Bold(colorText: CustomColor.primary100),),
              )
            ],
          )
        ],
      ),
    );
  }
}
