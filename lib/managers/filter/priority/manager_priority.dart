/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/filter/priority/state_priority.dart';
import 'package:gsl_task/networks/model/model_priority.dart';
import 'package:gsl_task/networks/repository/data_brand.dart';
import 'package:gsl_task/networks/repository/data_priority.dart';

import '../../../utilities/app_constant.dart';

final savePriorityPreference = StateNotifierProvider<PriorityManager, PriorityState>(
      (ref) => PriorityManager(),
);

class PriorityManager extends StateNotifier<PriorityState> {
  PriorityManager() : super(PriorityState.initial());

  Future<void> buildList() async {
    try {
      final List<dynamic> priorityList = json.decode(await PriorityData().get());
      final List<PriorityModel> priorities =
      priorityList.map((json) => PriorityModel.fromJson(json)).toList();

      state = state.copyWith(buildStatus: AppConstant.success, priorities: priorities);
    } catch (e) {
      state = state.copyWith(buildStatus: AppConstant.error, priorities: []);
    }
  }
}
