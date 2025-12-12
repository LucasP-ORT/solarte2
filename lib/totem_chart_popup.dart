
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotemChartPopup extends StatelessWidget {
  const TotemChartPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Totem Statistics'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildChart('Current Charge', 75),
            const SizedBox(height: 20),
            _buildChart('Energy Generated', 150),
            const SizedBox(height: 20),
            _buildChart('Energy Consumed', 50),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildChart(String title, double value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 200, // A fixed max value for comparison
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: value,
                      color: Colors.lightBlue,
                      width: 30,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
              ],
              titlesData: const FlTitlesData(
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
            ),
          ),
        ),
        Text('$value kWh'),
      ],
    );
  }
}
