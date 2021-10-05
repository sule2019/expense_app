import 'package:flutter/material.dart';

class BillModel {
  double billAmount = 0.0;
  double tipPercent = 0.0;
  double tipAmount = 0.0;
  double totalBill = 0.0;

  BillModel(this.billAmount, this.tipPercent, this.tipAmount, this.totalBill);
}
