import 'package:confeitaria/models/order.dart';
import 'package:confeitaria/models/product.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  final List<Order> orders;
  final Function(int) onCompleteOrder;
  final List<Product> products;
  
  const OrdersPage({super.key, required this.orders, required this.onCompleteOrder, required this.products});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  Product? selectedProduct;

  final TextEditingController dateController = TextEditingController();

  final TextEditingController quantityController = TextEditingController();

  void addOrder() {
    if (selectedProduct == null) return;

    final int quantity = int.parse(quantityController.text);

    final double totalPrice = selectedProduct!.price * quantity;

    setState(() {
      widget.orders.add(
        Order(
          name: selectedProduct!.name,
          price: totalPrice,
          deliveryDate: dateController.text,
          quantity: quantity,
        ),
      );
    });

    quantityController.clear();
    dateController.clear();

    selectedProduct = null;

    Navigator.pop(context);
  }

  void removeOrder(int index) {

    setState(() {
      widget.orders.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Pedidos'),
      ),

      body: ListView.builder(
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {

          final order = widget.orders[index];

          return Dismissible(
            key: Key(order.name + index.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              widget.onCompleteOrder(index);
            },

            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'R\$ ${order.price.toStringAsFixed(2)}',
                    ),

                    Text(
                      'Entrega: ${order.deliveryDate}',
                    ),

                    Text(
                      'Quantidade: ${order.quantity}',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Novo Pedido'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<Product>(
                      value: selectedProduct,
                      decoration: const InputDecoration(
                        labelText: 'Produto',
                      ),
                      items: widget.products.map(
                        (product) {
                          return DropdownMenuItem(
                            value: product,
                            child: Text(product.name),
                          );
                        },
                      ).toList(),
                      onChanged: (product) {
                        setState(() {
                          selectedProduct = product;
                        });
                      },
                    ),

                    TextField(
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                      ),
                    ),

                    TextField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        labelText: 'Data de entrega',
                      ),
                    ),
                  ],
                ),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(

                    onPressed: addOrder,

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