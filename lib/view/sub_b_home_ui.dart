import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thai_hotline_app/view/about_ui.dart';

class SubBHomeUi extends StatefulWidget {
  const SubBHomeUi({super.key});

  @override
  State<SubBHomeUi> createState() => _SubBHomeUiState();
}

class _SubBHomeUiState extends State<SubBHomeUi> {
  final List<Map<String, String>> hotlines = [
    {'name': 'เหตุด่วนเหตุร้าย', 'phone': '191', 'image': 'assets/images/b_01.png'},
    {'name': 'แจ้งไฟไหม้ สัตว์เข้าบ้าน', 'phone': '199', 'image': 'assets/images/b_02.png'},
    {'name': 'สายด่วนรถหาย', 'phone': '1192', 'image': 'assets/images/b_03.png'},
    {'name': 'อุบัติเหตุทางน้ำ', 'phone': '1196', 'image': 'assets/images/b_04.png'},
    {'name': 'แจ้งคนหาย', 'phone': '1300', 'image': 'assets/images/b_05.png'},
    {'name': 'ศูนย์ปลอดภัยคมนาคม', 'phone': '1356', 'image': 'assets/images/b_06.png'},
    {'name': 'หน่วยแพทย์กู้ชีพ', 'phone': '1554', 'image': 'assets/images/b_07.png'},
    {'name': 'ศูนย์เอราวัณ', 'phone': '1646', 'image': 'assets/images/b_08.png'},
    {'name': 'เจ็บป่วยฉุกเฉิน', 'phone': '1669', 'image': 'assets/images/b_09.png'},
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่สามารถโทรออกเบอร์ $phoneNumber ได้')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.error_outline, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUi()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          const Text('สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
          const SizedBox(height: 20),
          Container(
            width: 120, height: 120,
            decoration: BoxDecoration(
              color: Colors.white, 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.red.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 5)),
              ]
            ),
            child: Icon(Icons.medical_services, size: 60, color: Colors.red[700]),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: hotlines.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white, 
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  elevation: 2,
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    leading: Container(
                      width: 55, height: 55,
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAlias,
                      child: (hotlines[index]['image'] != null && hotlines[index]['image']!.isNotEmpty)
                          ? Image.asset(hotlines[index]['image']!, fit: BoxFit.fill) 
                          : const Icon(Icons.image, color: Colors.grey),
                    ),
                    title: Text(hotlines[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Text(hotlines[index]['phone']!, style: TextStyle(fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                    trailing: Container(
                      decoration: BoxDecoration(color: Colors.green[50], shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(Icons.phone, color: Colors.green),
                        onPressed: () => _makePhoneCall(hotlines[index]['phone']!),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}