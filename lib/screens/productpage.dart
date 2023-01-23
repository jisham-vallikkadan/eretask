import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/sproduct_model.dart';
import '../service/providerclass.dart';

class ProductListpage extends StatefulWidget {
  const ProductListpage({Key? key}) : super(key: key);

  @override
  State<ProductListpage> createState() => _ProductListpageState();
}

class _ProductListpageState extends State<ProductListpage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TestProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Icon(
                Icons.whatsapp,
                color: Colors.green,
              ),
              Text('WhatsAppShop'),
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('mesh-staff-chai-blackplum-velvet'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image(image: AssetImage('images/mobile.jpg')),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MRP :',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              '₹6800',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                              ),
                            ),
                            Text(
                              '₹4300',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.red),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'In Stock',
                          style: TextStyle(color: Colors.green),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text('Qty :'),
                                Text('1'),
                                Icon(Icons.arrow_drop_down_sharp)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: TextButton(
                    child: Text(
                      'ADD to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {}),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                child: TextButton(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quik Review',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Staff-Chair'),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Similar Products'),
                    Text(
                      'View All',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Expanded(
                  child: Container(
                    // color: Colors.red,
                    height: 200,
                    child: FutureBuilder<List<Sproducts>>(
                      future: provider.getsproducts(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var product = snapshot.data![index];
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  width: 130,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 90,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/shoes.jpg'),
                                                fit: BoxFit.cover),
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                      ),
                                      Text('${product.name}'),
                                      Text('${product.desc}'),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [

                                          Text(
                                            '200',
                                            style: TextStyle(
                                                decoration:
                                                TextDecoration.lineThrough,
                                                decorationThickness: 2),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        else{
                          return Center(child:
                            CircularProgressIndicator(),);
                        }

                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
