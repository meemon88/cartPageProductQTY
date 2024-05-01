import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List qty=List.filled(_productList.length, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bag',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _productList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffe8e4e4),
                  border: Border.all(color: const Color(0xffe6dede)),
                  borderRadius: BorderRadius.circular(10.0)),
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      child: Image.network(
                        _productList[index]['img'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _productList[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    const Text('Color:',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 5),
                                    Text(_productList[index]['color'],
                                        style: const TextStyle(fontSize: 15)),
                                    const SizedBox(width: 10),
                                    const Text('Size:',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 5),
                                    Text(_productList[index]['size'],
                                        style: const TextStyle(fontSize: 15)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    qty[index] != 0 ?
                                    InkWell(
                                            onTap: () {
                                              setState(() {
                                                qty[index]--;
                                              });
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: const Icon(Icons.remove),
                                            )):
                                    Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Icon(Icons.remove),
                                          ),
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text(
                                        qty[index].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          qty[index]++;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert),
                              ),
                              Text(
                                '${int.parse(_productList[index]['price']) * qty[index]} \$'
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Map<String, dynamic>> _productList = [
  {
    'title': 'Pullover',
    'color': 'Black',
    'size': 'L',
    'price': '5',
    'img':
        'https://contents.mediadecathlon.com/p2437444/067f3912cb656b48ec7cf255da79de60/p2437444.jpg?format=auto&quality=70&f=650x0'
  },
  {
    'title': 'Pant',
    'color': 'Gray',
    'size': 'XXL',
    'price': '8',
    'img': 'https://infinitymegamall.com/wp-content/uploads/2023/04/39.jpg'
  },
  {
    'title': 'T-Shirt',
    'color': 'Red',
    'size': 'M',
    'price': '6',
    'img':
        'https://prd.cc.duluthtrading.com/on/demandware.static/-/Sites-dtc-master-catalog/default/dw13c50eee/images/large/76020_EBR.jpg'
  },
  {
    'title': 'Shirt',
    'color': 'Blue',
    'size': 'S',
    'price': '9',
    'img':
        'https://www.stoneycreekhunting.co.nz/image/cache/catalog/product_images/corporate/mens/shirts/Mens_Corporate_Shirt_Long_Sleeve_Float_Navy-875x1000.jpg'
  },
];
