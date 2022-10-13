import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample4 extends StatefulWidget {
  const BarChartSample4({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample4State();
}

class BarChartSample4State extends State<BarChartSample4> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xffffffff), fontSize: 20);
    // const style = TextStyle(color: Color(0xff939393), fontSize: 0);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Apr';
        break;
      case 1:
        text = 'May';
        break;
      case 2:
        text = 'Jun';
        break;
      case 3:
        text = 'Jul';
        break;
      case 4:
        text = 'Aug';
        break;
      case 5:
        text = '%^&*(';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Color(
        0xffffffff,
        // 0xff939393,
      ),
      fontSize: 20,
      // fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        // color: Colors.white,
        // color: Colors.black,
        // color: Color(0xff7589a2),
        color: const Color(0xff2c4260),

        // surfaceTintColor: Colors.yellow,
        // shadowColor: Colors.white,
        borderOnForeground: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              barTouchData: BarTouchData(
                // enabled: false,
                allowTouchBarBackDraw: true,
                // handleBuiltInTouches: false,
                touchTooltipData: BarTouchTooltipData(
                  rotateAngle: 10,
                  direction: TooltipDirection.auto,
                  tooltipBgColor: Color.fromARGB(0, 0, 0, 0),
                  // tooltipBorder: BorderSide(width: 1),
                  // maxContentWidth: 50,
                  tooltipMargin: 3,
                ),
              ),
              titlesData: FlTitlesData(
                // show: false,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: 100,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 100,
                    getTitlesWidget: leftTitles,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: Colors.red,
                  // color: const Color(0xffe7e8ec),
                  strokeWidth: 1,
                ),
                drawVerticalLine: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 30,
              barGroups: getData(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        showingTooltipIndicators: [0, 1, 2, 4],
        x: 5,
        barsSpace: 100,
        barRods: [
          BarChartRodData(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Colors.red,
                Colors.white,
              ],
              // tileMode: TileMode.mirror,
            ),
            toY: 30000000000,
            // color: Colors.amber,
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 30000000000,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Colors.lightBlueAccent,
                Colors.greenAccent,
              ],
            ),
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 30000000000,
            color: Colors.amber,
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 30000000000,
            color: Colors.amber,
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 30000000000,
            color: Colors.amber,
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000, dark),
              BarChartRodStackItem(2000000000, 12000000000, normal),
              BarChartRodStackItem(12000000000, 17000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 13000000000, dark),
              BarChartRodStackItem(13000000000, 14000000000, normal),
              BarChartRodStackItem(14000000000, 24000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 23000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, dark),
              BarChartRodStackItem(6000000000.5, 18000000000, normal),
              BarChartRodStackItem(18000000000, 23000000000.5, Colors.purple),
            ],
            borderRadius: BorderRadius.zero,
            color: Colors.yellow,
            // fromY: 34000000000,
            // gradient:  Gradient(colors: <Color>[Colors.black,Colors.blue]),
            width: 50,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, Colors.lightBlueAccent),
              BarChartRodStackItem(9000000000, 29000000000, Colors.greenAccent),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000.5, dark),
              BarChartRodStackItem(2000000000.5, 17000000000.5, normal),
              BarChartRodStackItem(17000000000.5, 32000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 11000000000, dark),
              BarChartRodStackItem(11000000000, 18000000000, normal),
              BarChartRodStackItem(18000000000, 31000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 35000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000, dark),
              BarChartRodStackItem(14000000000, 27000000000, normal),
              BarChartRodStackItem(27000000000, 35000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 31000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 8000000000, dark),
              BarChartRodStackItem(8000000000, 24000000000, normal),
              BarChartRodStackItem(24000000000, 31000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, dark),
              BarChartRodStackItem(6000000000.5, 12000000000.5, normal),
              BarChartRodStackItem(12000000000.5, 15000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, dark),
              BarChartRodStackItem(9000000000, 15000000000, normal),
              BarChartRodStackItem(15000000000, 17000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 34000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, dark),
              BarChartRodStackItem(6000000000, 23000000000, normal),
              BarChartRodStackItem(23000000000, 34000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, Colors.teal),
              BarChartRodStackItem(7000000000, 24000000000, normal),
              BarChartRodStackItem(24000000000, 32000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 14000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 14000000000.5, Colors.orange),
              // BarChartRodStackItem(0, 1000000000.5, Colors.orange),
              // BarChartRodStackItem(1000000000.5, 12000000000, normal),
              // BarChartRodStackItem(12000000000, 14000000000.5, light),
            ],
            borderRadius: const BorderRadius.all(Radius.elliptical(10, 2)),
            // borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 20000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, dark),
              BarChartRodStackItem(4000000000, 15000000000, normal),
              BarChartRodStackItem(15000000000, 20000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 4000000000, dark),
              BarChartRodStackItem(4000000000, 15000000000, normal),
              BarChartRodStackItem(15000000000, 24000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: 14000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, dark),
              BarChartRodStackItem(1000000000.5, 12000000000, normal),
              BarChartRodStackItem(12000000000, 14000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 27000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, dark),
              BarChartRodStackItem(7000000000, 25000000000, normal),
              BarChartRodStackItem(25000000000, 27000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, dark),
              BarChartRodStackItem(6000000000, 23000000000, normal),
              BarChartRodStackItem(23000000000, 29000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 16000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, dark),
              BarChartRodStackItem(9000000000, 15000000000, normal),
              BarChartRodStackItem(15000000000, 16000000000.5, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 15000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 7000000000, dark),
              BarChartRodStackItem(7000000000, 12000000000.5, normal),
              BarChartRodStackItem(12000000000.5, 15000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
      //
      BarChartGroupData(
        x: 3,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 17000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000, dark),
              BarChartRodStackItem(2000000000, 12000000000, normal),
              BarChartRodStackItem(12000000000, 17000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 24000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 13000000000, dark),
              BarChartRodStackItem(13000000000, 14000000000, normal),
              BarChartRodStackItem(14000000000, 24000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 23000000000.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000.5, dark),
              BarChartRodStackItem(6000000000.5, 18000000000, normal),
              BarChartRodStackItem(18000000000, 23000000000.5, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 29000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 9000000000, dark),
              BarChartRodStackItem(9000000000, 15000000000, normal),
              BarChartRodStackItem(15000000000, 29000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
          BarChartRodData(
            toY: 32000000000,
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000.5, dark),
              BarChartRodStackItem(2000000000.5, 17000000000.5, normal),
              BarChartRodStackItem(17000000000.5, 32000000000, light),
            ],
            borderRadius: BorderRadius.zero,
          ),
        ],
      ),
    ];
  }
}
