/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:gsl_task/networks/model/model_contact.dart';
import 'package:gsl_task/utilities/app_constant.dart';

class ContactState {
  final String buildStatus;
  final List<ContactModel> contacts;

  ContactState({required this.buildStatus, required this.contacts});

  factory ContactState.initial() {
    return ContactState(buildStatus: AppConstant.loading, contacts: []);
  }

  ContactState copyWith({String? buildStatus, List<ContactModel>? contacts}) {
    return ContactState(
      buildStatus: buildStatus ?? this.buildStatus,
      contacts: contacts ?? this.contacts,
    );
  }
}
