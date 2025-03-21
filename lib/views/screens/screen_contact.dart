/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_image.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/custom_text_field.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController searchTagController = TextEditingController();

  @override
  void dispose() {
    searchTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSize.paddingAll20,
      children: [
        CustomTextField.search(
          context: context,
          hint: AppText.searchContacts,
          controller: searchTagController,
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.search,
          prefix: Icons.search,
        ),
        AppSize.gapH20,

        // contact
        Text(
          "124 ${AppText.contacts}",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        AppSize.gapH20,

        // contact list:
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _contact();
          },
          separatorBuilder: (BuildContext context, int index) {
            return AppSize.gapH15;
          },
        ),
      ],
    );
  }

  Widget _contact() {
    return Container(
      padding: AppSize.paddingAll10,
      decoration: BoxDecoration(
        color: AppColor.colorCardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // profile image:
                    Container(
                      height: 44,
                      width: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColor.colorBorder,
                          width: 1,
                        ),
                      ),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImage.profile),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    AppSize.gapW10,

                    // name
                    Flexible(
                      child: Text(
                        "Michale Kahnwald",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),

              // menu
              Expanded(
                flex: 1,
                child: PopupMenuButton<int>(
                  icon: Icon(Icons.more_vert_outlined), // Your icon button
                  onSelected: (value) {},
                  color: Colors.white,
                  itemBuilder:
                      (context) => [
                        PopupMenuItem<int>(
                          value: 1,
                          height: 40,
                          child: Text(
                            AppText.edit,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(fontSize: 14),
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          height: 40,
                          child: Text(
                            AppText.delete,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(fontSize: 14),
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 3,
                          height: 40,
                          child: Text(
                            AppText.viewTickets,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                ),
              ),
            ],
          ),
          AppSize.gapH20,

          _details(icon: Icons.mail_outline, details: "abc@mail.com"),
          _details(icon: Icons.ring_volume_outlined, details: "+12 34 56 678"),
          _details(icon: Icons.place_outlined, details: "12A Labc, NK"),
        ],
      ),
    );
  }

  Widget _details({required IconData icon, required String details}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: AppColor.colorTextNormal, size: 20),
        AppSize.gapW05,
        Text(details, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
