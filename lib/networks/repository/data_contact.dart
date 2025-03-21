/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/services.dart';
import 'package:gsl_task/utilities/app_json_path.dart';

class ContactData {
  Future<String> get() async {
    return await rootBundle.loadString(AppJsonPath.contactJson);
  }
}
