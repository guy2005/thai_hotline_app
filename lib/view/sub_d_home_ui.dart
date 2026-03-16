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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[600], // ปรับสีเป็นส้มสดขึ้น
        elevation: 0,
        centerTitle: true,
        title: const Text('สายด่วน THAILAND', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
          Text('สายด่วน\nสาธารณูปโภค', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange[800])),
          const SizedBox(height: 20),
          Container(
            width: 120, height: 120,
            decoration: BoxDecoration(
              color: Colors.white, 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.orange.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 5)),
              ]
            ),
            child: Icon(Icons.lightbulb_outline, size: 60, color: Colors.orange[700]),
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