import 'package:expensestracker/widgets/new_transaction.dart';

import './models/transaction.dart';

import 'package:expensestracker/widgets/transaction_list.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ExpensePage());
  }
}

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<Transaction> _userTransactions = [
    Transaction(
        itemName: "Grocesires", itemPrice: 12.50, itemDate: DateTime.now()),
    Transaction(
        itemName: "watch", itemPrice: 1250.50, itemDate: DateTime.now()),
    Transaction(
        itemName: "jacket", itemPrice: 1500.50, itemDate: DateTime.now()),
  ];
  void _addNewTransaction(String txName, double txPrice) {
    final newTx = Transaction(
        itemName: txName, itemPrice: txPrice, itemDate: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showAddTransaction(BuildContext bCtx) {
    showModalBottomSheet(
        context: bCtx,
        builder: (ctx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses Tracker"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _showAddTransaction(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Chart"),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _showAddTransaction(context);
        },
      ),
    );
  }
}
