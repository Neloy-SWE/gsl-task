/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_size.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/custom_appbar.dart';
import 'package:gsl_task/views/custom_widgets/custom_text_field.dart';
import 'package:gsl_task/views/custom_widgets/cutom_tag_container.dart';

typedef MenuEntry = DropdownMenuEntry<String>;

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Brands> brands = [
    Brands(id: 1, value: false, title: "AAA"),
    Brands(id: 2, value: false, title: "BBB"),
    Brands(id: 3, value: false, title: "CCC"),
  ];

  List<String> brandsName = [];

  static final List<String> priorities = [
    "Priority 1",
    "Priority 2",
    "Priority 3",
    "Priority 4",
  ];

  static final List<MenuEntry> priorityEntries =
      UnmodifiableListView<MenuEntry>(
        priorities.map<MenuEntry>(
          (String name) => MenuEntry(value: name, label: name),
        ),
      );

  String priority = "";

  TextEditingController searchTagController = TextEditingController();
  @override
  void dispose() {
    searchTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.filter(context: context),
      body: ListView(
        padding: AppSize.paddingAll20,
        children: [
          // brand check box:
          Text(AppText.brand, style: Theme.of(context).textTheme.titleMedium),
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
                      brands[index].title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColor.colorTextCheckbox,
                      ),
                    ),
                  ],
                ),
                value: brands[index].value,
                onChanged: (value) {
                  setState(() {
                    brands[index].value = value!;
                    if (brandsName.contains(brands[index].title)) {
                      brandsName.remove(brands[index].title);
                    } else {
                      brandsName.add(brands[index].title);
                    }
                  });

                  print(brandsName);
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

              print(priority);
            },
            dropdownMenuEntries: priorityEntries,
          ),
          AppSize.gapH15,

          // tags:
          Text(AppText.tags, style: Theme.of(context).textTheme.titleMedium),
          AppSize.gapH10,
          CustomTextField.search(
            context: context,
            hint: AppText.searchTags,
            controller: searchTagController,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.search,
            prefix: Icons.search
          ),
          AppSize.gapH10,

          // tag suggestions:
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(10, (index) {
              return CustomTagContainer.primary(
                context: context,
                status: "Low",
                active: false,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class Brands {
  int id;
  bool value;
  String title;

  Brands({required this.id, required this.value, required this.title});
}
