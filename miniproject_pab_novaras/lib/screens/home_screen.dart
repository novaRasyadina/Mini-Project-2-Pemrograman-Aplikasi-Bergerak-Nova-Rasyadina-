import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/journal_controller.dart';
import '../controllers/theme_controller.dart';
import '../models/journal.dart';
import '../main.dart';
import 'form_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const kAccent = Color(0xFFE07A5F);
  static const kTag = Color(0xFFFFF0EC);
  static const kMuted = Color(0xFF9A9A9A);

  @override
  Widget build(BuildContext context) {
    final JournalController ctrl = Get.put(JournalController());
    final ThemeController themeCtrl = Get.find();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final kDark = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final cardBg = Theme.of(context).cardColor;

    final now = DateTime.now();
    final months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    final days = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: kAccent,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'My Journal',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: kDark,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Theme Toggle
                  Obx(() => IconButton(
                    onPressed: themeCtrl.toggleTheme,
                    icon: Icon(
                      themeCtrl.isDark.value
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: kDark,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: cardBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  )),
                  const SizedBox(width: 8),
                  // Logout
                  IconButton(
                    onPressed: () => _showLogoutDialog(context),
                    icon: Icon(Icons.logout_rounded, color: kDark),
                    style: IconButton.styleFrom(
                      backgroundColor: cardBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
            ),

            // Email user
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              child: Row(
                children: [
                  // ignore: prefer_const_constructors
                  Icon(Icons.person_outline, size: 14, color: kMuted),
                  const SizedBox(width: 4),
                  Text(
                    supabase.auth.currentUser?.email ?? '',
                    style: const TextStyle(fontSize: 12, color: kMuted),
                  ),
                  const Spacer(),
                  Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF2A2A2A) : const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${ctrl.journals.length} Journal',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── LIST JURNAL
            Expanded(
              child: Obx(() {
                if (ctrl.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: kAccent),
                  );
                }
                if (ctrl.journals.isEmpty) {
                  return _empty(kDark, cardBg);
                }
                return RefreshIndicator(
                  color: kAccent,
                  onRefresh: ctrl.fetchJournals,
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                    itemCount: ctrl.journals.length,
                    itemBuilder: (_, i) => _card(
                      ctrl.journals[i],
                      i,
                      ctrl,
                      context,
                      kDark,
                      cardBg,
                      isDark,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(
          () => const FormScreen(),
          transition: Transition.downToUp,
        ),
        backgroundColor: const Color(0xFF1A1A2E),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Click Here', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.w800)),
        content: const Text('Yakin ingin keluar dari akun?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Batal', style: TextStyle(color: kMuted)),
          ),
          ElevatedButton(
            onPressed: () async {
              await supabase.auth.signOut();
              Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A2E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _empty(Color kDark, Color cardBg) => Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(color: cardBg, shape: BoxShape.circle),
        child: const Text('📖', style: TextStyle(fontSize: 44)),
      ),
      const SizedBox(height: 20),
      Text('Start your story',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: kDark)),
      const SizedBox(height: 6),
      const Text('Write your first journal', style: TextStyle(fontSize: 14, color: kMuted)),
    ]),
  );

  Widget _card(
    Journal j,
    int i,
    JournalController ctrl,
    BuildContext context,
    Color kDark,
    Color cardBg,
    bool isDark,
  ) {
    final parts = j.date.split('-');
    final months = ['','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    final tagColor = isDark ? const Color(0xFF2D2020) : kTag;

    return Dismissible(
      key: ValueKey(j.id ?? '$i${j.title}'),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        return await _showDeleteDialog(context);
      },
      onDismissed: (_) async {
        await ctrl.deleteJournal(j.id!);
        Get.snackbar(
          'Dihapus',
          '"${j.title}" berhasil dihapus.',
          backgroundColor: const Color(0xFF1A1A2E),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(12),
          borderRadius: 14,
        );
      },
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 22),
        child: const Icon(Icons.delete_outline, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: () => Get.to(
          () => FormScreen(journal: j),
          transition: Transition.downToUp,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date block
              Container(
                width: 50,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(children: [
                  Text(
                    parts.length > 2 ? parts[2] : '',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: kDark,
                      height: 1,
                    ),
                  ),
                  Text(
                    parts.length > 1
                        ? months[int.tryParse(parts[1]) ?? 0]
                        : '',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: kAccent,
                      letterSpacing: 0.5,
                    ),
                  ),
                ]),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                        child: Text(
                          j.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: kDark,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(j.mood, style: const TextStyle(fontSize: 20)),
                    ]),
                    const SizedBox(height: 5),
                    Text(
                      j.content,
                      style: const TextStyle(
                        fontSize: 13,
                        color: kMuted,
                        height: 1.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
                    Row(children: [
                      const Icon(Icons.touch_app_outlined, size: 12, color: kMuted),
                      const SizedBox(width: 3),
                      const Text('Tap to edit',
                          style: TextStyle(fontSize: 11, color: kMuted)),
                      const SizedBox(width: 14),
                      const Icon(Icons.swipe_left_outlined, size: 12, color: kMuted),
                      const SizedBox(width: 3),
                      const Text('Swipe to delete',
                          style: TextStyle(fontSize: 11, color: kMuted)),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _showDeleteDialog(BuildContext context) {
    return Get.dialog<bool>(
      AlertDialog(
        title: const Text('Hapus Journal',
            style: TextStyle(fontWeight: FontWeight.w800)),
        content: const Text('Apakah kamu yakin ingin menghapus jurnal ini? Tindakan ini tidak bisa dibatalkan.'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Batal', style: TextStyle(color: kMuted)),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}