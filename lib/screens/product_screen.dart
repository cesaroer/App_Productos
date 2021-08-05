import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class productScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: 40, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 30,
                  child: IconButton(
                    icon: Icon(Icons.camera_alt_outlined,
                        size: 40, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            _ProductForm(),
            SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_alt_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    hintText: "Nombre del producto", labelText: "Nombre: "),
              ),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    hintText: "\$150", labelText: "Precio: "),
              ),
              SizedBox(height: 30),
              SwitchListTile.adaptive(
                title: Text("Disponible"),
                activeColor: Colors.indigo,
                value: true,
                onChanged: (value) {},
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5,
          )
        ],
      );
}
