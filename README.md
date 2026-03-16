<<<<<<< HEAD
# Mini Project Pemrograman Aplikasi Bergerak

=======
# Mini Project 2 Pemrograman Aplikasi Bergerak 
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
## Deskripsi Aplikasi 
Aplikasi Daily Jurnal atau Jurnal Harian ini dibuat untuk mencatat pikiran, perasaan, kejadian sehari-hari layaknya sebuah buku harian (diary)
tetapi dalam bentuk digital. aplikasi ini dibuat dengan tampilan yang hangat dan mudah digunakan. pengguna dapat menambahkan jurnal baru setiap hari,
melihat semua jurnal yang sudah dibuat sebelumnya, mengedit jurnal yang sudah ada, serta menghapus jurnal yang sudah tidak dibutuhkan dengan cara 
<<<<<<< HEAD
swipe jurnal ke arah kiri menggunakan kursor. setiap jurnal dilengkapi dengan tanggal, judul, isi tulisan panjang, dan pilihan mood berupa emoji.
=======
swipe jurnal ke arah kiri menggunakan kursor. setiap jurnal dilengkapi dengan tanggal, judul, isi tulisan panjang, dan pilihan mood berupa emoji. 
Aplikasi ini juga dilengkapi dengan fitur tambahan yaitu register dan login yang apabila pengguna login kembali setelah beberapa lama meningkalkan aplikasi, data yang sebelumnya sudah dibuat masih tetap ada karena keterikatan akun, terdapat pula fitur untuk mengaktifkan tema dark yang menambah experience baru dan kenyamanan pengguna saat menggunakan aplikasi.
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522

## Fitur Pada Aplikasi Daily Journal
Fitur-fitur yang ada dalam aplikasi daily journal meliputi 
* create yaitu menambahkan entri baru melalui form yang ada pada fitur "Click Here"
* Read: melihat semua jurnl yang dibuat
* Update: mengubah atau mengedit jurnal yang sudah dibuat sebelumnya dengan cara tap pada kotak daftar jurnal yang
  ingin dihapus
* Delete: Menhgapus jurnal dengan cara swipe ke kiri pada jurnal yang ingin di hapus.
* Undo Delete: Fotur batalkan oenghapusan melalui tombol undo yang muncul setelah melakukan penghapusan di snackbar
* Mood Tracker: Pengguna dapat memilih emoji berdasarkan suasana hati/mood saat menulis jurnal atau catatan harian
* Tanggal: memilih ttanggal menggunakan kalender otomatis.
* Snackbar Notifikasi: Memunculkan notifikasi konfirmasi hapus dengan GetX snackbar.
<<<<<<< HEAD

=======
* light mode dan dark mode: pengguna dapat memilih mode di dalam aplikasi antara mode terang dan gelap.
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522

## Widget Yang Digunakan 

#### Widget Struktur & Layout:
* GetMaterialApp sebagai root aplikasi dengan GetX
<<<<<<< HEAD
* Scaffold sebagai struktur dasar halaman (body, FAB)
* SafeArea untuk mencega konten tertutup status bar
=======
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
* Column untuk menyusun widget secara vertikal
* Row untuk menyusun widget secara horizontal
* Expanded untuk mengisi sisa ruang yang tersedia
* Spacer untuk mendorong widget ke ujung dalam Row/Column
* SizedBox Memberikan jarak /ukuran tetap
* padding menambahkan padding di sekeliling widget
<<<<<<< HEAD
* SingleChildScrollView membuat konten agar dapat di scroll

#### Widget Tampilan:
* Container yaitu widget dengan dekorasi warna, shadow, border radius.
* Card yaitu kartu dengan shadow bawaan material
* Text untuk menampilkan teks
* Icon untuk menampilkan ikon material
* Divider yaitu garis pemisah horizontal
* AnimatedContainer yaitu container dengan animasi saat properti berubah(src=Blackbox AI ^_^)
#### Widget Input
* Form, yaitu Wrapper form dengan GlobalKey validasi
* TextFormField untuk input teks dengan validator bawaan
* TextEditingController untuk mengontrol dan membaca isi TextField
* GlobalKey<FromState> yaitu kunci untuk mengakses state form (alidasi)
* ShowDatePicker adalah dialog kalender bawaan dari flutter

#### Widget Interaksi:
* GestureDetector untuk mendeteksi gesture tap pada widget
* Dismissible digunakan utnuk widget dihapus dengan swipe
* FloatingActionButton.extended yaitu tombol aksi utama di pojok kanan bawah
* ElevatedButton yaitu tombol dengan efek elevated (mengambang)
* IconButton yaitu tombol berbentuk ikon
* TextButton yaitu tombol teks(dipakai di snackbar UNDO)
* ListView.Builder yaitu daftar item efisien
* ListView adalah daftar item dengan scroll (dipakai mood selector)

#### Widget GetX
* Get.to() untuk Navigasi ke halaman baru
* Get.back() untuk kembali ke halaman sebelumnya dan kirim hasil
* Get.snackbar() untuk menampilkan notifikasi snackbar

## Penjelasan Kode 
```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

// ── COLORS ──────────────────────────────────────────────
const kBg     = Color(0xFFF5F0EB);
const kDark   = Color(0xFF1A1A2E);
const kAccent = Color(0xFFE07A5F); // terracotta
const kCard   = Color(0xFFFFFFFF);
const kMuted  = Color(0xFF9A9A9A);
const kTag    = Color(0xFFFFF0EC);

```
Kode di atas merupakan packahe utama flutter yang menyediakan semua widget material dan wajib di import di setiap file flutter. kemudian package GetX yang digunakan untuk navigasi natar halaman dan menampilkan snackbar, selanjutnya adalah warna-warna yang digunakan di dalam aplikasi yang mengusung tema hangat dengan nuansa cream, coklat, putih, nav, dan teraccota.

```dart
class Journal {
  String title, date, content, mood;
  Journal({required this.title, required this.date, required this.content, this.mood = '😊'});
}

```
journal adalah blueprint yang merepresentasikan satu masukan jurnal. setiap objek jurnal menyimpan empat data: title (judul), date (tanggal format YYYY-MM-DD), content (isi tulisan), dan mood (emoji suasana hati). Parameter title, date, dan content bersifat required artinya wajib diisi saat membuat objek baru. Sedangkan mood bersifat opsional dengan nilai default '😊' jika tidak diisi, otomatis menggunakan emoji senyum.
=======
#### Widget Tampilan:
* Scaffold adalah struktur dasar setiap halaman (body, FAB)
* SafeArea untuk menghindari area notch dan status bar  agar tidak tertutup
* Container yaitu widget dengan dekorasi warna, shadow, border radius
* Text untuk menampilkan teks
* Icon utnuk menampilkan ikon material
* Divider untuk garis pemisah horizontal
* AnimatedContainer adalah container dengan animasi saat properti berubah
* CircularProgressIndicator yaitu indikator loading saat data diproses
* SingleChildScrollView untuk membuat halaman agar dapat discroll

#### Widget Input:
* Form: wrapper form dengan GlobalKey untuk validasi
* TextFormField: input teks dengan validator bawaan
* TextEditingController: mengontrol dan membaca isi TextField
* GlobalKey<FormState>: kunci untuk mengakses state form dan validasi
* showDatePicker: dialog kalender bawaan Flutter untuk memilih tanggal

#### Widget Interaksi:
* GestureDetector untuk mendeteksi gesture tap pada widget
* Dismissible, widget yang bisa dihapus dengan swipe ke kiri
* FloatingActionButton.extended merupakan tombol aksi utama di pojok kanan bawah
* ElevatedButton, tombol dengan efek elevated
* IconButton yaiu tombol berbentuk ikon (toggle tema, logout, close)
* TextButton yaitu tombol teks dipakai di dalam AlertDialog (Batal)
* AlertDialog adalah dialog konfirmasi sebelum hapus dan logout
* ListView.builder yaitu daftar item yang untuk menampilkan jurnal
* ListView daftar item horizontal (dipakai pada mood selector)

#### Widget GetX:
* GetxController base class controller untuk state management
* Obx yaitu widget reaktif yang otomatis rebuild saat data berubah
* Get.put() mendaftarkan controller ke dependency injection
* Get.find() mengambil controller yang sudah didaftarkan
* Get.to() navigasi ke halaman baru
* Get.back() kembali ke halaman sebelumnya
* Get.offAll() navigasi ke halaman baru dan hapus semua history
* Get.dialog() menampilkan dialog menggunakan GetX
* Get.snackbar() menampilkan notifikasi snackbar

## Penjelasan Kode

#### main.dart
```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
```
WidgetsFlutterBinding.ensureInitialized() berfungsi untuk memastikan flutter sudah siap sebelum menjalankan kode async seperti load dan koneksi ke supabase. pada kode di atas terdapar juga ketrangan await yang pada await baris pertama yaitu untuk membaca .env yang berisi kredensial supabase. harus dijalankan sebelum supabase.initialize() karena nilai URL dan Key nya di ambil dari sini. untuk kode await yang selanjutnya berfungsi menghubungkan aplikasi flutter ke project supabase menggunakan URL dan Anon Key dari file .env. tnada ! pada kode di atas artinya nilai tidak boleh null, kalau .env kosong, maka aplikasi akan crash.

```dart
final supabase = Supabase.instance.client;
```
variabel global yang dapat diakses dari semua file tanpa perlu import ulang setiap kali ingin menggunakan supabase.
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Daily Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'serif'),
      home: const HomeScreen(),
    );
  }
}
```
MyApp menggunkan StatlessWidget karena tidak memiliki data yang berubah yang artinya hanya bertugas mengatur konfigurasi awal. GetMaterialApp digunakan sebagai pengganti MaterialApp biasa agar semua fitur GetX bisa berfungsi di seluruh aplikasi. debugShowCheckedModeBanner: false menyembunyikan banner merah "DEBUG" di pojok layar. Font serif dipilih agar tampilan terasa seperti menulis di buku harian sungguhan, dan home: HomeScreen() menentukan halaman pertama yang dibuka saat aplikasi dijalankan.

```dart
class _HomeScreenState extends State<HomeScreen> {
  final List<Journal> _list = [];

  void _goToForm([Journal? j, int? i]) async {
    final res = await Get.to(
      () => FormScreen(journal: j, index: i),
      transition: Transition.downToUp,
    );
    if (res is Map) {
      setState(() {
        if (res['update'] == true) _list[res['i']] = res['j'];
        else _list.insert(0, res['j']);
      });
    }
  }
```
HomeScreen menggunakan StatefulWidget karena daftar jurnal (_list) bisa berubah sewaktu-waktu akibat aksi tambah, edit, atau hapus — dan setiap perubahan harus membuat UI ikut diperbarui. _list adalah List<Journal> yang dimulai kosong, menjadi tempat penyimpanan semua entri jurnal selama aplikasi berjalan. selanjutnya erdapat fungsi yang menangani dua kondisi sekaligus yaitu 
menambah jurnal baru dan mengedit jurnal lama. [Journal? j, int? i] yang berarti opsional, jika dipanggil tanpa argumen maka mode tambah baru, jika dipanggil dengan data jurnal dan index-nya maka mode edit. await Get.to() membuka FormScreen dan menunggu hasilnya setelah layar ditutup. Jika user menyimpan data, result berisi Map yang diterima sebagai res. Lalu setState() dipanggil untuk memperbarui UI jika mode update, data lama diganti di index yang sama; jika mode tambah, data baru disisipkan di posisi paling atas list.

```dart
void _delete(int i) {
    final j = _list[i];
    setState(() => _list.removeAt(i));
    Get.snackbar('Deleted', j.title,
      backgroundColor: kDark, colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 14,
      mainButton: TextButton(
        onPressed: () { setState(() => _list.insert(i, j)); Get.back(); },
        child: const Text('UNDO', style: TextStyle(color: kAccent, fontWeight: FontWeight.bold)),
=======

  @override
  Widget build(BuildContext context) {
    final ThemeController themeCtrl = Get.put(ThemeController());

    return Obx(() => GetMaterialApp(
```
Get.put() mendaftarkan ThemeController ke GetX dependency injection sehingga bisa diakses dari mana saja menggunakan Get.find(). kemudian kode Obx() membuat seluruh GetMaterialApp reaktif terhadap perubahan tema. Setiap kali isDark berubah, seluruh app otomatis rebuild dengan tema baru.

```dart
theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'serif',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1A1A2E),
          secondary: Color(0xFFE07A5F),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F0EB),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'serif',
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE07A5F),
          secondary: Color(0xFFE07A5F),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
      ),
      themeMode: themeCtrl.isDark.value ? ThemeMode.dark : ThemeMode.light,
```
kode di atas menddefinisikan dua tema yaitu light dan dark. themeMode menentukan tema mana yang aktif berdasarkan nilai isDark dari ThemeController.

```dart
home: supabase.auth.currentSession != null
          ? const HomeScreen()
          : const LoginScreen(),
    ));
  }
}
```
untuk cek apakah ada sesi login yang sedang aktif. jika sudah login langsung ke HomeScreen, jika belum ke LoginScreen.

#### Package models: journal.dart
```dart
class Journal {
  final String? id;
  final String title;
  final String date;
  final String content;
  final String mood;
  final String? userId;
```
Class model yang merepresentasikan satu data jurnal. id dan userId bersifat nullable karena saat membuat jurnal baru id belum ada atau dibuat otomatis oleh supabase.

```dart
  Journal({
    this.id,
    required this.title,
    required this.date,
    required this.content,
    this.mood = '😊',
    this.userId,
  });
```
Constructor dengan required pada field wajib. mood memiliki nilai default '😊' jika tidak diisi. id dan userId opsional karena tidak selalu tersedia.

```dart
 factory Journal.fromMap(Map<String, dynamic> map) {
    return Journal(
      id: map['id']?.toString(),
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      content: map['content'] ?? '',
      mood: map['mood'] ?? '😊',
      userId: map['user_id']?.toString(),
    );
  }
```
fromMap() mengubah data mentah dari Supabase (berupa Map) menjadi objek Journal. kemudian operator "??" memberikan nilai default jika data dari Supabase kosong atau null.

```dart
Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date,
      'content': content,
      'mood': mood,
      'user_id': userId,
    };
  }
}
```
toMap() adalah kebalikan dari fromMap, yang mengubah objek journal menjadi Map untuk dikirim ke supabase saat insert atau update data.

#### Package Controllers: theme_controller.dart
```dart
class ThemeController extends GetxController {
  var isDark = false.obs;
```
Extends GetxController agar bisa menggunakan fitur reaktif GetX dan lifecycle management seperti onInit() dan onClose(). selanjutnya Variabel reaktif (.obs) yang menyimpan status tema. false = Light Mode (default). Karena reaktif, setiap perubahan nilai otomatis memperbarui semua widget yang menggunakan nilai ini.

```dart
 void toggleTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
```
kode di atas digunakan untuk beralih tema. !isDark.value membalik nilai boolean. Get.changeThemeMode() langsung menerapkan tema baru ke seluruh aplikasi tanpa perlu restart.

#### Package Constrollers: journal_controller.dart
```dart
class JournalController extends GetxController {
  var journals = <Journal>[].obs;
  var isLoading = false.obs;
```
journal di sini sebagai list yang menyimpan semua data jurnal, UI otomatis update saat list nya berubah. isLoading digunakan untuk menampilkan loading indicator saat data sedang diambil.

```dart
@override
  void onInit() {
    super.onInit();
    fetchJournals();
  }
```
onInit() dipanggil otomatis saat controller pertama kali dibuat. di sini langsung memaanggil fetchJournals() agar data jurnal langsung dimuat ketika halaman home dibuka.

```dart
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
```
pada kode di atas digunakan untuk mengambil semua jurnal milik user dari supabase. .eq('user_id', userId) memastikan hanya jurnal milik user yang login diambil, .order('date', ascending: false) mengurutkan terbaaru yang di atas. try-catch-finally menangani error dan memastikan isLoading selalu dimatikan setelah selesai.

```dart
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
```
menambah jurnal baru ke supabase. user_id dimasukan agar jurnal terhubung ke akun user yang sedang login. setelah insert berhasil, fetchJournals() dipanggil untuk memperbarui list di Home. Mengembalikan true jika berhasil, false jika gagal.

```dart
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
```
kode di atas adalah untuk memperbarui jurnal yang sudah ada. .eq('id', id).eq('user_id', userId) memastikan hanya jurnal milik user tersebut yang bisa diupdate, sesuai Row Level Security di Supabase.

```dart
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
```
kode di atas adalah ntuk menghapus jurnal dari supabase. user_id disertakan untuk memastikan user hanya bisa menghapus jurnal miliknya sendiri.

####  Package Screens: login_screen.dart
```dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
```
menggunakan StatefulWidget karena halaman login memiliki state yang berubah seperti status loading dan toggle visibility password. _LoginScreenState adalah class yang menyimpan semua logika dan state halaman ini. 

```dart
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _isLoading = false;
  bool _obscure = true;

  static const kDark = Color(0xFF1A1A2E);
  static const kAccent = Color(0xFFE07A5F);
  static const kMuted = Color(0xFF9A9A9A);
```
_formKey digunakan untuk mengakses dan memvalidasi semua field dalam form sekaligus. _emailCtrl dan _passCtrl mengontrol dan membaca nilai input email dan password. _isLoading menyimpan status apakah proses login sedang berjalan. _obscure menyimpan status apakah password disembunyikan, defaultnya true. kDark, kAccent, kMuted adalah konstanta warna yang dipakai di seluruh halaman ini.

```dart
 Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await supabase.auth.signInWithPassword(
        email: _emailCtrl.text.trim(),
        password: _passCtrl.text,
      );
      Get.offAll(() => const HomeScreen(), transition: Transition.fadeIn);
    } catch (e) {
      Get.snackbar(
        'Login Gagal',
        'Email atau password salah.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 14,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
```
_formKey.currentState!.validate() memeriksa semua field sebelum melakukan login, jika ada yang tidak valid fungsi berhenti dan menampilkan pesan error di bawah field. setState(() => _isLoading = true) mengaktifkan loading spinner di tombol. supabase.auth.signInWithPassword() mengirim request autentikasi ke Supabase. .trim() menghapus spasi tidak sengaja di awal atau akhir email. Get.offAll() mengganti seluruh navigation stack dengan HomeScreen menggunakan animasi fade sehingga user tidak bisa kembali ke halaman login dengan tombol back. catch menangkap error jika login gagal dan menampilkan snackbar merah. finally selalu mematikan loading spinner baik berhasil maupun gagal.

```dart
 Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF121212) : const Color(0xFFF5F0EB);
    final cardBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : kDark;
```
Cek tema aktif saat ini dan menetaapkan warna yang sesuai. bg adalah warna background halamn, cardBg adalah warna background field input, dan textColor adalah warna teks. semua warna berubah otomatis mengikuti tema light atau dark.

```dart
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: cardBg,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: const Text('📖', style: TextStyle(fontSize: 48)),
                  ),
                ),
```
Logo aplikasi berupa emoji buku yang ditampilkan di dalam lingkaran dengan shadow halus. BoxShape.circle membuat Container berbentuk lingkaran sempurna. Ditampilkan di bagian atas halaman login sebagai identitas visual aplikasi.

```dart
     // Email
                _buildLabel('Email', textColor),
                const SizedBox(height: 6),
                _buildField(
                  controller: _emailCtrl,
                  hint: 'email@example.com',
                  cardBg: cardBg,
                  textColor: textColor,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) =>
                      v!.isEmpty ? 'Masukkan email' : null,
                ),
                const SizedBox(height: 16),

                // Password
                _buildLabel('Password', textColor),
                const SizedBox(height: 6),
                _buildField(
                  controller: _passCtrl,
                  hint: '••••••••',
                  cardBg: cardBg,
                  textColor: textColor,
                  obscure: _obscure,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: kMuted, size: 20,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  validator: (v) =>
                      v!.length < 6 ? 'Minimal 6 karakter' : null,
                ),
                const SizedBox(height: 28),

```
memanggil fungsi helper _buildLabel() untuk label dan _buildField() untuk field input. field email menggunakan keyboardType: TextInputType.emailAddress agar keyboard menampilkan tombol @. field password menggunakan obscure: _obscure untuk menyembunyikan teks dan suffixIcon berupa tombol toggle visibility. validator pada password mengecek minimal 6 karakter.

```dart
  SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kDark,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2)
                        : const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
```
Tombol login dengan lebar penuh double.infinity dan tinggi 52px. onPressed: _isLoading ? null : _login menonaktifkan tombol saat proses login berlangsung dengan memberikan null. menampilkan CircularProgresIndicator saat loading dan teks "Login" saat tidak ada proses. elevation: 0 menghilangkan shadow bawaan tombol untuk tampilan datar/flat.

```dart
          Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ignore: prefer_const_constructors
                      Text("Belum punya akun? ",
                          // ignore: prefer_const_constructors
                          style: TextStyle(color: kMuted)),
                      GestureDetector(
                        onTap: () => Get.to(
                          () => const RegisterScreen(),
                          transition: Transition.rightToLeft,
                        ),
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                            color: kAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
      ),
    );
  }
```
<<<<<<< HEAD

sebeum menghapus, item yang akan dihapus disimpan dulu ke variabel j. ini penting agar fitur UNDO bisa bekerja dan data tidak benar-benar hilang, hanya dipindah saja dari list, dan dapat dikembalikan jika pengguna tidak jadi menghapus nya. 

```dart
Widget build(BuildContext context) {
    final now = DateTime.now();
    final months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    final days = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];

    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Column(children: [
 // ── HEADER
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            child: Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}',
                  style: const TextStyle(fontSize: 13, color: kAccent, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                ),
                const SizedBox(height: 2),
                const Text('My Journal', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: kDark, letterSpacing: -0.8)),
              ]),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: kDark, borderRadius: BorderRadius.circular(20)),
                child: Text('${_list.length} Journal', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ]),
          ),
          const SizedBox(height: 20),
```

kode diatas adalah untuk membuat tanggal menjadi dapat dipilih secara mudah dan kode selanjurnta adalah untuk mengatur tanggal di tambahkan nya jurnal yang dibuat secara otomatis akan muncul di dalam kotak jurnal yang ditambah agar tangggal dapat terlihat di atasnyta dengan mengatur ke wawrna teracota. pada kode di atas terdapat pula kode untuk membuat tampilan tulisan di awal tampilan aplikasi yaitu My Journal dan berapa jurnal yang sudah dibuat di dalam aplikasi tersebut.

```dart
 // ── LIST JURNAL YANG DITAMBAHKAN
          Expanded(
            child: _list.isEmpty
              ? _empty()
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                  itemCount: _list.length,
                  itemBuilder: (_, i) => _card(_list[i], i),
                ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _goToForm(),
        backgroundColor: kDark,
=======
baris teks dibagian bawah yang mengajak user mendaftar jika belum memiliki akun. GestureDetector membungkus teks "Daftar" agar bisa diklik untuk navigasi ke RegisterScreen dengan animasi slide dari kanan ke kiri. mainAxisSize: MainAxisSize.min membuat Row hanya selebar kontennya saja.

```dart
Widget _buildLabel(String text, Color textColor) => Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: textColor,
          letterSpacing: 0.4,
        ),
      );
```
Fungsi helper untuk membuat label kecil di atas setiap field input. letterSpacing: 0.4 memberikan sedikit jarak antar huruf agar label terlihat lebih rapi. dibuat sebagai fungsi terpisah agar tidak ada duplikasi kode karena setiap label memiliki tampilan yang sama.

```dart
 Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required Color cardBg,
    required Color textColor,
    TextInputType? keyboardType,
    bool obscure = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            // ignore: deprecated_member_use
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9A9A9A)),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      );
```
fungsi helper di sini untuk membuat field input yang konsisten tampilannya. parameter required wajib diisi sedangkan keyboardType, obscure, suffixIcon, dan validator bersifat opsinonal dengan nilai default. obscureText: obscure menyembunyikan teks password jika bernilai true. border: InputBorder.none menghilangkan garis bawah bawaan dari flutter. boxShadow memberikan efek shadow halus agar field terlihat melayang. fungsi ini digunakan ulang untuk field email dan password agar tampilan konsisten tanpa duplikasi kode.

```dart
@override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }
}
```
dispose() wajib dipanggil untuk membersihkan kedua controller dari memori saat halaman ditutup untuk mencegah memory leak.

#### Package Screen: regiter_screen.dart

```dart
 final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _isLoading = false;
  bool _obscure = true;
  bool _obscureConfirm = true;

  static const kDark = Color(0xFF1A1A2E);
  static const kAccent = Color(0xFFE07A5F);
  static const kMuted = Color(0xFF9A9A9A);
```
Tiga controller untuk email, password, dan konfirmasi password. dua variabel _obscure yang terpisah yaitu _obscure untuk field password dan _obscureConfirm untuk field konfirmasi sehingga bisa di toggle secara independen satu sama lain.

```dart
  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await supabase.auth.signUp(
        email: _emailCtrl.text.trim(),
        password: _passCtrl.text,
      );
      Get.back();
      Get.snackbar(
        'Registrasi Berhasil! 🎉',
        'Akun berhasil dibuat. Silahkan login.',
        backgroundColor: kDark,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 14,
      );
    } catch (e) {
      Get.snackbar(
        'Registrasi Gagal',
        'Email mungkin sudah terdaftar.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 14,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
```
supabase.auth.signUp() membuat akun baru di Supabase Auth. emai dan password langsung dikirim ke supabase tanpa perlu enkripsi manual karena supabase menanganinya secara otomatis. setelah berhasil Get.back() kembali ke halaman login dan snackbar sukses ditampilkan dengan warna gelap. catch menangkap error jika registrasi gagal biasanya karena email sudah terdaftar dan menampilkan snackbar merah. finally selalu mematikan loading spinner setelah proses selesai.

```dart
 IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_rounded, color: textColor),
                ),
```
Tombol kembali di pojok kiri atas menggunakan ikon panah arrow_back_ios_rounded. Get.back() kembali ke halaman login. warna ikon menyesuaikan tema aktif melalui textColor.

```dart
 Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: textColor,
                    letterSpacing: -0.8,
                  ),
                ),
                // ignore: prefer_const_constructors
                Text(
                  'Start your journaling journey',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 14, color: kMuted),
                ),
                const SizedBox(height: 32),
```
judul halaman register dengan font beasr 28px tebal dan subtitle yang lebih kecil dan berwarna muted. letterSpacing: -0.8 memberikan tampilan heading yang lebih tegas dengan jarak antar huruf yang sedikit lebih rapat.

```dart
_buildField(
                  controller: _confirmCtrl,
                  hint: '••••••••',
                  cardBg: cardBg,
                  textColor: textColor,
                  obscure: _obscureConfirm,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: kMuted,
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                  validator: (v) => v != _passCtrl.text
                      ? 'Password tidak cocok'
                      : null,
                ),
                const SizedBox(height: 28),
```
Field konfirmasi password yang membandingkan nilainya dengan field password utama. validator mengecek apakah isi field konfirmasi sama dengan _passCtrl.text, jika berbeda menampilkan pesan "Password tidak cocok". _obscureConfirm dikontrol terpisah dari _obscure agar user bisa toggle visibility kedua field secara independen.

```dart
SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2)
                        : const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
```
Tombol daftar dengan warna aksen terracotta kAccent yang berbeda dari tombol login yang berwarna gelap, memberi identitas visual berbeda antara dua halaman ini. sama seperti tombol login, menampilkan loading spinner saat proses berlangsung dan teks "Daftar Sekarang" saat tidak ada proses.

```dart
  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }
}
```
membersihkan ketiga controller dari memori saatt haalaman ditutup. di halaman register ada tiga controller yang harus di dispose berbeda dengan halaman login yang hanya dua.

#### Package Screens: home_screen.dart
```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const kAccent = Color(0xFFE07A5F);
  static const kTag = Color(0xFFFFF0EC);
  static const kMuted = Color(0xFF9A9A9A);
```
menggunakan StatelessWidget karena state dikelola sepenuhnya oleh JournalController dan ThemeController dari GetX, tidak ada state lokal di halaman ini. kTag adalah warna latar blok tanggal di kartu jurnal.

```dart
Widget build(BuildContext context) {
    final JournalController ctrl = Get.put(JournalController());
    final ThemeController themeCtrl = Get.find();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final kDark = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final cardBg = Theme.of(context).cardColor;
```
Get.put() mendaftarkan dan membuat instance JournalController pertama kali. Get.find() mengambil ThemeController yang sudah ada. isDark mengecek tema aktif untuk menentukan warna yang dipakai. bg dan cardBg diambil dari ThemeData yang sudah didefinisikan di main.dart agar konsisten dengan tema.

```dart
    final now = DateTime.now();
    final months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    final days = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
```
Mengambil tanggal dan waktu saat ini. Array months dan days mengkonversi angka bulan dan hari dari DateTime menjadi nama singkat yang lebih mudah dibaca.

```dart
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
```
Header menampilkan hari dan tanggal hari ini dengan warna aksen di atas judul "My Journal" yang lebih besar dan tebal. now.weekday - 1 karena index array mulai dari 0 sedangkan weekday dari Flutter mulai dari 1 untuk Senin. now.month - 1 dengan alasan yang sama.

```dart
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
```
dua tombol di pojok kanan header. tombol pertama dibungkus Obx() agar ikon berubah reaktif antara matahari dan bulan sesuai tema aktif. tombol kedua untuk logout yang membuka dialog konfirmasi. keduanya memiliki background cardBg dan sudut membulat agar tampak konsisten.

```dart
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
```
Baris di bawah header menampilkan email user yang sedang login di sebelah kiri dengan ikon orang. di sebelah kanan ada badge yang menampilkan jumlah jurnal secara reaktif menggunakan Obx() sehingga angka otomatis update setiap kali jurnal ditambah atau dihapus. supabase.auth.currentUser?.email ?? '' mengambil email dengan aman tanpa crash jika currentUser null.

```dart
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
```
Expanded membuat area list mengisi sisa ruang layar. Obx() membuat seluruh area reaktif terhadap perubahan data. tiga kondisi ditampilkan secara bergantian yaitu loading spinner saat data dimuat, halaman kosong jika tidak ada jurnal, atau list jurnal jika ada data. RefreshIndicator memungkinkan pull-to-refresh. ListView.builder hanya membangun widget yang terlihat di layar sehingga efisien untuk data yang banyak. padding bottom: 80 memberi ruang agar kartu terakhir tidak tertutup FAB.

```dart
floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(
          () => const FormScreen(),
          transition: Transition.downToUp,
        ),
        backgroundColor: const Color(0xFF1A1A2E),
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
        foregroundColor: Colors.white,
        icon: const Icon(Icons.edit_outlined),
        label: const Text('Click Here', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
```
<<<<<<< HEAD
Kode di atas yang dimulai dengan Expanded digunakan untuk menaruh list jurnal yang ditambahkan di tampilan apkikasi berbentuk kotak memanjang dengan sudut tumpul. kemudian kode yang dimulai dengan floatingActionButton tersebut digunakan untuk menaruh fitur tambahkan jurnal baru yang bertuliskan "Click Here".

```dart
  Widget _empty() => Center(
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        padding: const EdgeInsets.all(28),
        decoration: const BoxDecoration(color: kCard, shape: BoxShape.circle),
        child: const Text('📖', style: TextStyle(fontSize: 44)),
      ),
      const SizedBox(height: 20),
      const Text('Start your story', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: kDark)),
      const SizedBox(height: 6),
      const Text('write your first journal', style: TextStyle(fontSize: 14, color: kMuted)),
    ]),
  );

  Widget _card(Journal j, int i) {
    final parts = j.date.split('-');
    final months = ['','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return Dismissible(
      key: ValueKey('$i${j.title}'),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => _delete(i),
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
=======
FloatingActionButton.extended di pojok kanan bawah dengan ikon pensil dan label tombol"Click Here". Saat ditekan navigasi ke FormScreen tanpa membawa data jurnal artinya mode tambah baru. transition: Transition.downToUp memberikan animasi slide dari bawah ke atas.
```dart
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
```
Dialog konfirmasi logout. Jika user memilih Batal dialog ditutup dan user tetap di Home. Jika user memilih Logout maka supabase.auth.signOut() mengakhiri session aktif di Supabase dan Get.offAll() membersihkan seluruh navigation stack lalu kembali ke LoginScreen dengan animasi fade sehingga user tidak bisa kembali ke Home dengan tombol back.

```dart
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
```
Widget halaman kosong yang ditampilkan saat belum ada jurnal. emoji buku ditampilkan di dalam lingkaran, diikuti teks ajakan menulis jurnal pertama. mainAxisSize: MainAxisSize.min membuat Column hanya sebesar kontennya saja tidak memenuhi seluruh layar.

```dart
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
```
Fungsi yang membangun tampilan kartu untuk setiap jurnal. j.date.split('-') memecah string tanggal format YYYY-MM-DD menjadi array ['YYYY','MM','DD']. index 0 di array months dikosongkan karena bulan dimulai dari 1. tagColor berubah antara warna gelap kemerahan di Dark Mode dan warna krem terang di Light Mode.

```dart
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
```
Dismissible membungkus setiap kartu untuk fitur swipe-to-delete. key: ValueKey(j.id) menggunakan id unik dari Supabase sebagai key. direction: endToStart hanya mengizinkan swipe dari kanan ke kiri. confirmDismiss menampilkan dialog konfirmasi terlebih dahulu sebelum menghapus, jika user memilih Batal kartu kembali ke posisi semula. onDismissed dipanggil setelah konfirmasi dan menghapus data dari Supabase lalu menampilkan snackbar notifikasi.

```dart
  background: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 22),
        child: const Icon(Icons.delete_outline, color: Colors.white),
      ),
<<<<<<< HEAD
      child: GestureDetector(
        onTap: () => _goToForm(j, i),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kCard,
            borderRadius: BorderRadius.circular(20),
            // ignore: deprecated_member_use
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Date block
            Container(
              width: 50,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: kTag, borderRadius: BorderRadius.circular(14)),
              child: Column(children: [
                Text(parts.length > 2 ? parts[2] : '',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: kDark, height: 1)),
                Text(parts.length > 1 ? months[int.tryParse(parts[1]) ?? 0] : '',
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: kAccent, letterSpacing: 0.5)),
              ]),
            ),
            const SizedBox(width: 14),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Expanded(child: Text(j.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: kDark),
                  maxLines: 1, overflow: TextOverflow.ellipsis)),
                Text(j.mood, style: const TextStyle(fontSize: 20)),
              ]),
              const SizedBox(height: 5),
              Text(j.content,
                style: const TextStyle(fontSize: 13, color: kMuted, height: 1.5),
                maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Row(children: [
                // Hint: tap to edit
                Row(children: const [
                  Icon(Icons.touch_app_outlined, size: 12, color: kMuted),
                  SizedBox(width: 3),
                  Text('Tap to edit', style: TextStyle(fontSize: 11, color: kMuted)),
                ]),
                const SizedBox(width: 14),
                // Hint: swipe to delete
                Row(children: const [
                  Icon(Icons.swipe_left_outlined, size: 12, color: kMuted),
                  SizedBox(width: 3),
                  Text('Swipe to delete', style: TextStyle(fontSize: 11, color: kMuted)),
                ]),
              ]),
            ])),
          ]),
=======
```
Latar belakang merah dengan ikon tempat sampah yang terlihat saat user melakukan swipe ke kiri. alignment: Alignment.centerRight memposisikan ikon di kanan karena arah swipe dari kanan ke kiri.

```dart
 child: GestureDetector(
        onTap: () => Get.to(
          () => FormScreen(journal: j),
          transition: Transition.downToUp,
        ),
```
GestureDetector mendeteksi tap pada kartu untuk navigasi ke FormScreen dalam mode edit. FormScreen(journal: j) mengirim data jurnal yang dipilih sehingga semua field di form terisi otomatis dengan data yang sudah ada.

```dart
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
```
Container kartu jurnal dengan sudut membulat radius 20, warna background sesuai tema, dan shadow dengan offset ke bawah yang memberikan kesan kartu melayang di atas background.

```dart
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
```
Blok tanggal di sebelah kiri kartu berukuran 50x50. Menampilkan angka tanggal besar di atas dan nama bulan singkat kecil di bawah. parts[2] adalah tanggal (DD) dan parts[1] adalah bulan (MM) yang dikonversi ke nama menggunakan array months. int.tryParse() mengkonversi string bulan ke integer dengan aman tanpa crash jika gagal.

```dart
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
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
        ),
      ),
    );
  }
<<<<<<< HEAD
}
```
_empty() adalah widget yang ditampilkan ketika belum ada jurnal sama sekali, berisi ikon buku dan teks panduan. _card() adalah tampilan setiap penambahan jurnal dalam bentuk kartu. Kartu dibungkus Dismissible agar bisa dihapus dengan swipe ke kiri saat swipe, background merah dengan ikon tempat sampah akan terlihat, dan setelah animasi selesai _delete() dipanggil. Kartu juga dibungkus GestureDetector sehingga ketika di-tap, form edit terbuka.

```dart
class FormScreen extends StatefulWidget {
  final Journal? journal;
  final int? index;
  const FormScreen({super.key, this.journal, this.index});
  @override
  State<FormScreen> createState() => _FormScreenState();
}

=======
```
Area konten card di sebelah kanan blok tanggal. Baris pertama menampilkan judul jurnal dan emoji mood secara berdampingan. maxLines: 1 dan overflow: TextOverflow.ellipsis memastikan judul tidak lebih dari satu baris dan menampilkan "..." jika terlalu panjang. di bawahnya preview dua baris isi jurnal dengan warna muted. paling bawah ada hint visual kecil yang memberi tahu user cara berinteraksi dengan kartu.

```dart
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
```
Dialog konfirmasi hapus yang mengembalikan nilai bool. Get.dialog<bool> menampilkan dialog dan menunggu hasilnya. Get.back(result: false) jika user memilih Batal sehingga kartu kembali ke posisi semula. Get.back(result: true) jika user memilih Hapus sehingga onDismissed dijalankan. Pesan "tidak bisa dibatalkan" memberi warning kepada user bahwa data akan hilang permanen dari Supabase.

#### Package Screens: form_screen.dart
```dart
class FormScreen extends StatefulWidget {
  final Journal? journal;
  const FormScreen({super.key, this.journal});

  @override
  State<FormScreen> createState() => _FormScreenState();
}
```
journal bersifat nullable (?). Jika null berarti halaman dibuka untuk tambah jurnal baru. Jika berisi data jurnal berarti untuk edit. dengan cara ini satu halaman digunakan untuk dua fungsi sekaligus yaitu Create dan Update.

```dart
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
class _FormScreenState extends State<FormScreen> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _title, _date, _content;
  String _mood = '😊';
<<<<<<< HEAD

  final _moods = ['😊','😢','😤','😴','🥰','😰','🤩','😌'];
```
FormScreen digunakan untuk dua keperluan sekaligus, yaitu menambah jurnal baru dan mengedit yang lama. Parameter journal bertanda ? (nullable) jika null berarti mode tambah, jika berisi data berarti mode edit. index menyimpan posisi jurnal di list, digunakan saat update agar data ditulis di tempat yang benar. kemudian adalah kode yang diatur untuk memilih emot sesuai dengan suasana hati pengguna.

```dart
@override
=======
  bool _isSaving = false;

  final _moods = ['😊','😢','😤','😴','🥰','😰','🤩','😌'];

  static const kAccent = Color(0xFFE07A5F);
  static const kMuted = Color(0xFF9A9A9A);
```
_form adalah kunci untuk mengakses state form dan menjalankan validasi semua field sekaligus. late artinya controller diinisialisasi nanti di initState(). _mood menyimpan emoji mood yang dipilih dengan default '😊'. _isSaving mencegah double submit saat proses simpan berlangsung. _moods adalah daftar delapan emoji yang tersedia untuk dipilih.

```dart
 @override
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
  void initState() {
    super.initState();
    final j = widget.journal;
    _title   = TextEditingController(text: j?.title ?? '');
    _date    = TextEditingController(text: j?.date ?? '');
    _content = TextEditingController(text: j?.content ?? '');
    _mood    = j?.mood ?? '😊';
  }
<<<<<<< HEAD

  @override
=======
```
initState() dipanggil sekali saat halaman pertama dibuat. Jika untuk edit semua field diisi dengan data jurnal yang ada menggunakan j?.title. jika untuk tambah baru semua field kosong karena ?? '' memberikan string kosong sebagai default.

```dart
@override
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
  void dispose() {
    _title.dispose(); _date.dispose(); _content.dispose();
    super.dispose();
  }
```
<<<<<<< HEAD
initState() dipanggil sekali saat widget pertama dibuat. Di sini ketiga TextEditingController diinisialisasi, jika mode edit, controller diisi dengan data lama menggunakan operator ?. dan ??; jika mode tambah, diisi string kosong. dispose() wajib dipanggil saat widget dihancurkan untuk melepaskan memori yang dipakai controller. Tanpa ini, akan terjadi memory leak, yaitu kondisi di mana aplikasi tidka dapat mengembalikan memori yang tidak lagi digunakan, karena controller terus menempati memori walaupun layar sudah ditutup.

```dart
  Future<void> _pickDate() async {
=======
dispose() wajib dipanggil karena berfungsi untuk membersihkan ketiga controller dari memori saat halaman ditutup untuk mencegah memory leak.

```dart
Future<void> _pickDate() async {
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (ctx, child) => Theme(
<<<<<<< HEAD
        data: ThemeData.light().copyWith(colorScheme: const ColorScheme.light(primary: kDark)),
=======
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(primary: Color(0xFF1A1A2E)),
        ),
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
        child: child!,
      ),
    );
    if (d != null) _date.text = d.toString().substring(0, 10);
  }
<<<<<<< HEAD

  void _save() {
    if (!_form.currentState!.validate()) return;
    Get.back(result: {
      'j': Journal(title: _title.text, date: _date.text, content: _content.text, mood: _mood),
      'update': widget.journal != null,
      'i': widget.index,
    });
  }
```
_pickDate() membuka dialog kalender bawaan Flutter. Setelah user memilih tanggal, DateTime yang dikembalikan dikonversi ke format string "YYYY-MM-DD" menggunakan .substring(0, 10), lalu dimasukkan ke controller _date. Pemeriksaan if (d != null) memastikan field tidak berubah jika user menekan cancel. kemudian ada kode _save() pertama-tama menjalankan validasi seluruh form dengan _form.currentState!.validate(). Jika ada field yang kosong, pesan error muncul di bawah field tersebut dan fungsi berhenti. Jika semua valid, Get.back() menutup layar dan mengirimkan data sebagai result berupa Map — berisi objek Journal baru, flag update (true/false), dan index yang akan diterima kembali oleh HomeScreen.

```dart
 @override
  Widget build(BuildContext context) {
    final isEdit = widget.journal != null;
    return Scaffold(
      backgroundColor: kBg,
=======
```
showDatePicker() menampilkan dialog kalender bawaan Flutter. initialDate: DateTime.now() membuka kalender di tanggal hari ini. builder mengubah warna header kalender agar sesuai tema aplikasi. d.toString().substring(0, 10) mengambil hanya bagian YYYY-MM-DD dari string DateTime yang lengkap.

```dart
Future<void> _save() async {
    if (!_form.currentState!.validate()) return;
    setState(() => _isSaving = true);
```
Fungsi simpan dipanggil saat user menekan tombol Save/Update. validate() memeriksa semua validator di form sebelum lanjut, jika ada field yang kosong fungsi berhenti dan pesan error ditampilkan. _isSaving = true menonaktifkan tombol untuk mencegah user menekan dua kali.

```dart
 final ctrl = Get.find<JournalController>();
    final journal = Journal(
      title: _title.text,
      date: _date.text,
      content: _content.text,
      mood: _mood,
    );
```
Get.find<JournalController>() mengambil instance controller yang sudah ada tanpa membuat yang baru, selanjutnya membuat objek Journal baru dari isi semua field yang sudah diisi user.

```dart
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
```
Mengecek widget.journal != null untuk menentukan apakah ini operasi Update atau Create. Jika edit memanggil updateJournal() dengan id jurnal yang ada, jika tambah baru memanggil addJournal(). menyiapkan pesan snackbar yang berbeda untuk setiap kondisi berhasil atau gagal

```dart
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
```
_isSaving = false mengaktifkan kembali tombol setelah proses selesai. Jika berhasil Get.back() langsung kembali ke HomeScreen. Future.delayed(300ms) menunggu animasi transisi halaman selesai sebelum menampilkan snackbar agar muncul di Home bukan di form yang sudah tertutup. jika gagal snackbar merah ditampilkan dan user tetap di halaman form untuk bisa memperbaiki input.

```dart
@override
  Widget build(BuildContext context) {
    final isEdit = widget.journal != null;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final kDark = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final bg = Theme.of(context).scaffoldBackgroundColor;
    final cardBg = Theme.of(context).cardColor;
```
Variabel lokal di build(). isEdit menentukan mode halaman. isDark mengecek tema aktif. kDark berubah antara putih di Dark Mode dan gelap di Light Mode. bg dan cardBg diambil dari ThemeData di main.dart agar konsisten dengan tema.

```dart
   return Scaffold(
      backgroundColor: bg,
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
      body: SafeArea(
        child: Column(children: [
          // ── BAR ATAS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(children: [
              IconButton(
                onPressed: () => Get.back(),
<<<<<<< HEAD
                icon: const Icon(Icons.close_rounded, color: kDark),
                style: IconButton.styleFrom(backgroundColor: kCard, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
              const Spacer(),
              Text(isEdit ? 'Edit Journal' : 'New Journal',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kDark)),
=======
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
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
              const Spacer(),
              const SizedBox(width: 48),
            ]),
          ),
<<<<<<< HEAD

          Expanded(
=======
```
iini adalah bagian topbar halaman form atau bagian atas halaman form (pengissian jurnal). tombol close di kiri untuk kembali ke home menggunakan Get.back(). judul di tengah berubah antara "Edit Journal" dan "New Journal" sesuai isEdit. SizedBox(width: 48) di kanan menyeimbangkan lebar tombol close agar judul benar-benar berada di tengah. Spacer() mendorong elemen ke tepi kiri dan kanan.

`Expanded(
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Form(
                key: _form,
<<<<<<< HEAD
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  // ── MOOD
                  const Text('How are you feeling?',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: kMuted, letterSpacing: 0.4)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView(scrollDirection: Axis.horizontal, children: _moods.map((m) {
                      final sel = m == _mood;
                      return GestureDetector(
                        onTap: () => setState(() => _mood = m),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          margin: const EdgeInsets.only(right: 8),
                          width: 50, height: 50,
                          decoration: BoxDecoration(
                            color: sel ? kDark : kCard,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                          ),
                          child: Center(child: Text(m, style: const TextStyle(fontSize: 22))),
                        ),
                      );
                    }).toList()),
                  ),
                  const SizedBox(height: 22),

                  // ── TANGGAL
                  GestureDetector(
                    onTap: _pickDate,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(color: kCard, borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
                      child: Row(children: [
                        const Icon(Icons.calendar_today_outlined, size: 18, color: kAccent),
                        const SizedBox(width: 12),
                        Expanded(child: TextFormField(
                          controller: _date,
                          enabled: false,
                          decoration: const InputDecoration(
                            hintText: 'Select date', border: InputBorder.none,
                            isDense: true, contentPadding: EdgeInsets.zero,
                            hintStyle: TextStyle(color: kMuted),
                          ),
                          style: const TextStyle(fontWeight: FontWeight.w600, color: kDark),
                          validator: (v) => v!.isEmpty ? 'Pick a date' : null,
                        )),
                        const Icon(Icons.chevron_right, color: kMuted, size: 18),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── JUDUL
                  TextFormField(
                    controller: _title,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: kDark, letterSpacing: -0.8, height: 1.2),
                    decoration: const InputDecoration(
                      hintText: 'Title...', border: InputBorder.none,
                      isDense: true, contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Color(0xFFCCCCCC), letterSpacing: -0.8),
                    ),
                    validator: (v) => v!.isEmpty ? 'Add a title' : null,
                    maxLines: null,
                  ),
                  const SizedBox(height: 12),
                  Divider(color: Colors.black.withOpacity(0.07)),
                  const SizedBox(height: 12),

                  // ── CONTENT
                  TextFormField(
                    controller: _content,
                    style: const TextStyle(fontSize: 15, color: Color(0xFF3C3C3E), height: 1.8),
                    decoration: const InputDecoration(
                      hintText: "What's on your mind today?\n\nWrite freely — this is your space...  -nov",
                      border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(fontSize: 15, color: Color(0xFFBBBBBB), height: 1.8),
                    ),
                    maxLines: null, minLines: 10,
                    keyboardType: TextInputType.multiline,
                    validator: (v) => v!.isEmpty ? 'Write something' : null,
                  ),
                ]),
              ),
            ),
          ),

          // ── SAVE BUTTON(SIMPAN)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 16, offset: const Offset(0, -4))],
            ),
            padding: EdgeInsets.fromLTRB(20, 12, 20, MediaQuery.of(context).padding.bottom + 12),
            child: SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDark, foregroundColor: Colors.white, elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(isEdit ? 'Update Journal' : 'Save Journal',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
=======
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
```
Expanded membuat area form mengisi sisa ruang layar di antara top bar dan tombol simpan, kemudian SingleChildScrollView yang memungkinkan konten di-scroll jika terlalu panjang terutama saat keyboard muncul, form membungkus semua field dengan key: _form agar bisa divalidasi sekaligus.

```dart
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
```
ListView horizontal menampilkan 8 emoji dalam satu baris yang bisa di-scroll. .map() mengubah setiap emoji di list _moods menjadi widget kotak. sel = m == _mood mengecek apakah emoji ini yang sedang dipilih. adapun AnimatedContainer memberikan animasi perubahan warna smooth 180ms saat mood dipilih dan background berubah menjadi gelap atau terracotta sesuai tema, GestureDetector mendeteksi tap dan mengupdate _mood dengan setState().

```dart
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
```
Field tanggal dibungkus GestureDetector karena TextFormField di dalamnya enabled: false sehingga tidak bisa diketik manual. tap di mana saja pada container ini membka date picker melalui _pickDate(). ikon kalender di kiri dan chevron di kanan memberi hint visual bahwa field ini interaktif. validator memastikan tanggal wajib dipilih sebelum bisa menyimpan jurnal.

```dart
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
```
Field judul dengan font besar 26px dan tebal w900 menyerupai tampilan judul jurnal sungguhan. letterSpacing: -0.8 memberikan jarak antar huruf yang sedikit rapat untuk tampilan heading yang tegas. border: InputBorder.none, isDense: true, dan contentPadding: EdgeInsets.zero menghilangkan semua padding dan border bawaan Flutter. maxLines: null memungkinkan judul lebih dari satu baris jika terlalu panjang. hintStyle menggunakan warna yang berbeda untuk dark dan light mode agar hint tetap terbaca.

```dart
Divider(color: Colors.black.withOpacity(0.07)),
                    const SizedBox(height: 12),

```
Garis pemisah tipis antara field judul dan field konten. withOpacity(0.07) membuat garis sangat transparan sehingga hanya terlihat sebagai pemisah halus tanpa mengganggu tampilan.

```dart
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
```
kode di atas adalah bagian field isi jurnal dengan area tulis yang luat, dimana height: 1.8 memberikan jarak antar baris yang nyaman untuk menulis dan membaca, kemudian maxLines: null memungkinkan teks berkembang tanpa batas ke bawah mengikuti isi tulisan. minLines: 10 memastikan area tulis minimal 10 baris tingginya sejak awal. keyboardType: TextInputType.multiline menampilkan keyboard dengan tombol Enter untuk ganti baris. \n\n di hintText memberikan jarak dua baris dalam teks placeholder. validator menampilkan pesan "Tulis sesuatu" jika field masih kosong saat tombol simpan ditekan.

```dart
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
```
Container tombol simpan yang menempel di bagian bawah layar. offset: Offset(0, -4) membuat shadow ke atas memberikan kesan container melayang di atas konten yang bisa di-scroll. MediaQuery.of(context).padding.bottom menambahkan padding ekstra di perangkat dengan home indicator seperti iPhone agar tombol tidak tertutup sistem.

```dart
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
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
              ),
            ),
          ),
        ]),
      ),
    );
```
<<<<<<< HEAD
Kode di atas adalah bagian build() dari FormScreen, yaitu layar untuk menambah atau mengedit jurnal. Variabel isEdit dibuat di awal untuk menentukan mode layar yang nilainya true jika sedang mengedit, false jika tambah baru. Variabel ini digunakan untuk mengubah judul halaman dan teks tombol simpan tanpa perlu membuat dua layar terpisah. Struktur layar dibagi menjadi tiga bagian. Top bar berisi tombol X untuk kembali tanpa menyimpan dan judul halaman di tengah. Konten form dibungkus SingleChildScrollView agar bisa di scroll ketika keyboard muncul. Tombol simpan diletakkan di luar scroll area agar selalu terlihat di bagian bawah layar. Di dalam form terdapat empat input. Mood selector menampilkan deretan emoji horizontal, nantinya emoji yang dipilih berubah warna dengan animasi 180ms. TextField tanggal di-set enabled, false sehingga pengisian hanya bisa dilakukan lewat date picker. TextField judul menggunakan font besar agar terasa seperti menulis judul buku harian. TextField isi jurnal memiliki tinggi minimalnya 10 baris dan bisa terus membesar sesuai panjang tulisan. Ketiga TextFormField memiliki validator masing-masing. Jika ada field yang kosong saat tombol ditekan, pesan error akan muncul. Jika semua terisi, fungsi _save() dipanggil untuk mengirim data kembali ke HomeScreen.

## Dokumentasi Aplikasi Daily Journal
<img width="959" height="913" alt="{DEEB6FE8-D83C-4749-9A72-F1B49D37A97B}" src="https://github.com/user-attachments/assets/b18b041c-4c79-4a1c-bb46-740146a91dd5" />

<img width="957" height="910" alt="{19F4362C-DCE2-4B62-B44A-AFAA70731FF9}" src="https://github.com/user-attachments/assets/01edaee4-02ba-45fe-bbf1-42091a0288eb" />

<img width="961" height="912" alt="{5C671502-A25A-423A-89F9-B2AD049AC2CF}" src="https://github.com/user-attachments/assets/3c730969-aca5-4873-84a5-125f9b7bb88a" />

<img width="956" height="913" alt="{8ECF4A2F-E1B2-44FF-9D26-9E821EB2C1AB}" src="https://github.com/user-attachments/assets/4fa7703a-0b30-4658-9337-93f2b4b384ba" />

<img width="956" height="915" alt="{5527524E-F488-411E-B7BE-21AF820C927B}" src="https://github.com/user-attachments/assets/15c24a9f-1371-40f6-975b-2804d6dec672" />

<img width="960" height="913" alt="{11E8F4A5-8A52-447A-8FCD-5D71BD98ECB4}" src="https://github.com/user-attachments/assets/378d00a7-b439-4b7f-a235-83a1ada732a1" />

<img width="960" height="912" alt="{B9CC1A24-2BFC-4670-8C7B-8564921077FA}" src="https://github.com/user-attachments/assets/8f6882e9-363a-414d-8903-edb0104fe800" />

 <img width="958" height="915" alt="{3F168C5C-4866-4362-A8CD-CE0289B02A18}" src="https://github.com/user-attachments/assets/dedb012f-e0ec-4a2a-ae54-85a22ce04466" />
 
=======
pada kode di atas, onPressed: _isSaving ? null : _save menonaktifkan tombol saat proses berlangsung. elevation: 0 menghilangkan shadow bawaan tombol untuk tampilan flat. Teks tombol berubah antara "Update Journal" dan "Save Journal" sesuai isEdit. CircularProgressIndicator menggantikan teks saat proses simpan berlangsung memberikan feedback visual kepada user bahwa sistem sedang memproses.

## Dokumentasi Aplikasi Daily Journal
![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/b8bf93f3d528170c809386402125fffc1a6680c5/%7BFB1298C7-A62E-471E-8B48-CB2F7BCD413B%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/dda855d6477b74f949db96a4d66ac6c656889a95/%7B09CF4E98-1FDE-4320-A4BC-F6C4C7F873CB%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/0db8dedf2108720a2967ed55f3f04ef516964eec/%7B15956C5B-4517-4D4C-BD84-7FCBE764E712%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/1bbc6b1a76a84436c476f9730f20e7ae931b04f7/%7B57C6ACC6-36B3-4AB2-BFF1-CA3E5CA00A97%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/aaa65f8a2838b4f61422c155d0547203e8b25507/%7B93A7C1BA-11FB-485B-A506-825C8EF66BA8%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/e3c6137f0b4a15bfaf8ae59460751916f58b5576/%7B907F730F-1231-44C1-A931-79181E900A91%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/5105a6b66d533513580ee361b1723ab96db99283/%7B7FE7C6B4-E265-467C-88B6-F939A0B8E7BA%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/0197bb06ae02e3e408dee8feb9a78ef145ff2f9c/%7B713EAA73-DAF8-4BF8-8468-A87CC620B471%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/fa08488f3b0079b4d335f84a51b44a6266074349/%7B3A3D095F-F55F-4787-9814-71FA24924B08%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/9e9321156963da59227c19cb0db5465a688b238f/%7B53B00274-B957-4633-80F1-55231FEBCFE1%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/16ff822fcd13ddcffa62fb53beb1e08530779aaf/%7BFF5A7BBB-75D2-473D-9F2F-5F47232ED4C9%7D.png)
![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/762c93926e64164e0f2ea928705ee1eacc8c02f8/%7B3F5353C4-8D2E-4B99-B9D6-94B2FFD668DF%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/983fc9c3ed7b113ddf059001f48cd08394c6658d/%7B23EC0693-463D-4CAD-AB41-7EEECDE01FDC%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/2482397bdcf9ce5f559b8349f850fc4aae4f5a56/%7B887BE74C-8A72-4233-854D-64DB7E5B64B6%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/4b16202e0a9552ecd567f5ec89c82098113c9468/%7B7C9582B5-E21F-4BA8-94AC-3D65AE6DDE08%7D.png)

![image alt](https://github.com/novaRasyadina/Mini-Project-2-Pemrograman-Aplikasi-Bergerak-Nova-Rasyadina-/blob/813b8fd464dbda3af519fddff308df113f755faf/%7B6DCB9FC2-863C-4745-883C-AE5553D4837C%7D.png)
>>>>>>> e262d1bb160834c2f290fc643e4e99e8cede3522
