import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Entity/Product.dart';

void main() {

  print("========== DANH SÁCH PRODUCTS ==========");
  Product.showAllProduct();


  /// Thêm product
  print("\n========== THÊM PRODUCT ==========");

  Product.add(
    Product(
      id: "06",
      name: "San pham F",
      image: "Hinhanh6.png",
      price: 25.5,
    ),
  );

  Product.showAllProduct();


  /// Cập nhật product
  print("\n========== UPDATE PRODUCT ==========");

  Product.update(
    "02",
    newName: "San pham B Updated",
    newPrice: 99.9,
  );

  Product.showAllProduct();


  /// Xóa product
  print("\n========== DELETE PRODUCT ==========");

  Product.delete("03");

  Product.showAllProduct();


  /// Tìm kiếm product
  print("\n========== SEARCH PRODUCT ==========");

  Product.search("san pham");


  /// Sắp xếp giá tăng dần
  print("\n========== SORT ASC ==========");

  Product.sortAsc();
  Product.showAllProduct();


  /// Sắp xếp giá giảm dần
  print("\n========== SORT DESC ==========");

  Product.sortDesc();
  Product.showAllProduct();


  print("\nDone");
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void increase() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter 🚀"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Count: $count",
          style: const TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increase,
        child: const Icon(Icons.add),
      ),
    );
  }
}