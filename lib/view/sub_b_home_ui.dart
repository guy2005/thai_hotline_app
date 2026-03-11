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
      backgroundColor: Colors.white,
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
          const SizedBox(height: 20),
          const Text('สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Container(
            width: 150, height: 150,
            decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.medical_services, size: 80, color: Colors.red[800]),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: hotlines.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300, width: 1)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    leading: Container(
                      width: 50, height: 50,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade400)),
                      clipBehavior: Clip.antiAlias,
                      child: (hotlines[index]['image'] != null && hotlines[index]['image']!.isNotEmpty)
                          ? Image.asset(hotlines[index]['image']!, fit: BoxFit.cover)
                          : const Icon(Icons.image, color: Colors.grey),
                    ),
                    title: Text(hotlines[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(hotlines[index]['phone']!, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone_outlined, color: Colors.purple),
                      onPressed: () => _makePhoneCall(hotlines[index]['phone']!),
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