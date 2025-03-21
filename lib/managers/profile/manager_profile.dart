/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/profile/state_profile.dart';
import 'package:gsl_task/networks/model/model_profile.dart';
import 'package:gsl_task/networks/repository/data_profile.dart';
import 'package:gsl_task/utilities/app_constant.dart';

final saveProfilePreference =
StateNotifierProvider<ProfileManager, ProfileState>(
      (ref) => ProfileManager(),
);

class ProfileManager extends StateNotifier<ProfileState>{
  ProfileManager() : super(ProfileState.initial());

  Future<void> buildProfile() async {
    try {
      final Map<String, dynamic> profileData = json.decode(await ProfileData().get());
      final ProfileModel profile = ProfileModel.fromJson(profileData);

      state = state.copyWith(
        buildStatus: AppConstant.success,
        profile: profile,
      );
    } catch (e) {
      state = state.copyWith(buildStatus: AppConstant.error, profile: ProfileModel());
    }
  }
}