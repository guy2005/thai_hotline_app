import 'package:flutter/material.dart';
// นำเข้าหน้า Sub ทั้ง 4 หน้า
import 'package:thai_hotline_app/view/sub_a_home_ui.dart';
import 'package:thai_hotline_app/view/sub_b_home_ui.dart';
import 'package:thai_hotline_app/view/sub_c_home_ui.dart';
import 'package:thai_hotline_app/view/sub_d_home_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  // ตัวแปรเก็บค่าว่าตอนนี้กำลังเลือกแท็บไหนอยู่ (เริ่มที่ 0 คือหน้าแรก)
  int _selectedIndex = 0;

  // List เก็บหน้าจอทั้ง 4 หน้าที่จะเอามาสลับแสดงผลตรงกลาง
  final List<Widget> _screens = [
    const SubAHomeUi(),
    const SubBHomeUi(),
    const SubCHomeUi(),
    const SubDHomeUi(),
  ];

  // ฟังก์ชันเมื่อผู้ใช้กดเปลี่ยนแท็บ
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ตรง body เราจะดึง Widget จาก List มาแสดงตาม index ที่ถูกเลือก
      body: _screens[_selectedIndex],
      
      // ย้าย BottomNavigationBar จากทุกหน้า มารวมไว้ที่นี่ที่เดียว!
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        // ลูกเล่นเพิ่มเติม: เปลี่ยนสีปุ่มที่เลือก ให้ตรงกับธีมสีของแต่ละหน้า
        selectedItemColor: _selectedIndex == 0 
            ? Colors.brown 
            : _selectedIndex == 1 
                ? Colors.red 
                : _selectedIndex == 2 
                    ? Colors.blue 
                    : Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'อุบัติเหตุ-เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}