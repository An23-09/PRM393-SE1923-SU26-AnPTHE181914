import 'dart:io';

import 'Entity/Product.dart';

void main() {
  while (true) {
    print("""
======== PRODUCT MANAGER ========
1. Hien thi danh sach
2. Them san pham
3. Xoa san pham
4. Sua san pham
5. Tim kiem
6. Sap xep tang
7. Sap xep giam
0. Thoat
=================================
""");

    stdout.write("Chon: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        Product.showAllProduct();
        break;

      case "2":
        addProductUI();
        break;

      case "3":
        deleteProductUI();
        break;

      case "4":
        updateProductUI();
        break;

      case "5":
        searchProductUI();
        break;

      case "6":
        Product.sortAsc();
        break;

      case "7":
        Product.sortDesc();
        break;

      case "0":
        print("Tam biet!");
        return;

      default:
        print("Lua chon khong hop le!");
    }
  }
}



void addProductUI() {
  stdout.write("ID: ");
  String id = stdin.readLineSync()!;

  stdout.write("Name: ");
  String name = stdin.readLineSync()!;

  stdout.write("Image: ");
  String image = stdin.readLineSync()!;

  stdout.write("Price: ");
  double price = double.parse(stdin.readLineSync()!);

  Product.add(
      Product(id: id, name: name, image: image, price: price));
}

void updateProductUI() {
  stdout.write("Nhap ID can sua: ");
  String id = stdin.readLineSync()!;

  stdout.write("Name moi: ");
  String name = stdin.readLineSync()!;

  stdout.write("Image moi: ");
  String image = stdin.readLineSync()!;

  stdout.write("Price moi: ");
  double price = double.parse(stdin.readLineSync()!);

  Product.update(
      id,
      Product(id: id, name: name, image: image, price: price));
}

void deleteProductUI() {
  stdout.write("Nhap ID can xoa: ");
  String id = stdin.readLineSync()!;
  Product.delete(id);
}

void searchProductUI() {
  stdout.write("Nhap tu khoa: ");
  String keyword = stdin.readLineSync()!;
  Product.search(keyword);
}