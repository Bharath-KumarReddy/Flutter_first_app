import 'dart:core';

import 'package:flutter/material.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  double rate = 0.0;
  double unit = 0.0;
  double result = 0.0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 40),
          const Icon(Icons.offline_bolt, color: Colors.orange, size: 40),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Electric bill',
              style: TextStyle(fontSize: 30, color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ),
          const Center(
            child: Text(
              "Calculator",
              style: TextStyle(color: Colors.orange, fontSize: 30),
            ),
          ),
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Units",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  unit = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.double_arrow, color: Colors.black),
                hintText: "Enter units of the bill (KW)",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
              ),
            ),
          ),
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              "Rate",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  rate = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.double_arrow, color: Colors.black),
                hintText: "Enter rate per unit (Rs)",
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
              ),
            ),
          ),
          const SizedBox(height: 70),
          GestureDetector( 
            onTap: () {
              setState(() {
                result = unit * rate; 
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.orange, width: 0.6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Total Bill", style: TextStyle(fontSize: 20, color: Colors.black)),
                const SizedBox(height: 10),
                Text("Rs ${result.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
