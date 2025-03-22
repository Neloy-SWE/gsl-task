/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/filter/brand/state_brand.dart';
import 'package:gsl_task/networks/model/model_brand.dart';
import 'package:gsl_task/networks/repository/data_brand.dart';

import '../../../utilities/app_constant.dart';

final saveBrandPreference = StateNotifierProvider<BrandManager, BrandState>(
  (ref) => BrandManager(),
);

class BrandManager extends StateNotifier<BrandState> {
  BrandManager() : super(BrandState.initial());

  Future<void> buildList() async {
    try {
      final List<dynamic> brandList = json.decode(await BrandData().get());
      final List<BrandModel> brands =
          brandList.map((json) => BrandModel.fromJson(json)).toList();

      state = state.copyWith(buildStatus: AppConstant.success, brands: brands);
    } catch (e) {
      state = state.copyWith(buildStatus: AppConstant.error, brands: []);
    }
  }
}
