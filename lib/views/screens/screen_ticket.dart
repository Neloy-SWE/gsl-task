/* 
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_font.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/cutom_tag_container.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSize.paddingAll20,
      children: [
        // ticket information and filter:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "124 ${AppText.tickets}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt_outlined,
                color: AppColor.colorTextTitle,
                size: 20,
              ),
            ),
          ],
        ),
        AppSize.gapH10,

        // ticket list:
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _ticket();
          }, separatorBuilder: (BuildContext context, int index) {
            return AppSize.gapH15;
        },
        ),
      ],
    );
  }

  Widget _ticket() {
    return Container(
      padding: AppSize.paddingAll10,
      decoration: BoxDecoration(
        color: AppColor.colorCardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // status:
          CustomTagContainer.status(
            context: context,
            status: AppText.statusNew,
            statusTextColor: AppColor.colorStatusNew,
            statusBackgroundColor: AppColor.colorStatusNewBackground,
          ),
          AppSize.gapH15,

          // id:
          Text(
            "${AppText.id}1232123",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColor.colorTextTicketID,
              fontSize: 11,
            ),
          ),
          AppSize.gapH10,

          //task name:
          Text(
            "Hello world Hello world Hello world Hello world Hello world Hello world Hello world HelloworldHelloworldtitleMedium",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontSize: 14),
          ),
          AppSize.gapH05,

          // assign and date:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Name",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontFamily: AppFont.font500),
              ),
              AppSize.gapW10,

              Container(
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.colorBorder,
                ),
              ),
              AppSize.gapW10,

              Text(
                "23 Dec 2023 03:43 pm",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontFamily: AppFont.font500),
              ),
            ],
          ),
          Divider(height: 20),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(10, (index) {
              return _tag();
            }),
          ),
        ],
      ),
    );
  }

  Widget _tag() {
    return CustomTagContainer.primary(
      context: context,
      status: "Low",
      active: true,
    );
  }
}
