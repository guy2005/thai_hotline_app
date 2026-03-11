import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thai_hotline_app/view/about_ui.dart';

class SubDHomeUi extends StatefulWidget {
  const SubDHomeUi({super.key});

  @override
  State<SubDHomeUi> createState() => _SubDHomeUiState();
}

class _SubDHomeUiState extends State<SubDHomeUi> {
  final List<Map<String, String>> hotlines = [
    {'name': 'ไฟฟ้านครหลวง', 'phone': '1130', 'image': 'assets/images/d_01.png'},
    {'name': 'ไฟฟ้าส่วนภูมิภาค', 'phone': '1129', 'image': 'assets/images/d_02.png'},
    {'name': 'ไฟฟ้าฝ่ายผลิต', 'phone': '1416', 'image': 'assets/images/d_03.png'},
    {'name': 'การประปานครหลวง', 'phone': '1125', 'image': 'assets/images/d_04.png'},
    {'name': 'การประปาส่วนภูมิภาค', 'phone': '1662', 'image': 'assets/images/d_05.png'},
    {'name': 'True', 'phone': '1242', 'image': 'assets/images/d_06.png'},
    {'name': 'dtac', 'phone': '1678', 'image': 'assets/images/d_07.png'},
    {'name': 'AIS', 'phone': '1175', 'image': 'assets/images/d_08.png'},
    {'name': 'TOT', 'phone': '1100', 'image': 'assets/images/d_09.png'},
  ];

  Future<void> _makePhoneCall(String phoneNumber) async {
    final String cleanPhone = phoneNumber.replaceAll(' ', '');
    final Uri launchUri = Uri(scheme: 'tel', path: cleanPhone);
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
        backgroundColor: Colors.orange[100],
        elevation: 0,
        centerTitle: true,
        title: const Text('สายด่วน THAILAND', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.error_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUi()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('สายด่วน\nสาธารณูปโภค', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Container(
            width: 150, height: 150,
            decoration: BoxDecoration(color: Colors.orange[50], borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.lightbulb_outline, size: 70, color: Colors.orange[800]),
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
                      icon: Icon(Icons.phone_outlined, color: Colors.orange[700]),
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