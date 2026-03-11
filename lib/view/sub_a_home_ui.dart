import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thai_hotline_app/view/about_ui.dart';

class SubAHomeUi extends StatefulWidget {
  const SubAHomeUi({super.key});

  @override
  State<SubAHomeUi> createState() => _SubAHomeUiState();
}

class _SubAHomeUiState extends State<SubAHomeUi> {
  final List<Map<String, String>> hotlines = [
    {'name': 'กรมทางหลวงชนบท', 'phone': '1146', 'image': 'assets/images/a_01.jpeg'},
    {'name': 'ตำรวจท่องเที่ยว', 'phone': '1155', 'image': 'assets/images/a_02.webp'},
    {'name': 'ตำรวจทางหลวง', 'phone': '1193', 'image': 'assets/images/a_03.png'},
    {'name': 'ข้อมูลจราจร', 'phone': '1197', 'image': 'assets/images/a_04.jpg'},
    {'name': 'ขสมก.', 'phone': '1348', 'image': 'assets/images/a_05.png'},
    {'name': 'บขส.', 'phone': '1490', 'image': 'assets/images/a_06.jpg'},
    {'name': 'เส้นทางบนทางด่วน', 'phone': '1543', 'image': 'assets/images/a_07.png'},
    {'name': 'กรมทางหลวง', 'phone': '1586', 'image': 'assets/images/a_08.webp'},
    {'name': 'การรถไฟแห่งประเทศไทย', 'phone': '1690', 'image': 'assets/images/a_09.jpg'},
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
        backgroundColor: Colors.brown,
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
          const Text('สายด่วน\nการเดินทาง', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Container(
            width: 150, height: 150,
            decoration: BoxDecoration(color: Colors.brown[50], borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.directions_car, size: 80, color: Colors.brown[800]),
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
      // เอา BottomNavigationBar ออกแล้ว!
    );
  }
}