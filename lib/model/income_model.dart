import 'package:flutter/material.dart';

//Income Category
enum IncomeCategory {
  freelance,
  salary,
  passive,
  sales,
}

// category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/Images/freelance.png",
  IncomeCategory.passive: "assets/Images/car.png",
  IncomeCategory.salary: "assets/Images/health.png",
  IncomeCategory.sales: "assets/Images/salary.png",
};

// category colors

final Map<IncomeCategory, Color> incomeCategoryColor = {
  IncomeCategory.freelance: Color(0XFFE57373),
  IncomeCategory.passive: Color(0xFF81C784),
  IncomeCategory.salary: Color(0xFF64B5F6),
  IncomeCategory.sales: Color(0xFFFFD54F),
};

class Income {
  final int id;
  final String title;
  final double amountl;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income(
      {required this.id,
      required this.title,
      required this.amountl,
      required this.category,
      required this.date,
      required this.time,
      required this.description});
}
