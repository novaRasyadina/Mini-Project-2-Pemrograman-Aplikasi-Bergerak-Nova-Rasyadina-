# Mini Project 2 Pemrograman Aplikasi Bergerak 
## Deskripsi Aplikasi 
Aplikasi Daily Jurnal atau Jurnal Harian ini dibuat untuk mencatat pikiran, perasaan, kejadian sehari-hari layaknya sebuah buku harian (diary)
tetapi dalam bentuk digital. aplikasi ini dibuat dengan tampilan yang hangat dan mudah digunakan. pengguna dapat menambahkan jurnal baru setiap hari,
melihat semua jurnal yang sudah dibuat sebelumnya, mengedit jurnal yang sudah ada, serta menghapus jurnal yang sudah tidak dibutuhkan dengan cara 
swipe jurnal ke arah kiri menggunakan kursor. setiap jurnal dilengkapi dengan tanggal, judul, isi tulisan panjang, dan pilihan mood berupa emoji. 
Aplikasi ini juga dilengkapi dengan fitur tambahan yaitu register dan login yang apabila pengguna login kembali setelah beberapa lama meningkalkan aplikasi, data yang sebelumnya sudah dibuat masih tetap ada karena keterikatan akun, terdapat pula fitur untuk mengaktifkan tema dark yang menambah experience baru dan kenyamanan pengguna saat menggunakan aplikasi.

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
* light mode dan dark mode: pengguna dapat memilih mode di dalam aplikasi antara mode terang dan gelap.

## Widget Yang Digunakan 

#### Widget Struktur & Layout:
* GetMaterialApp sebagai root aplikasi dengan GetX
* Column untuk menyusun widget secara vertikal
* Row untuk menyusun widget secara horizontal
* Expanded untuk mengisi sisa ruang yang tersedia
* Spacer untuk mendorong widget ke ujung dalam Row/Column
* SizedBox Memberikan jarak /ukuran tetap
* padding menambahkan padding di sekeliling widget
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

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

```dart
```

