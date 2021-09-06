import 'package:flutter/material.dart';
import 'package:productos_app/Animation/FadeAnimation.dart';
import 'package:productos_app/models/models.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/product_service.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  bool _firtsLoad = true;

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: _animateProductItem(_firtsLoad, productsService, index),
          onTap: () {
            productsService.selectedProduct =
                productsService.products[index].copy();
            Navigator.pushNamed(context, "product");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct = Product(
            available: false,
            name: "",
            price: 0.0,
          );
          Navigator.pushNamed(context, "product");
        },
      ),
    );
  }

  FadeAnimation _animateProductItem(
    bool _firtsLoad,
    ProductsService productsService,
    int index,
  ) {
    final animate = _firtsLoad;
    this._firtsLoad = false;

    return FadeAnimation(
      animate ? 0.8 : 0.1,
      ProductCard(product: productsService.products[index]),
    );
  }
}
