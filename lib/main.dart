// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transactions.dart';

final nameController = TextEditingController();
final priceController = TextEditingController();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Transactions> transactions = [
    Transactions(
        'petarde', 32.22, DateFormat('MM/dd/yyyy').format(DateTime.now())),
    Transactions(
        'laminat', 999999.99, DateFormat('MM/dd/yyyy').format(DateTime.now())),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newModal(context);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: transactions.map((tx) {
                return ExpenseItem(tx.title, tx.amount, tx.date);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final String title;
  final double amount;
  final String time;
  const ExpenseItem(this.title, this.amount, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: MediaQuery.of(context).size.width / 1.1,
      height: 80,
      child: Card(
        color: Colors.amberAccent,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$amount\$',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '$time',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'time',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController textController;
  const InputField(this.label, this.textController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: TextField(
        controller: textController,
        obscureText: false,
        cursorColor: Colors.green,
        style: TextStyle(color: Colors.green[400]),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(
            color: Colors.greenAccent[400],
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.green,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

void newModal(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[800],
          child: Column(
            children: [
              Text(
                'NOVI UNOS',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 25,
              ),
              InputField('Naslov', nameController),
              InputField('Cijena', priceController),
            ],
          ),
        );
      });
}
