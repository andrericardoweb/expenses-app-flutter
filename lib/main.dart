import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Tênis Nike',
      value: 499.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 189.85,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Card(
            color: Colors.amber,
            child: Text('Gráfico'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _transactions.map((tr) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      'R\$ ${tr.value.toString().replaceAll('.', ',')}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: Text(tr.value.toString()),
                  title: Text(
                    tr.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    DateFormat('dd MMM y').format(tr.date),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
