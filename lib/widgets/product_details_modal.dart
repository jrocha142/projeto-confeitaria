import 'package:confeitaria/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsModal extends StatelessWidget {

  final Product product;

  const ProductDetailsModal({
    super.key,
    required this.product,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            product.name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'R\$ ${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Ingredientes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...product.ingredients.map(
            (ingredient) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  '• $ingredient',
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}