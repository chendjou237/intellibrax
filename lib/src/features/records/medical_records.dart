import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavigationBar(),
            32.vGap,
                 ScanResultsSection(),
            16.vGap,
                  PrescriptionsSection(),
            16.vGap,
                  ConsultationsSection(),
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


        /*Column(
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
    */

    
class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItem(icon: Icons.qr_code, label: 'Scan Results'),
          NavItem(icon: Icons.local_pharmacy, label: 'Prescriptions'),
          NavItem(icon: Icons.person, label: 'Consultations'),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.router.pushNamed('/medical-record');
      },
      child: Padding(
        padding: EdgeInsets.all( 16),
        
        child: Column(
          children: [
            Icon(icon, size: 24),
            SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class ScanResultsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Scan Results',
      children: [
        ScanResultCard(title: 'Breast Scan', date: 'June 15, 2023'),
        ScanResultCard(title: 'Lymph Scan', date: 'May 20, 2023'),
      ],
    );
  }
}

class PrescriptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Prescriptions',
      children: [
        PrescriptionCard(title: 'Tamoxifen', date: 'June 15, 2023', description: 'Take 20mg daily for 6 months'),
        PrescriptionCard(title: 'Radiation Therapy', date: 'May 20, 2023', description: '3 sessions per week for 4 weeks'),
      ],
    );
  }
}

class ConsultationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Consultations',
      children: [
        ConsultationCard(name: 'Dr. Sarah Johnson', date: 'June 15, 2023'),
        ConsultationCard(name: 'Dr. Michael Lee'),
      ],
    );
  }
}


class Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Use a color similar to bg-card in Tailwind.
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Column(children: children),
        ],
      ),
    );
  }
}


class ScanResultCard extends StatelessWidget {
  final String title;
  final String date;

  ScanResultCard({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pushNamed('/medical-record'),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300], // Use a color similar to bg-muted in Tailwind.
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.settings_suggest, size: 32, color: Colors.grey[700]), //Replace with the relevant SVG icon.
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}


class PrescriptionCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;

  PrescriptionCard({required this.title, required this.date, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Use a color similar to bg-muted in Tailwind.
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            ],
          ),
          SizedBox(height: 8),
          Text(description, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    );
  }
}

class ConsultationCard extends StatelessWidget {
  final String name;
  final String? date;

  ConsultationCard({required this.name, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Use a color similar to bg-muted in Tailwind.
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              if (date != null)
                Text(date!, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            ],
          ),
          if (date != null) ...[
            SizedBox(height: 8),
            Text('Recommended', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          ],
        ],
      ),
    );
  }
}