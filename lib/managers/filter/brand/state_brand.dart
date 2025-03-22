/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:gsl_task/networks/model/model_brand.dart';
import 'package:gsl_task/utilities/app_constant.dart';

class BrandState {
  final String buildStatus;
  final List<BrandModel> brands;

  BrandState({required this.buildStatus, required this.brands});

  factory BrandState.initial() {
    return BrandState(buildStatus: AppConstant.loading, brands: []);
  }

  BrandState copyWith({String? buildStatus, List<BrandModel>? brands}) {
    return BrandState(
      buildStatus: buildStatus ?? this.buildStatus,
      brands: brands ?? this.brands,
    );
  }
}
