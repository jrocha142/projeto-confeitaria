import 'package:confeitaria/models/product.dart';
import 'package:confeitaria/widgets/product_card.dart';
import 'package:confeitaria/widgets/product_details_modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products;

  final Function(Product) onAddProduct;
  const ProductsPage({super.key, required this.products, required this.onAddProduct});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController ingredientsController = TextEditingController();
  
  XFile? selectedImage;
  
  void addProduct() {
  final ingredients = ingredientsController.text.split(',');

    widget.onAddProduct(
      Product(
        name: nameController.text,
        price: double.parse(priceController.text),
        imagePath: selectedImage!.path,
        ingredients: ingredients,
      ),
    );  

    nameController.clear();
    priceController.clear();
    ingredientsController.clear();

    selectedImage = null;
    Navigator.pop(context);
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: widget.products.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return ProductCard(
              product: product,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ProductDetailsModal(
                        product: product,
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Novo Produto'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nome do produto',
                        ),
                      ),
                      TextField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Preço',
                        ),
                      ),
                      Column(
                        children: [
                          if (selectedImage != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                selectedImage!.path,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                          const SizedBox(height: 12),

                          ElevatedButton.icon(
                            onPressed: pickImage,
                            icon: const Icon(Icons.image),
                            label: const Text('Selecionar Imagem'),
                          ),
                        ],
                      ),
                      TextField(
                        controller: ingredientsController,
                        decoration: const InputDecoration(
                          labelText: 'Ingredientes separados por vírgula',
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: addProduct,
                    child: const Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}