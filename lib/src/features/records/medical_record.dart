// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

@RoutePage()    
class MedicalRecord extends StatelessWidget {
const MedicalRecord({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Health Checker', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w700)),
            Row(
                            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const BreastInfoBox(image: 'assets/images/left_breast.jpeg',title: 'Left Breast', side: BoobSide.left),
                32.hGap,
                const BreastInfoBox(image: 'assets/images/right_breast.jpeg',title: 'Right Breast', side: BoobSide.right),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 200,
              decoration: BoxDecoration(
                color: Palette.lightColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: const CategoryAxis(),
                  
                    series: <LineSeries<BloodPressureData, int>>[
                      LineSeries<BloodPressureData, int>(
                        // Bind data source
                        dataSource:  <BloodPressureData>[
                          BloodPressureData(35, 10 ),
                          BloodPressureData(28, 20 ),
                          BloodPressureData(34, 30 ),
                          BloodPressureData(32, 40 ),
                          BloodPressureData(40, 50 ),
                        ],
                        xValueMapper: (BloodPressureData data, _) => data.diastolic,
                        yValueMapper: (BloodPressureData data, _) => data.systolic,
                      ),
                    ],
                  ),
                4.hGap,
                Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Row(
                      children: [
                        const Icon(Icons.water_drop_outlined, color: Colors.red, size: 50),
                        Text('Blood Pres' , style: Theme.of(context).textTheme.headlineMedium),
                      ],
                    ),
                    Text('120/80mmHg', style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
                ],
              ),

            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 MetricsBox(title: 'Heart Rate',icon: Icons.monitor_heart_outlined,value: '110bpm',),
                 MetricsBox(title: 'Body Temp',icon: Icons.thermostat,value: '33c'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MetricsBox extends StatelessWidget {
  const MetricsBox({
    Key? key,
    required this.title,
    required this.icon,
    required this.value,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 300,
     width: 300,
     padding: const EdgeInsets.all(8),
     decoration: BoxDecoration(
       color: Palette.lightColor,
       borderRadius: BorderRadius.circular(8),
       
     ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: <Widget>[
      Icon(icon, color: Palette.secondaryTextColor, size: 50),
     Text(title, style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                  SfSparkLineChart(
     data: const <double>[
       1, 5, -6, 0, 1, -2, 7, -7, -4, -10, 13, -6, 7, 5, 11, 5, 3,
     ],
                    ),
                    Text(value, style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            );
  }
}
enum BoobSide{
  left, right
}

class BloodPressureData {
  BloodPressureData(this.systolic, this.diastolic);
  final int systolic;
  final int diastolic;
}


class BreastInfoBox extends StatelessWidget {
  
  const BreastInfoBox({
    required this.image, required this.title, required this.side, super.key,
  });
  final String image;
  final String title;
  final BoobSide side;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
           Image(image: AssetImage(image), width: 200, height: 200),
          4.vGap, 
           Text(title, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700)),
          4.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:  Palette.primary,
                ),
                child: const Text('N', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              32.hGap,
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Palette.secondaryTextColor,
                ),
                child: const Text('B', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}