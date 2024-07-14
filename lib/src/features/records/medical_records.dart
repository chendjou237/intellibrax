import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:intellibra/src/extensions/num.dart';

//TODO: #38 Implement Records feature
@RoutePage()    
class IntelliRecords extends StatelessWidget {
  const IntelliRecords({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    final text = Theme.of(context).textTheme;
    return  Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Breast Cancer Detection Records', style: text.headlineLarge!.copyWith(fontWeight: FontWeight.w900) ,),
            4.vGap,
            Text('View the scan details for each patient.', style: text.headlineSmall!.copyWith(color: Palette.secondaryTextColor),),
            8.vGap,
          ...[1,2,2,2,4,4,6,8].map((e) {
            final t = e % 2 == 0;
            return GestureDetector(
              onTap: (){
                context.router.pushNamed('/medical-record');
              },
              child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Palette.lightColor,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
              
                ),
                child: ListTile(
                  leading: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(Icons.error, size: 40, color: Colors.red,),
                  ),
                title: Text('CE12XFMZ', style: text.titleLarge!.copyWith(fontWeight: FontWeight.w600),),
                subtitle: Text('Device Name', style: text.titleMedium!.copyWith(color: Palette.secondaryTextColor),),
                trailing: Text('${ 10 - e}-07-2024',  style: text.titleLarge!.copyWith(fontWeight: FontWeight.w700, color: t ? Colors.green: Colors.red)),
              ),),
            );
          },),
          ],
        ),
      ),
    );
  }
}

/*
   Table(
          border: TableBorder.symmetric(inside: const BorderSide(strokeAlign: 0.2, width: 0.2)), // Add borders to cells
          children:  [
             TableRow(
              children: [
                TableCell(child: Center(child: Text('Date', style: text.headlineSmall!.copyWith(fontWeight: FontWeight.w700),))),
                 TableCell(child: Center(child: Text('Time',style: text.headlineSmall!.copyWith(fontWeight: FontWeight.w700)))),
                 TableCell(child: Center(child: Text('device name',style: text.headlineSmall!.copyWith(fontWeight: FontWeight.w700)))),
                 TableCell(child: Center(child: Text('Result',style: text.headlineSmall!.copyWith(fontWeight: FontWeight.w700)))),
                 TableCell(child: Center(child: Text('',style: text.headlineSmall!.copyWith(fontWeight: FontWeight.w700)))),
              ],
            ),
            
           ...[1,2,3,4,5,6,7,8,9].map((e) =>   TableRow(
              children: [
                const TableCell(child: Center(child: Text('10-07-2024'))),
                const TableCell(child: Center(child: Text('16-03'))),
                const TableCell(child: Center(child: Text('CE12XFMZ'))),
                TableCell(child: Center(child: Container(decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(16)), padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1), child: const Text('Negative'),),),),
                const TableCell(child: Center(child: TextButton(onPressed: null, child: Text('View')))),
              ],
            ) ,
           ),
          ],
        ),
         */