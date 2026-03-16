import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/journal.dart';
import '../main.dart';

class JournalController extends GetxController {
  var journals = <Journal>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchJournals();
  }

  Future<void> fetchJournals() async {
    try {
      isLoading.value = true;
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('journals')
          .select()
          .eq('user_id', userId)
          .order('date', ascending: false);

      journals.value = (data as List).map((e) => Journal.fromMap(e)).toList();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data: $e',
          // ignore: prefer_const_constructors
          backgroundColor: Color(0xFFE07A5F),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> addJournal(Journal journal) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('journals').insert({
        'title': journal.title,
        'date': journal.date,
        'content': journal.content,
        'mood': journal.mood,
        'user_id': userId,
      });
      await fetchJournals();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambah data: $e',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      return false;
    }
  }

  Future<bool> updateJournal(String id, Journal journal) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('journals').update({
        'title': journal.title,
        'date': journal.date,
        'content': journal.content,
        'mood': journal.mood,
      }).eq('id', id).eq('user_id', userId);
      await fetchJournals();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate data: $e',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      return false;
    }
  }

  Future<bool> deleteJournal(String id) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('journals').delete()
          .eq('id', id)
          .eq('user_id', userId);
      await fetchJournals();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus data: $e',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      return false;
    }
  }
}