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
      backgroundColor: Colors.grey[50], // ปรับพื้นหลังแอปให้เป็นสีเทาอ่อนมากๆ เพื่อให้การ์ดดูป๊อปอัปขึ้นมา
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
          const SizedBox(height: 25),
          const Text('สายด่วน\nการเดินทาง', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown)),
          const SizedBox(height: 20),
          // ✨ ปรับแต่งไอคอนด้านบนให้เป็นวงกลมมีเงา
          Container(
            width: 120, height: 120,
            decoration: BoxDecoration(
              color: Colors.white, 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.brown.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 5)),
              ]
            ),
            child: Icon(Icons.directions_car, size: 60, color: Colors.brown[700]),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(), // เพิ่มเด้งๆ เวลาเลื่อนสุด
              itemCount: hotlines.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white, 
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  elevation: 2, // เงาการ์ดนุ่มๆ
                  shadowColor: Colors.black26,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // โค้งมนสวยงาม
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8), // เพิ่มพื้นที่หายใจให้เนื้อหา
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
                    // ✨ ปรับปุ่มโทรให้เป็นวงกลมสีเขียว
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