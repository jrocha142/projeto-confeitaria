import 'package:confeitaria/models/expense.dart';
import 'package:flutter/material.dart';

class FinancesPage extends StatefulWidget {
  final double totalIncome;

  const FinancesPage({super.key, required this.totalIncome});

  @override
  State<FinancesPage> createState() => _FinancesPageState();
}

class _FinancesPageState extends State<FinancesPage> {

  final TextEditingController nameController = TextEditingController();

  final TextEditingController costController = TextEditingController();
  
  List<Expense> expenses = [

    Expense(
      name: '15kg de farinha',
      cost: 300,
    ),

    Expense(
      name: 'Chocolate',
      cost: 120,
    ),

  ];

  double get totalExpenses {

    double total = 0;

    for (Expense expense in expenses) {
      total += expense.cost;
    }

    return total;
  }

  double get totalBalance {

    return widget.totalIncome - totalExpenses;
  }

  void addExpense() {

    setState(() {

      expenses.add(

        Expense(

          name: nameController.text,

          cost: double.parse(costController.text),
        ),
      );
    });

    nameController.clear();
    costController.clear();

    Navigator.pop(context);
  }

  void removeExpense(int index) {

    setState(() {
      expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Finanças'),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Balanço Total',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'R\$ ${totalBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Entradas: R\$ ${widget.totalIncome.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Saídas: R\$ ${totalExpenses.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return Dismissible(
                  key: Key(expense.name + index.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    removeExpense(index);
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
                    child: ListTile(
                      title: Text(expense.name),

                      subtitle: Text(
                        'R\$ ${expense.cost.toStringAsFixed(2)}',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Nova Despesa'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome da despesa',
                      ),
                    ),
                    TextField(
                      controller: costController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Custo',
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

                    onPressed: addExpense,

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