import 'package:confeitaria/widgets/performance_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformancePage extends StatelessWidget {

  const PerformancePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Performance'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Receita Semanal',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Desempenho financeiro da semana',
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    height: 250,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(
                          show: true,
                        ),

                        borderData: FlBorderData(
                          show: false,
                        ),

                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),

                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 0:
                                    return const Text('Seg');
                                  case 1:
                                    return const Text('Ter');
                                  case 2:
                                    return const Text('Qua');
                                  case 3:
                                    return const Text('Qui');
                                  case 4:
                                    return const Text('Sex');
                                }
                                return const Text('');
                              },
                            ),
                          ),
                        ),

                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            spots: const [
                              FlSpot(0, 120),
                              FlSpot(1, 250),
                              FlSpot(2, 180),
                              FlSpot(3, 320),
                              FlSpot(4, 450),
                            ],
                            barWidth: 4,
                            dotData: const FlDotData(
                              show: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.15,
              children: const [
                PerformanceCard(
                  title: 'Mais Vendido',
                  value: 'Bolo de Chocolate',
                  icon: Icons.trending_up,
                ),
                PerformanceCard(
                  title: 'Menos Vendido',
                  value: 'Cupcake',
                  icon: Icons.trending_down,
                ),
                PerformanceCard(
                  title: 'Total Pedidos',
                  value: '12',
                  icon: Icons.receipt_long,
                ),
                PerformanceCard(
                  title: 'Receita Total',
                  value: 'R\$ 1.250',
                  icon: Icons.attach_money,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}