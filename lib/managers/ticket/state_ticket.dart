/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:gsl_task/utilities/app_constant.dart';

import '../../networks/model/model_ticket.dart';

class TicketState {
  final String buildStatus;
  final List<TicketModel> tickets;

  TicketState({required this.buildStatus, required this.tickets});

  // Initial state with loading status
  factory TicketState.initial() {
    return TicketState(buildStatus: AppConstant.loading, tickets: []);
  }

  // CopyWith method to update specific fields
  TicketState copyWith({String? buildStatus, List<TicketModel>? tickets}) {
    return TicketState(
      buildStatus: buildStatus ?? this.buildStatus,
      tickets: tickets ?? this.tickets,
    );
  }
}