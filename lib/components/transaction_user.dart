import 'dart:math';

import 'package:flutter/material.dart';
import 'transactiom_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.70,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta #02',
      value: 211.30,
      date: DateTime.now(),
    ), Transaction(
      id: 't3',
      title: 'Conta #03',
      value: 211.30,
      date: DateTime.now(),
    ), Transaction(
      id: 't4',
      title: 'Conta #04',
      value: 211.30,
      date: DateTime.now(),
    ), Transaction(
      id: 't5',
      title: 'Conta #05',
      value: 211.30,
      date: DateTime.now(),
    ), Transaction(
      id: 't6',
      title: 'Conta #06',
      value: Random().nextInt(999) + (Random().nextInt(99)/1000),
      date: DateTime.now(),
    ), Transaction(
      id: 't7',
      title: 'Conta #07',
      value: Random().nextInt(999) + (Random().nextInt(99)/1000),
      date: DateTime.now(),
    ), Transaction(
      id: 't8',
      title: 'Conta #08',
      value: Random().nextInt(999) + (Random().nextInt(99)/1000),
      date: DateTime.now(),
    ), Transaction(
      id: 't9',
      title: 'Conta #09',
      value: Random().nextInt(999) + (Random().nextInt(99)/1000),
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble.toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  } //_addTransaction

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
