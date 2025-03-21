/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_font.dart';
import 'package:gsl_task/utilities/app_image.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // introduction:
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 30),
          color: AppColor.colorBottomNavBarItemBackground,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // profile image:
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImage.profile),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    AppSize.gapW15,

                    // name
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Michale Kahnwald",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColor.colorTextCheckbox),
                          ),
                          Text(
                            AppText.support,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColor.colorTextTicketID),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.rate_review_outlined,
                  size: 24,
                  color: AppColor.colorTextTitle,
                ),
              ),
            ],
          ),
        ),

        // basic info:
        Container(
          padding: AppSize.paddingAll20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.basicInfo,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _basicInfo(title: AppText.firstName, value: "AAA"),
                    AppSize.gapH05,
                    _basicInfo(title: AppText.lastName, value: "BBB"),
                    AppSize.gapH05,
                    _basicInfo(title: AppText.email, value: "abc@email.com"),
                  ],
                ),
              ),
            ],
          ),
        ),


        // assign role:
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 15),
          child: Text(
            "${AppText.assignedRoles}(3)",
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium,
          ),
        ),
        SizedBox(
          height: 192,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  AppSize.gapW15,
                  Container(
                    padding: AppSize.paddingAll20,
                    decoration: BoxDecoration(
                      color: AppColor.colorCardBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manager",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge,
                        ),

                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.65,
                          child: Divider(
                            color: AppColor.colorBorder,
                            height: 20,
                          ),
                        ),

                        Text(
                          AppText.group,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.colorTextTicketID),
                        ),
                        Text(
                          "Codecyaneon support",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontFamily: AppFont.font600,),
                        ),
                        AppSize.gapH05,

                        Text(
                          AppText.manager,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.colorTextTicketID),
                        ),
                        AppSize.gapH05,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // profile image:
                            Container(
                              height: 32,
                              width: 32,
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
                                height: 28,
                                width: 28,
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
                            Text(
                              "Michale Kahnwald",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontFamily: AppFont.font600),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        AppSize.gapH20,

        // logout button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            onPressed: () {},
            elevation: 0,
            height: 50,
            color: AppColor.colorStatusOverdueBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                41,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: AppColor.colorNotification,
                  size: 20,
                ),
                AppSize.gapW10,
                Text(
                  AppText.logout,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.colorNotification),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _basicInfo({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme
              .of(
            context,
          )
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColor.colorTextTicketID),
        ),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
      ],
    );
  }
}
