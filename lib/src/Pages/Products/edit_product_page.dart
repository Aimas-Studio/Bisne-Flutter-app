import 'package:bisne/src/Pages/User/Widgets/input_text_widget.dart';
import 'package:bisne/src/Utils/Entities/product.dart';
import 'package:bisne/src/Utils/interfaces.dart';
import 'package:bisne/src/Utils/texts.dart';
import 'package:bisne/src/Widgets/secondary_app_bar.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatelessWidget {
  final ProductDump productDump;
  const EditProductPage({required this.productDump, super.key});

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundAppColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              secondaryAppBar(context, true),
              boldAppText("Editar Producto", 27),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                          ),
                        )
                      ],
                    ),
                    thinAppText(productDump.shopDump.shopName, 14),
                    boldAppText(productDump.name, 20),
                    thinAppText(productDump.description, 13),
                    boldAppText("${productDump.price} mn", 18),
                  ],
                ),
              ),
              whiteLabelInputTextWidget(context, "Editar Nombre", Icons.edit),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: whiteLabelInputTextWidget(
                    context, "Editar Descripción", Icons.edit),
              ),
              whiteLabelInputTextWidget(context, "Editar Precio", Icons.edit),
            ],
          ),
        ),
      ),
    );
  }
}
