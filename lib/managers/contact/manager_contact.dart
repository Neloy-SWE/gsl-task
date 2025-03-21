/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/contact/state_contact.dart';
import 'package:gsl_task/networks/model/model_contact.dart';
import 'package:gsl_task/networks/repository/data_contact.dart';
import 'package:gsl_task/utilities/app_constant.dart';

final saveContactPreference =
    StateNotifierProvider<ContactManager, ContactState>(
      (ref) => ContactManager(),
    );

class ContactManager extends StateNotifier<ContactState> {
  ContactManager() : super(ContactState.initial());

  Future<void> buildList() async {
    try {
      final List<dynamic> contactList = json.decode(await ContactData().get());
      final List<ContactModel> contacts =
          contactList.map((json) => ContactModel.fromJson(json)).toList();

      state = state.copyWith(
        buildStatus: AppConstant.success,
        contacts: contacts,
      );
    } catch (e) {
      state = state.copyWith(buildStatus: AppConstant.error, contacts: []);
    }
  }
}
