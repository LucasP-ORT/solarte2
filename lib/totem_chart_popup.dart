
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotemChartPopup extends StatelessWidget {
  const TotemChartPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Estadísticas del Tótem',
        style: TextStyle(color: Colors.black),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildChart('Carga Actual', 75),
              const SizedBox(height: 20),
              _buildChart('Energía Generada', 150),
              const SizedBox(height: 20),
              _buildChart('Energía Consumida', 50),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cerrar',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildChart(String title, double value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: 200,
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: value,
                      color: Colors.lightBlue,
                      width: 40,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                  ],
                ),
              ],
              titlesData: const FlTitlesData(
                show: true,
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
            ),
          ),
        ),
        Text(
          '$value kWh',
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
