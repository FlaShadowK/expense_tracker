import 'package:flutter/material.dart';

class Transactions {
  final String title;
  final double amount;
  final String date;

  Transactions(
      @required this.title, @required this.amount, @required this.date);
}
