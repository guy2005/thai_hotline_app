import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        // ปุ่ม < ย้อนกลับ
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // คำสั่ง Navigator.pop จะพาย้อนกลับไปหน้าที่พึ่งกดมา
            Navigator.pop(context);
          },
        ),
      ),
      // ใช้ SingleChildScrollView เพื่อกันปัญหาหน้าจอเล็กแล้วเนื้อหาล้นจอ (Overflow)
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'ผู้จัดทำ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // 1. กล่องใส่โลโก้มหาวิทยาลัย (แบบสี่เหลี่ยม)
              Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                // เพิ่ม clipBehavior เพื่อให้ขอบรูปภาพโค้งมนตาม BorderRadius ที่ตั้งไว้
                clipBehavior: Clip.antiAlias, 
                // ใส่รูปภาพตามที่ต้องการ
                child: Image.asset(
                  'assets/images/School.jpg',
                  fit: BoxFit.cover, // บังคับให้รูปแสดงเต็มกรอบ
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'มหาวิทยาลัยเอเชียอาคเนย์',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // 2. กล่องใส่รูปโปรไฟล์นักศึกษา (แบบวงกลม)
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle, // ทำให้กลายเป็นวงกลม
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                // บังคับให้รูปที่ล้นออกมาถูกตัดเป็นวงกลม
                clipBehavior: Clip.antiAlias, 
                // ใส่รูปภาพตามที่ต้องการ
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.cover, // บังคับให้รูปแสดงเต็มกรอบวงกลม
                ),
              ),
              const SizedBox(height: 30),

              // 3. ข้อมูลนักศึกษา (แก้ข้อความด้านใน '...' ได้เลย)
              const Text(
                'รหัสนักศึกษา : 6752410017',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'ชื่อ-สกุลนักศึกษา : นาย ภควัตร เอมละออ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'อีเมลนักศึกษา : s6752410017@sau.ac.th',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'ชื่อสาขาวิชา : การพัฒนาโปรเเกรมประยุกต์สำหรับอุปกรณ์เคลื่อนที่',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'ชื่อคณะ : ศิลปศาสตร์เเละวิทยาศาสตร์',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40), // เผื่อระยะด้านล่างสุด
            ],
          ),
        ),
      ),
    );
  }
}