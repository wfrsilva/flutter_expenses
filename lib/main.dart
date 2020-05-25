import 'package:flutter/material.dart';
import 'dart:math';

import 'components/chart.dart';
import 'components/transactiom_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.red,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  //'title' is deprecated and shouldn't be used. (...). The modern term is headline6.
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    
  final List<Transaction> _transactions = [
    /*final _transactions = [*/
    Transaction(
      id: 't0',
      title: 'Conta antiga',
      value: 400.00,
      date: DateTime.now().subtract(Duration(days: 33)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.70,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Água',
      value: 211.30,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't3',
      title: 'Cartão de Credito',
      value: 150.78,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't4',
      title: 'Lanche',
      value: 15.00,
      date: DateTime.now().subtract(Duration(days: 6)),
    ), 
    Transaction(
      id: 't5',
      title: 'T05',
      value: 200.00,
      date: DateTime.now().subtract(Duration(days: 7)),
    ), 
    Transaction(
      id: 't6',
      title: 'T06',
      value: 125.00,
      date: DateTime.now().subtract(Duration(days: 6)),
    ), 
    Transaction(
      id: 't7',
      title: 'T07',
      value: 75.75,
      date: DateTime.now().subtract(Duration(days: 3)),
    ), 
    Transaction(
      id: 't8',
      title: 'T08',
      value: 45.45,
      date: DateTime.now().subtract(Duration(days: 2)),
    ), 
    Transaction(
      id: 't9',
      title: 'T09',
      value: 150.30,
      date: DateTime.now().subtract(Duration(days: 1)),
    ), //*/ 
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  } //_recentTransactions

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      //id: DateTime.now().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
    //print('newTransaction: ${newTransaction.id}');
  } //_addTransaction

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  } //_removeTransaction

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  } //_openTransactionFormModal

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      );
    final avaliableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: avaliableHeight * 0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: avaliableHeight * 0.7,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
