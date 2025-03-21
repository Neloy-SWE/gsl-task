/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gsl_task/managers/ticket/state_ticket.dart';
import 'package:gsl_task/networks/model/model_ticket.dart';
import 'package:gsl_task/networks/repository/data_ticket.dart';
import 'package:gsl_task/utilities/app_constant.dart';

final saveTicketPreference = StateNotifierProvider<TicketManager, TicketState>(
  (ref) => TicketManager(),
);

class TicketManager extends StateNotifier<TicketState> {
  TicketManager() : super(TicketState.initial());

  Future<void> buildList() async {
    try {
      final List<dynamic> ticketList = json.decode(await TicketData().get());
      final List<TicketModel> tickets =
          ticketList.map((json) => TicketModel.fromJson(json)).toList();

      state = state.copyWith(
        buildStatus: AppConstant.success,
        tickets: tickets,
      );
    } catch (e) {
      state = state.copyWith(buildStatus: AppConstant.error, tickets: []);
    }
  }
}
