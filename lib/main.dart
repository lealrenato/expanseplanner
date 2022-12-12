import 'package:expanse_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Book',
      amount: 15.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Travel',
      amount: 69.99,
      date: DateTime.now(),
    ),
  ];

  String? titleInput;
  String? amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue.shade100,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        onChanged: (valor) => titleInput = valor,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        onChanged: (valor) => amountInput = valor,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.purple,
                            elevation: 0,
                            side: BorderSide(
                                width: 1.0, color: Colors.purple.shade50)),
                        onPressed: () {},
                        child: Text(
                          'Add Transaction',
                        ),
                      )
                    ]),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$${tx.amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            formatDate(tx.date!, [d, '-', M, '-', yy],
                                locale: PortugueseDateLocale()),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
