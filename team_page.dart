import 'package:flutter/material.dart';

/// หน้าจอแสดงข้อมูลผู้จัดทำโปรเจกต์ (2 คน)
///
/// วิธีใช้:
/// 1. แก้ไขข้อมูลใน list `_members` ด้านล่างให้เป็นข้อมูลจริงของคุณ
/// 2. ถ้ามีรูปโปรไฟล์จริง เปลี่ยน `imageUrl` เป็น URL รูป หรือใช้ AssetImage แทน
/// 3. เพิ่มปุ่มเข้าถึงหน้านี้ได้จากเมนู เช่น ใน ProfilePage หรือ Drawer
class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  // ---------------------------------------------------------------
  // 🔧 แก้ไขข้อมูลสมาชิกตรงนี้ได้เลย
  // ---------------------------------------------------------------
  static final List<_TeamMember> _members = [
    _TeamMember(
      name: 'ชื่อ-นามสกุล คนที่ 1',
      studentId: 'รหัสนักศึกษา เช่น 6500xxxxxx',
      role: 'Frontend & Firebase Integration',
      email: 'example1@email.com',
      imageUrl: '', // ใส่ URL รูปโปรไฟล์ตรงนี้ ถ้ามี
    ),
    _TeamMember(
      name: 'ชื่อ-นามสกุล คนที่ 2',
      studentId: 'รหัสนักศึกษา เช่น 6500xxxxxx',
      role: 'UI/UX & Testing',
      email: 'example2@email.com',
      imageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'เกี่ยวกับผู้จัดทำ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // หัวเรื่องด้านบน
          Text(
            'ทีมผู้พัฒนา Restaurant Booking App',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'โปรเจกต์นี้พัฒนาโดยสมาชิก 2 คน',
            style: TextStyle(fontSize: 13, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),

          // การ์ดข้อมูลสมาชิกแต่ละคน
          for (final member in _members) ...[
            _buildMemberCard(context, member, primary),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildMemberCard(
    BuildContext context,
    _TeamMember member,
    Color primary,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // รูปโปรไฟล์ (ถ้าไม่มี imageUrl จะโชว์ไอคอนคนแทน)
          CircleAvatar(
            radius: 34,
            backgroundColor: primary.withOpacity(0.1),
            backgroundImage:
                member.imageUrl.isNotEmpty ? NetworkImage(member.imageUrl) : null,
            child: member.imageUrl.isEmpty
                ? Icon(Icons.person, size: 34, color: primary)
                : null,
          ),
          const SizedBox(width: 16),

          // ข้อมูลข้อความ
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  member.studentId,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),

                // แท็ก role
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    member.role,
                    style: TextStyle(
                      fontSize: 11,
                      color: primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // อีเมลติดต่อ
                Row(
                  children: [
                    Icon(Icons.email_outlined, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        member.email,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// โมเดลข้อมูลสมาชิกในทีม
class _TeamMember {
  final String name;
  final String studentId;
  final String role;
  final String email;
  final String imageUrl;

  const _TeamMember({
    required this.name,
    required this.studentId,
    required this.role,
    required this.email,
    required this.imageUrl,
  });
}
