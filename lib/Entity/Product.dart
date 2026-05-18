class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product({required this.id, this.name = "", this.image = "", this.price = 0});

  Product CopyTo({String? id, String? name, String? image, double? price}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  // Danh sách các product
  static List<Product> products = [
    Product(id: "01", name: "San pham A", image: "Hinhanh1.png", price: 10.2),
    Product(id: "02", name: "San pham B", image: "Hinhanh2.png", price: 20.1),
    Product(id: "03", name: "San pham C", image: "Hinhanh3.png", price: 15.8),
    Product(id: "04", name: "San pham D", image: "Hinhanh4.png", price: 11.4),
    Product(id: "05", name: "San pham E", image: "Hinhanh5.png", price: 19.5),
  ];

  // Hiển thị product
  static void showAllProduct() {
    for (var p in products) {
      print(
        "ID: ${p.id} | Name: ${p.name}, Image: ${p.image}, Price: ${p.price}",
      );
    }
  }

  //Thêm product
  static void add(Product p) {
    bool existed = products.any((e) => e.id == p.id);

    if (existed) {
      print("ID này đã tồn tại. Vui lòng nhập ID mới: ");
      return;
    }

    products.add(p);
    print("Thêm product thành công!");
  }

  // Sửa product
  static void update(
      String id,
      {String? newName,
        String? newImage,
        double? newPrice}
      ) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == id) {

        products[i] = Product(
          id: products[i].id,
          name: newName ?? products[i].name,
          image: newImage ?? products[i].image,
          price: newPrice ?? products[i].price,
        );

        print("Update thành công!");
        return;
      }
    }

    print("Không tìm thấy product!");
  }

  // Xóa product
  static void delete(String id) {
    products.removeWhere((p) => p.id == id);
    print("Xóa thành công product có ID là ${id}!");
  }

  // Tìm kiếm product theo name
  static void search(String keyword) {
    var result = products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    if (result.isEmpty) {
      print("Không tìm thấy product cần sửa!");
      return;
    }

    result.forEach(print);
  }

  // Sắp xếp product theo giá tăng
  static void sortAsc() {
    print("Bảng giá các product tăng dần: \n");
    products.sort((a, b) => a.price.compareTo(b.price));
  }

  // Sắp xếp product theo giá giảm
  static void sortDesc() {
    print("Bảng giá các product giảm dần: \n");
    products.sort((a, b) => b.price.compareTo(a.price));
  }
}
