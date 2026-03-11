import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thai_hotline_app/view/about_ui.dart';

class SubCHomeUi extends StatefulWidget {
  const SubCHomeUi({super.key});

  @override
  State<SubCHomeUi> createState() => _SubCHomeUiState();
}

class _SubCHomeUiState extends State<SubCHomeUi> {
  final List<Map<String, String>> hotlines = [
    {'name': 'ธนาคารกรุงเทพ', 'phone': '1333', 'image': 'assets/images/c_01.png'},
    {'name': 'ออมสิน', 'phone': '1115', 'image': 'assets/images/c_02.png'},
    {'name': 'ธนาคารกสิกรไทย', 'phone': '02 888 8888', 'image': 'assets/images/c_03.png'},
    {'name': 'ธนาคารกรุงไทย', 'phone': '02 111 1111', 'image': 'assets/images/c_04.png'},
    {'name': 'ธนาคารกรุงศรีอยุธยา', 'phone': '1572', 'image': 'assets/images/c_05.png'},
    {'name': 'ทีเอ็มบีธนชาต (ttb)', 'phone': '1428', 'image': 'assets/images/c_06.png'},
    {'name': 'ซิตี้แบงก์ (Citibank)', 'phone': '1588', 'image': 'assets/images/c_07.png'},
    {'name': 'LH BANK', 'phone': '1327', 'image': 'assets/images/c_08.png'},
    {'name': 'ธอส. (GH BANK)', 'phone': '02 645 9000', 'image': 'assets/images/c_09.png'},
    {'name': 'ธนาคารไทยพาณิชย์ (SCB)', 'phone': '02 777 7777', 'image': 'assets/images/c_10.png'},
    {'name': 'เกียรตินาคินภัทร', 'phone': '02 165 5555', 'image': 'assets/images/c_11.png'},
    {'name': 'ธนาคารไทยเครดิต', 'phone': '02 697 5454', 'image': 'assets/images/c_12.png'},
    {'name': 'UOB', 'phone': '02 285 1555', 'image': 'assets/images/c_13.png'},
    {'name': 'TISCO', 'phone': '02 633 6000', 'image': 'assets/images/c_14.png'},
    {'name': 'ธนาคารอิสลาม', 'phone': '02 204 2766', 'image': 'assets/images/c_15.png'},
    {'name': 'CIMB THAI', 'phone': '02 626 7777', 'image': 'assets/images/c_16.png'},
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
        backgroundColor: Colors.blue[100],
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
          const Text('สายด่วน\nธนาคาร', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Container(
            width: 150, height: 150,
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
            child: Icon(Icons.account_balance, size: 70, color: Colors.blue[800]),
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
                      icon: Icon(Icons.phone_outlined, color: Colors.blue[700]),
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