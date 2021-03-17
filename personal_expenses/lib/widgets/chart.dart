import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum;

      for (var i = 0; i < recentTransactions.length - 1; i++) {
        final transactionDate = recentTransactions[i].date;
        if (transactionDate.day == weekDay.day &&
            transactionDate.month == weekDay.month &&
            transactionDate.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + tryCast(element["amount"], fallback: 0.0));
  }

  @override
  Widget build(BuildContext context) {
    print(this.recentTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: recentTransactions.isNotEmpty
          ? Row(
              children: groupedTransactionValues.map((data) {
                final amount = tryCast(data["amount"], fallback: 0.0);
                //final percentage = amount / totalSpending;
                return ChartBar(data["day"], amount, 10);
              }).toList(),
            )
          : Text("No transactions"),
    );
  }

  T tryCast<T>(dynamic x, {T fallback}) {
    try {
      return (x as T);
    } on Exception catch (e) {
      print('CastError when trying to cast $x to $T!');
      return fallback;
    }
  }
}
