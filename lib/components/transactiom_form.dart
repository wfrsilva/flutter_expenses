import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valuecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valuecontroller,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text('Nova transação'),
                        textColor: Colors.purple,
                        onPressed: () {
                          print(titleController.text);
                          print(valuecontroller.text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}