/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/contact/manager_contact.dart';
import 'package:gsl_task/networks/model/model_contact.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_constant.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/custom_text_field.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  TextEditingController searchTagController = TextEditingController();
  List<ContactModel> contacts = [];
  List<ContactModel> searchContacts = [];
  bool searchStart = false;
  String dataStatus = "";

  @override
  void initState() {
    ref.read(saveContactPreference.notifier).buildList();
    super.initState();
  }

  @override
  void dispose() {
    searchTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contacts = ref.watch(saveContactPreference).contacts;
    if (!searchStart){
      print("Hello");
      searchContacts = ref.watch(saveContactPreference).contacts;
      searchStart = true;
    }


    return ref.watch(saveContactPreference).buildStatus == AppConstant.loading
        ? Center(child: CircularProgressIndicator(color: Colors.black))
        : ref.watch(saveContactPreference).buildStatus == AppConstant.success
        ? ListView(
          padding: AppSize.paddingAll20,
          children: [
            CustomTextField.search(
              context: context,
              hint: AppText.searchContacts,
              controller: searchTagController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.search,
              prefix: Icons.search,
                onChanged: (value) {
                  final tempContacts = contacts.where((element) {
                    final contactTextLowerCase = element.name!.toLowerCase();
                    final search = value.toLowerCase();
                    return contactTextLowerCase.contains(search);
                  }).toList();
                  setState(() {
                    print(searchContacts);
                    searchContacts = tempContacts;
                  });
                }
            ),
            AppSize.gapH20,

            // contact
            Text(
              "${searchContacts.length} ${AppText.contacts}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppSize.gapH20,

            // contact list:
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchContacts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _contact(contact: searchContacts[index]);
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

  Widget _contact({required ContactModel contact}) {
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
                            image: AssetImage(contact.imageUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    AppSize.gapW10,

                    // name
                    Flexible(
                      child: Text(
                        contact.name!,
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

          _details(icon: Icons.mail_outline, details: contact.mail!),
          _details(icon: Icons.ring_volume_outlined, details: contact.phone!),
          _details(icon: Icons.place_outlined, details: contact.address!),
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
