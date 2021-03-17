import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? emptyWidget()
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat('dd/MM/yyyy')
                              .format(transactions[index].date))
                        ],
                      )
                    ],
                  ));
                },
              ));
  }

  Widget emptyWidget() {
    return Column(
      children: [
        Text("No transactions added yet!"),
        Container(margin: EdgeInsets.only(top: 60), height: 200, child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover))
      ],
    );
  }
}
