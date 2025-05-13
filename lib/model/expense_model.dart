import 'package:flutter/material.dart';

enum ExpenseCategories {
  food,
  transport,
  health,
  shopping,
  subscription,
}

final Map<ExpenseCategories, String> expenseCategoriesImages = {
  ExpenseCategories.food: "assets/Images/restaurant.png",
  ExpenseCategories.transport: "assets/Images/car.png",
  ExpenseCategories.health: "assets/Images/health.png",
  ExpenseCategories.shopping: "assets/Images/bag.png",
  ExpenseCategories.subscription: "assets/Images/bill.png",
};

final Map<ExpenseCategories, Color> incomeCategoryColor = {
  ExpenseCategories.food: Color(0XFFE57373),
  ExpenseCategories.transport: Color(0xFF81C784),
  ExpenseCategories.health: Color(0xFF64B5F6),
  ExpenseCategories.shopping: Color(0xFFFFD54F),
  ExpenseCategories.subscription: Color(0xFFFFD54F),
};

//model
class Expense {
  final int id;
  final String title;
  final double amountl;
  final ExpenseCategories category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense(
      {required this.id,
      required this.title,
      required this.amountl,
      required this.category,
      required this.date,
      required this.time,
      required this.description});
}
