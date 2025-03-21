/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:gsl_task/networks/model/model_profile.dart';
import 'package:gsl_task/utilities/app_constant.dart';

class ProfileState {
  final String buildStatus;
  final ProfileModel profile;

  ProfileState({required this.buildStatus, required this.profile});

  factory ProfileState.initial() {
    return ProfileState(
      buildStatus: AppConstant.loading,
      profile: ProfileModel(),
    );
  }

  ProfileState copyWith({String? buildStatus, ProfileModel? profile}) {
    return ProfileState(
      buildStatus: buildStatus ?? this.buildStatus,
      profile: profile ?? this.profile,
    );
  }
}
