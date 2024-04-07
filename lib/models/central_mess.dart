import 'package:flutter/foundation.dart';

class MessInfo {
  final String studentId;
  final String messOption;

  MessInfo({
    required this.studentId,
    required this.messOption,
  });

  factory MessInfo.fromJson(Map<String, dynamic> json) {
    return MessInfo(
      studentId: json['student_id'],
      messOption: json['mess_option'],
    );
  }
}

class MessReg {
  final int sem;
  final DateTime startReg;
  final DateTime endReg;

  MessReg({
    required this.sem,
    required this.startReg,
    required this.endReg,
  });

  factory MessReg.fromJson(Map<String, dynamic> json) {
    return MessReg(
      sem: json['sem'],
      startReg: DateTime.parse(json['start_reg']),
      endReg: DateTime.parse(json['end_reg']),
    );
  }
}

class MessBillBase {
  final int billAmount;
  final DateTime timestamp;

  MessBillBase({
    required this.billAmount,
    required this.timestamp,
  });

  factory MessBillBase.fromJson(Map<String, dynamic> json) {
    return MessBillBase(
      billAmount: json['bill_amount'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class MonthlyBill {
  final String studentId;
  final String month;
  final int year;
  final int amount;
  final int rebateCount;
  final int rebateAmount;
  final int totalBill;
  final bool paid;

  MonthlyBill({
    required this.studentId,
    required this.month,
    required this.year,
    required this.amount,
    required this.rebateCount,
    required this.rebateAmount,
    required this.totalBill,
    required this.paid,
  });

  factory MonthlyBill.fromJson(Map<String, dynamic> json) {
    return MonthlyBill(
      studentId: json['student_id'],
      month: json['month'],
      year: json['year'],
      amount: json['amount'],
      rebateCount: json['rebate_count'],
      rebateAmount: json['rebate_amount'],
      totalBill: json['total_bill'],
      paid: json['paid'],
    );
  }
}

class Payment {
  final String studentId;
  final int amountPaid;

  Payment({
    required this.studentId,
    required this.amountPaid,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      studentId: json['student_id'],
      amountPaid: json['amount_paid'],
    );
  }
}

class MessMenu {
  late final String messOption;
  late final String mealTime;
  late final String dish;

  MessMenu({
    required this.messOption,
    required this.mealTime,
    required this.dish,
  });

  factory MessMenu.fromJson(Map<String, dynamic> json) {
    return MessMenu(
      messOption: json['mess_option'],
      mealTime: json['meal_time'],
      dish: json['dish'],
    );
  }
}

class Rebate {
  final String? studentId;
  final DateTime startDate;
  final DateTime endDate;
  final String purpose;
  final String status;
  final DateTime appDate;
  final String leaveType;

  Rebate({
    this.studentId,
    required this.startDate,
    required this.endDate,
    required this.purpose,
    required this.status,
    required this.appDate,
    required this.leaveType,
  });

  factory Rebate.fromJson(Map<String, dynamic> json) {
    return Rebate(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      purpose: json['purpose'],
      status: json['status'],
      appDate: DateTime.parse(json['app_date']),
      leaveType: json['leave_type'],
    );
  }
}

class VacationFood {
  final String studentId;
  final DateTime startDate;
  final DateTime endDate;
  final String purpose;
  final String status;
  final DateTime appDate;

  VacationFood({
    required this.studentId,
    required this.startDate,
    required this.endDate,
    required this.purpose,
    required this.status,
    required this.appDate,
  });

  factory VacationFood.fromJson(Map<String, dynamic> json) {
    return VacationFood(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      purpose: json['purpose'],
      status: json['status'],
      appDate: DateTime.parse(json['app_date']),
    );
  }
}

class SpecialRequest {
  final String? studentId;
  final DateTime startDate;
  final DateTime endDate;
  final String? request;
  final String? status;
  final String? item1;
  final String? item2;
  final DateTime appDate;

  SpecialRequest({
    this.studentId,
    required this.startDate,
    required this.endDate,
    required this.request,
    required this.status,
    required this.item1,
    required this.item2,
    required this.appDate,
  });

  factory SpecialRequest.fromJson(Map<String, dynamic> json) {
    return SpecialRequest(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      request: json['request'],
      status: json['status'],
      item1: json['item1'],
      item2: json['item2'],
      appDate: DateTime.parse(json['app_date']),
    );
  }
}

class MessMeeting {
  final DateTime meetDate;
  final String agenda;
  final String venue;
  final String meetingTime;

  MessMeeting({
    required this.meetDate,
    required this.agenda,
    required this.venue,
    required this.meetingTime,
  });

  factory MessMeeting.fromJson(Map<String, dynamic> json) {
    return MessMeeting(
      meetDate: DateTime.parse(json['meet_date']),
      agenda: json['agenda'],
      venue: json['venue'],
      meetingTime: json['meeting_time'],
    );
  }
}

class MessMinutes {
  final DateTime meetingDate;
  final String messMinutes;

  MessMinutes({
    required this.meetingDate,
    required this.messMinutes,
  });

  factory MessMinutes.fromJson(Map<String, dynamic> json) {
    return MessMinutes(
      meetingDate: DateTime.parse(json['meeting_date']),
      messMinutes: json['mess_minutes'],
    );
  }
}

class MenuChangeRequest {
  final int id;
  final MessMenu dish;
  final String studentId;
  final String reason;
  final String request;
  final String status;
  final DateTime appDate;

  MenuChangeRequest({
    required this.id,
    required this.dish,
    required this.studentId,
    required this.reason,
    required this.request,
    required this.status,
    required this.appDate,
  });

  factory MenuChangeRequest.fromJson(Map<String, dynamic> json) {
    return MenuChangeRequest(
      id: json['id'],
      dish: MessMenu.fromJson(json['dish']),
      studentId: json['student_id'],
      reason: json['reason'],
      request: json['request'],
      status: json['status'],
      appDate: DateTime.parse(json['app_date']),
    );
  }
}

class MessFeedback {
  late final String? studentId;
  late final String mess;
  late final int messRating;
  late final DateTime fdate;
  late final String description;
  late final String feedbackType;

  MessFeedback({
    this.studentId,
    required this.mess,
    required this.messRating,
    required this.fdate,
    required this.description,
    required this.feedbackType,
  });

  factory MessFeedback.fromJson(Map<String, dynamic> json) {
    return MessFeedback(
      studentId: json['student_id'],
      mess: json['mess'],
      messRating: json['mess_rating'],
      fdate: DateTime.parse(json['fdate']),
      description: json['description'],
      feedbackType: json['feedback_type'],
    );
  }
}
