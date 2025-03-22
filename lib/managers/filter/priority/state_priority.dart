/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:gsl_task/networks/model/model_priority.dart';
import 'package:gsl_task/utilities/app_constant.dart';

class PriorityState {
  final String buildStatus;
  final List<PriorityModel> priorities;

  PriorityState({required this.buildStatus, required this.priorities});

  factory PriorityState.initial() {
    return PriorityState(buildStatus: AppConstant.loading, priorities: []);
  }

  PriorityState copyWith({
    String? buildStatus,
    List<PriorityModel>? priorities,
  }) {
    return PriorityState(
      buildStatus: buildStatus ?? this.buildStatus,
      priorities: priorities ?? this.priorities,
    );
  }
}
