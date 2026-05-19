import 'dart:io';
import 'Entity/Product.dart';


void main() {
  while (true) {
    print("\n========= PRODUCT MANAGEMENT =========");
    print("1. Hiển thị danh sách product");
    print("2. Thêm product");
    print("3. Sửa product");
    print("4. Xóa product");
    print("5. Tìm kiếm product");
    print("6. Sắp xếp giá tăng");
    print("7. Sắp xếp giá giảm");
    print("0. Thoát");
    stdout.write("Chọn chức năng: ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        Product.showAllProduct();
        break;

    // ===== ADD =====
      case "2":
        stdout.write("Nhập ID: ");
        String id = stdin.readLineSync()!;
        if (Product.isIdExist(id)) {
          print("ID đã tồn tại! Không thể thêm.");
          break;
        }

        stdout.write("Nhập Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Nhập Image: ");
        String image = stdin.readLineSync()!;

        stdout.write("Nhập Price: ");
        double price = double.parse(stdin.readLineSync()!);

        Product.add(
          Product(
            id: id,
            name: name,
            image: image,
            price: price,
          ),
        );
        break;

    // ===== UPDATE =====
      case "3":
        stdout.write("Nhập ID cần sửa: ");
        String id = stdin.readLineSync()!;
        if (!Product.isIdExist(id)) {
          print("ID không tồn tại! Không thể cập nhật.");
          break;
        }

        stdout.write("Name mới (Enter để bỏ qua): ");
        String? name = stdin.readLineSync();

        stdout.write("Image mới (Enter để bỏ qua): ");
        String? image = stdin.readLineSync();

        stdout.write("Price mới (Enter để bỏ qua): ");
        String? priceInput = stdin.readLineSync();

        Product.update(
          id,
          newName: name!.isEmpty ? null : name,
          newImage: image!.isEmpty ? null : image,
          newPrice:
          priceInput!.isEmpty ? null : double.parse(priceInput),
        );
        break;

    // ===== DELETE =====
      case "4":
        stdout.write("Nhập ID cần xóa: ");
        String id = stdin.readLineSync()!;
        if (!Product.isIdExist(id)) {
          print("ID không tồn tại! Không thể xóa.");
          break;
        }
        Product.delete(id);
        break;

    // ===== SEARCH =====
      case "5":
        stdout.write("Nhập tên cần tìm: ");
        String keyword = stdin.readLineSync()!;
        Product.search(keyword);
        break;

    // ===== SORT ASC =====
      case "6":
        Product.sortAsc();
        Product.showAllProduct();
        break;

    // ===== SORT DESC =====
      case "7":
        Product.sortDesc();
        Product.showAllProduct();
        break;

      case "0":
        print("Thoát chương trình...");
        return;

      default:
        print("Lựa chọn không hợp lệ!");
    }
  }
}