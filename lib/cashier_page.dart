import 'package:flutter/material.dart';

class CashierPage extends StatefulWidget {
  const CashierPage({super.key});

  @override
  State<CashierPage> createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> products = [
    {
      "image": "assets/images/mie.jpg",
      "name": "Mie Sedap",
      "price": 3000,
      "stock": 10,
      "quantity": 0,
    },
    {
      "image": "assets/images/kecap.jpg",
      "name": "Kecap",
      "price": 2000,
      "stock": 12,
      "quantity": 0,
    },
  ];

  int _totalItem = 0;
  int _totalHarga = 0;

  void _TambahItemBeli(int index) {
    setState(() {
      if (products[index]['stock'] > 0) {
        products[index]['stock']--;

        products[index]['quantity']++;

        _totalItem++;

        _totalHarga += products[index]['price'] as int;
      }
    });
  }

  void _KurangItemBeli(int index) {
    setState(() {
      if (products[index]['quantity'] > 0) {
        products[index]['stock']++;

        products[index]['quantity']--;

        _totalItem--;

        _totalHarga -= products[index]['price'] as int;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),

        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Cashier App", style: TextStyle(fontSize: 28)),

                  Text("Semoga harimu menyenangkan :)"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: searchController,

              decoration: InputDecoration(
                hintText: "Cari produk",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,

                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),

                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.grey[300],

                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,

                          color: Colors.grey,

                          child: Image.asset(
                            products[index]['image'],

                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                products[index]['name'],
                                style: const TextStyle(fontSize: 16),
                              ),

                              Text("Rp ${products[index]['price']}"),

                              Text("Stock : ${products[index]['stock']}"),
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                _TambahItemBeli(index);
                              },

                              icon: const Icon(Icons.add),
                              color: Colors.green[400],
                            ),

                            Text("${products[index]['quantity']}"),

                            IconButton(
                              onPressed: () {
                                _KurangItemBeli(index);
                              },
                              icon: const Icon(Icons.remove),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: Colors.grey,

                borderRadius: BorderRadius.circular(8),
              ),

              child: Column(
                children: [
                  Text(
                    "Total kuantity : $_totalItem",
                    style: const TextStyle(color: Colors.white),
                  ),

                  Text(
                    "Total Harga : Rp $_totalHarga",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
