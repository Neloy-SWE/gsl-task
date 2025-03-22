/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/filter/brand/manager_brand.dart';
import 'package:gsl_task/managers/filter/priority/manager_priority.dart';
import 'package:gsl_task/networks/model/model_brand.dart';
import 'package:gsl_task/networks/model/model_priority.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_constant.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/custom_appbar.dart';
import 'package:gsl_task/views/custom_widgets/custom_text_field.dart';
import 'package:gsl_task/views/custom_widgets/cutom_tag_container.dart';

typedef MenuEntry = DropdownMenuEntry<String>;

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  List<BrandModel> brands = [];
  List<String> brandsName = [];
  List<PriorityModel> priorities = [];
  String priority = "";
  List<String> tags = [];
  late List<MenuEntry> priorityEntries;

  TextEditingController searchTagController = TextEditingController();

  @override
  void initState() {
    ref.read(saveBrandPreference.notifier).buildList();
    ref.read(savePriorityPreference.notifier).buildList();
    super.initState();
  }

  @override
  void dispose() {
    searchTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    brands = ref.watch(saveBrandPreference).brands;
    priorities = ref.watch(savePriorityPreference).priorities;
    if (ref.watch(savePriorityPreference).buildStatus == AppConstant.success) {
      priorityEntries = UnmodifiableListView<MenuEntry>(
        priorities.map<MenuEntry>(
          (value) => MenuEntry(value: value.priority!, label: value.priority!),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppbar.filter(context: context),
      body:
          _getBuildStatus() == AppConstant.loading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : _getBuildStatus() == AppConstant.success
              ? ListView(
                padding: AppSize.paddingAll20,
                children: [
                  // brand check box:
                  Text(
                    AppText.brand,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppSize.gapH10,
                  Column(
                    children: List.generate(
                      brands.length,
                      (index) => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Row(
                          children: [
                            Icon(
                              Icons.ac_unit,
                              color: AppColor.colorBottomAppBarActive,
                            ),
                            AppSize.gapW05,
                            Text(
                              brands[index].name!,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: AppColor.colorTextCheckbox),
                            ),
                          ],
                        ),
                        value: brands[index].value,
                        onChanged: (value) {
                          setState(() {
                            brands[index].value = value!;
                            if (brandsName.contains(brands[index].name)) {
                              brandsName.remove(brands[index].name);
                            } else {
                              brandsName.add(brands[index].name!);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  AppSize.gapH20,

                  // priority dropdown:
                  Text(
                    AppText.priority,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppSize.gapH15,
                  DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width - 40,
                    hintText: AppText.selectPriority,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    trailingIcon: Icon(Icons.keyboard_arrow_down),
                    onSelected: (String? value) {
                      setState(() {
                        priority = value!;
                      });
                    },
                    dropdownMenuEntries: priorityEntries,
                  ),
                  AppSize.gapH15,

                  // tags:
                  Text(
                    AppText.tags,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  AppSize.gapH10,
                  CustomTextField.search(
                    context: context,
                    hint: AppText.searchTags,
                    controller: searchTagController,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    prefix: Icons.search,
                    onFieldSubmitted: (value) {
                      setState(() {
                        if (!tags.contains(value)) {
                          tags.add(value);
                        }

                        searchTagController.clear();
                      });
                    },
                  ),
                  AppSize.gapH10,

                  // searched tags:
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(tags.length, (index) {
                      return CustomTagContainer.primary(
                        context: context,
                        status: tags[index],
                        active: false,
                      );
                    }),
                  ),
                ],
              )
              : Center(
                child: Text(
                  AppText.tryAgainLater,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
    );
  }

  String _getBuildStatus() {
    if (ref.watch(saveBrandPreference).buildStatus == AppConstant.loading &&
        ref.watch(savePriorityPreference).buildStatus == AppConstant.loading) {
      return AppConstant.loading;
    } else if (ref.watch(saveBrandPreference).buildStatus ==
            AppConstant.success &&
        ref.watch(savePriorityPreference).buildStatus == AppConstant.success) {
      return AppConstant.success;
    } else {
      return AppConstant.error;
    }
  }
}
