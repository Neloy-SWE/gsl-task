/* 
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/ticket/manager_ticket.dart';
import 'package:gsl_task/networks/model/model_ticket.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_constant.dart';
import 'package:gsl_task/utilities/app_font.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/cutom_tag_container.dart';
import 'package:gsl_task/views/screens/screen_filter.dart';

class TicketScreen extends ConsumerStatefulWidget {
  const TicketScreen({super.key});

  @override
  ConsumerState<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends ConsumerState<TicketScreen> {
  List<TicketModel> tickets = [];
  String dataStatus = "";

  @override
  void initState() {
    ref.read(saveTicketPreference.notifier).buildList();
    super.initState();
  }

  Color getStatusColor({required String status}) {
    switch (status) {
      case AppText.statusNew:
        return AppColor.colorStatusNew;
      case AppText.statusFirstResponseOverdue:
        return AppColor.colorStatusFirstResponseOverdue;
      case AppText.statusOverdue:
        return AppColor.colorNotification;
      case AppText.statusCustomerResponded:
        return AppColor.colorStatusCustomerResponded;
      default:
        return Colors.black;
    }
  }

  Color getStatusBackgroundColor({required String status}) {
    switch (status) {
      case AppText.statusNew:
        return AppColor.colorStatusNewBackground;
      case AppText.statusFirstResponseOverdue:
        return AppColor.colorStatusFirstResponseOverdueBackground;
      case AppText.statusOverdue:
        return AppColor.colorStatusOverdueBackground;
      case AppText.statusCustomerResponded:
        return AppColor.colorStatusCustomerRespondedBackground;
      default:
        return Colors.white24;
    }
  }

  bool getTagActiveStatus({required String tag}) {
    switch (tag) {
      case AppText.tagLow:
      case AppText.tagMedium:
      case AppText.tagUrgent:
        return true;

      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    tickets = ref.watch(saveTicketPreference).tickets;

    return ref.watch(saveTicketPreference).buildStatus == AppConstant.loading
        ? Center(child: CircularProgressIndicator(color: Colors.black))
        : ref.watch(saveTicketPreference).buildStatus == AppConstant.success
        ? ListView(
          padding: AppSize.paddingAll20,
          children: [
            // ticket information and filter:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${tickets.length} ${AppText.tickets}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (builder) => FilterScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: AppColor.colorTextTitle,
                    size: 30,
                  ),
                ),
              ],
            ),
            AppSize.gapH10,

            // ticket list:
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tickets.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _ticket(ticket: tickets[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return AppSize.gapH15;
              },
            ),
          ],
        )
        : Center(
          child: Text(
            AppText.tryAgainLater,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
  }

  Widget _ticket({required TicketModel ticket}) {
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
            status: ticket.status!,
            statusTextColor: getStatusColor(status: ticket.status!),
            statusBackgroundColor: getStatusBackgroundColor(
              status: ticket.status!,
            ),
          ),
          AppSize.gapH15,

          // id:
          Text(
            "${AppText.id}${ticket.id}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColor.colorTextTicketID,
              fontSize: 11,
            ),
          ),
          AppSize.gapH10,

          //task name:
          Text(
            ticket.description!,
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
                ticket.assign!,
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
                ticket.date!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontFamily: AppFont.font500),
              ),
            ],
          ),
          Divider(height: 20),

          // tags
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(ticket.tag!.length, (index) {
              return CustomTagContainer.primary(
                context: context,
                status: ticket.tag![index],
                active: getTagActiveStatus(tag: ticket.tag![index]),
              );
            }),
          ),
        ],
      ),
    );
  }
}
