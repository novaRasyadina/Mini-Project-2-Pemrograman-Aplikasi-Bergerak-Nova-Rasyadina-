import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/journal_controller.dart';
import '../models/journal.dart';

class FormScreen extends StatefulWidget {
  final Journal? journal;
  const FormScreen({super.key, this.journal});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _title, _date, _content;
  String _mood = '😊';
  bool _isSaving = false;

  final _moods = ['😊','😢','😤','😴','🥰','😰','🤩','😌'];

  static const kAccent = Color(0xFFE07A5F);
  static const kMuted = Color(0xFF9A9A9A);

  @override
  void initState() {
    super.initState();
    final j = widget.journal;
    _title   = TextEditingController(text: j?.title ?? '');
    _date    = TextEditingController(text: j?.date ?? '');
    _content = TextEditingController(text: j?.content ?? '');
    _mood    = j?.mood ?? '😊';
  }

  @override
  void dispose() {
    _title.dispose(); _date.dispose(); _content.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(primary: Color(0xFF1A1A2E)),
        ),
        child: child!,
      ),
    );
    if (d != null) _date.text = d.toString().substring(0, 10);
  }

  Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final ctrl = Get.find<JournalController>();
    final journal = Journal(
      title: _title.text,
      date: _date.text,
      content: _content.text,
      mood: _mood,
    );

    bool success;
    String msg;
    String titleMsg;

    if (widget.journal != null && widget.journal!.id != null) {
      success = await ctrl.updateJournal(widget.journal!.id!, journal);
      titleMsg = success ? 'Berhasil Diupdate ✏️' : 'Gagal Update';
      msg = success
          ? '"${_title.text}" berhasil diperbarui.'
          : 'Terjadi kesalahan saat update.';
    } else {
      success = await ctrl.addJournal(journal);
      titleMsg = success ? 'Journal Tersimpan ✅' : 'Gagal Menyimpan';
      msg = success
          ? '"${_title.text}" berhasil ditambahkan.'
          : 'Terjadi kesalahan saat menyimpan.';
    }

    setState(() => _isSaving = false);

    if (success) {
      Get.back();
      Future.delayed(const Duration(milliseconds: 300), () {
        Get.snackbar(
          titleMsg,
          msg,
          backgroundColor: const Color(0xFF1A1A2E),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(12),
          borderRadius: 14,
          duration: const Duration(seconds: 3),
        );
      });
    } else {
      Get.snackbar(
        titleMsg,
        msg,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 14,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.journal != null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final kDark = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final cardBg = Theme.of(context).cardColor;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(children: [
          // ── BAR ATAS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close_rounded),
                style: IconButton.styleFrom(
                  foregroundColor: isDark ? Colors.white : const Color(0xFF1A1A2E),
                  backgroundColor: cardBg,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const Spacer(),
              Text(
                isEdit ? 'Edit Journal' : 'New Journal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: kDark,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 48),
            ]),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── MOOD DENGAN EMOT
                    // ignore: prefer_const_constructors
                    Text(
                      'How are you feeling?',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: kMuted,
                        letterSpacing: 0.4,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _moods.map((m) {
                          final sel = m == _mood;
                          return GestureDetector(
                            onTap: () => setState(() => _mood = m),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              margin: const EdgeInsets.only(right: 8),
                              width: 50, height: 50,
                              decoration: BoxDecoration(
                                color: sel
                                    ? (isDark ? const Color(0xFFE07A5F) : const Color(0xFF1A1A2E))
                                    : cardBg,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                    // ignore: deprecated_member_use
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(m, style: const TextStyle(fontSize: 22)),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 22),

                    // ── TANGGAL (OTOMASTIS KLIK KALENDER)
                    GestureDetector(
                      onTap: _pickDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: Row(children: [
                          const Icon(Icons.calendar_today_outlined,
                              size: 18, color: kAccent),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _date,
                              enabled: false,
                              decoration: const InputDecoration(
                                hintText: 'Pilih tanggal',
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(color: kMuted),
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kDark,
                              ),
                              validator: (v) =>
                                  v!.isEmpty ? 'Pilih tanggal' : null,
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: kMuted, size: 18),
                        ]),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ── TITLE
                    TextFormField(
                      controller: _title,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: kDark,
                        letterSpacing: -0.8,
                        height: 1.2,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Title...',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: isDark
                              ? const Color(0xFF555555)
                              : const Color(0xFFCCCCCC),
                          letterSpacing: -0.8,
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? 'Tambahkan judul' : null,
                      maxLines: null,
                    ),
                    const SizedBox(height: 12),
                    // ignore: deprecated_member_use
                    Divider(color: Colors.black.withOpacity(0.07)),
                    const SizedBox(height: 12),

                    // ── CONTENT
                    TextFormField(
                      controller: _content,
                      style: TextStyle(
                        fontSize: 15,
                        color: isDark
                            ? const Color(0xFFCCCCCC)
                            : const Color(0xFF3C3C3E),
                        height: 1.8,
                      ),
                      decoration: InputDecoration(
                        hintText:
                            " What's on your mind today?\n\nWrite freely - this is your space...  -nov",
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: isDark
                              ? const Color(0xFF555555)
                              : const Color(0xFFBBBBBB),
                          height: 1.8,
                        ),
                      ),
                      maxLines: null,
                      minLines: 10,
                      keyboardType: TextInputType.multiline,
                      validator: (v) => v!.isEmpty ? 'Tulis sesuatu' : null,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── SAVE BUTTON (SIMPAN JURNAL)
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                )
              ],
            ),
            padding: EdgeInsets.fromLTRB(
              20, 12, 20,
              MediaQuery.of(context).padding.bottom + 12,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: _isSaving
                    ? const CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2)
                    : Text(
                        isEdit ? 'Update Journal' : 'Save Journal',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}