# Aplikasi Data Diri - Flutter

Aplikasi Flutter sederhana untuk menginput dan menampilkan data diri (Nama, NIM, Tahun Lahir).

## Struktur Proyek

```
lib/
├── main.dart              # Entry point aplikasi
├── hello_world.dart       # Widget contoh HelloWorld
├── row_widget.dart        # Widget contoh Row
├── column_widget.dart     # Widget contoh Column
└── ui/
    ├── form_data.dart     # Form input data
    └── tampil_data.dart   # Tampilan hasil input
```

## Fitur

- Form input untuk Nama, NIM, dan Tahun Lahir
- Kalkulasi otomatis umur berdasarkan tahun lahir
- Navigasi antar halaman menggunakan Navigator
- Validasi input (field tidak boleh kosong)
- UI yang responsif dan menarik dengan Material Design 3

## Screenshot

<img width="407" height="828" alt="iPhone-13-PRO-localhost (6)" src="https://github.com/user-attachments/assets/12837ef5-2939-440f-9562-c4c804f7e2ee" />
<img width="407" height="828" alt="iPhone-13-PRO-localhost (7)" src="https://github.com/user-attachments/assets/36746f49-4a65-46e4-8bb5-a92ace962077" />
<img width="407" height="828" alt="iPhone-13-PRO-localhost (8)" src="https://github.com/user-attachments/assets/8bfe8157-7dc3-44c7-a1c8-7257c2623c40" />

## Penjelasan Proses Passing Data

### 1. **Flow Aplikasi**

```
main.dart (MyApp)
    ↓
FormData (Stateful Widget - Form Input)
    ↓ (Kirim Tombol)
TampilData (Stateless Widget - Tampil Hasil)
```

### 2. **Passing Data dari Form ke Tampilan**

#### Step 1: FormData (lib/ui/form_data.dart)

**File:** `lib/ui/form_data.dart`

FormData adalah **StatefulWidget** yang mengelola state dari 3 TextEditingController:
- `_namaController` - untuk input nama
- `_nimController` - untuk input NIM
- `_tahunLahirController` - untuk input tahun lahir

```dart
class _FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunLahirController = TextEditingController();
```

**Mengapa Stateful?** Karena perlu menyimpan state dari 3 input field.

#### Step 2: Mengambil Data dari Form

Ketika user menekan tombol "Simpan", method `_kirimData()` dipanggil:

```dart
void _kirimData() {
  String nama = _namaController.text;        // Ambil teks dari controller
  String nim = _nimController.text;
  String tahun = _tahunLahirController.text;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TampilData(
        nama: nama,
        nim: nim,
        tahunLahir: tahun,
      ),
    ),
  );
}
```

**Proses:**
1. Ambil nilai dari setiap TextEditingController menggunakan `.text`
2. Gunakan `Navigator.push()` untuk navigasi ke halaman baru
3. **Pass data sebagai named parameters** ke constructor TampilData

#### Step 3: TampilData (lib/ui/tampil_data.dart)

**File:** `lib/ui/tampil_data.dart`

TampilData adalah **StatelessWidget** yang menerima data dari FormData:

```dart
class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  const TampilData({
    Key? key,
    required this.nama,
    required this.nim,
    required this.tahunLahir,
  }) : super(key: key);
```

**Mengapa Stateless?** Karena hanya menampilkan data, tidak perlu mengubah state.

#### Step 4: Menggunakan Data di Tampilan

Di method `build()`, gunakan properties `this.nama`, `this.nim`, `this.tahunLahir`:

```dart
@override
Widget build(BuildContext context) {
  int umur = DateTime.now().year - int.parse(tahunLahir);
  
  final String teksOutput = 
      "Nama saya $nama, NIM $nim, dan umur saya adalah $umur tahun";
  
  return Scaffold(
    body: Center(
      child: Text(teksOutput),
    ),
  );
}
```

### 3. **Diagram Passing Data**

```
┌─────────────────────────────────────────────────────────┐
│  FormData (Stateful)                                    │
│  ┌──────────────────────────────────────────────────┐   │
│  │ TextEditingController _namaController            │   │
│  │ TextEditingController _nimController             │   │
│  │ TextEditingController _tahunLahirController      │   │
│  └──────────────────────────────────────────────────┘   │
│                                                         │
│  User Input → Button Simpan → _kirimData()             │
│                       │                                │
│                       ↓                                │
│  Navigator.push(TampilData(                            │
│    nama: _namaController.text,                         │
│    nim: _nimController.text,                           │
│    tahunLahir: _tahunLahirController.text              │
│  ))                                                    │
└─────────────────────────────────────────────────────────┘
                          │
                          ↓
┌─────────────────────────────────────────────────────────┐
│  TampilData (Stateless)                                 │
│  ┌──────────────────────────────────────────────────┐   │
│  │ final String nama;    ← Terima data dari Form    │   │
│  │ final String nim;                                │   │
│  │ final String tahunLahir;                         │   │
│  └──────────────────────────────────────────────────┘   │
│                                                         │
│  Gunakan properties dalam build():                     │
│  "Nama saya $nama, NIM $nim, ..."                      │
└─────────────────────────────────────────────────────────┘
```

### 4. **Cara Kerja Navigator.push()**

```dart
Navigator.push(
  context,           // Konteks widget saat ini
  MaterialPageRoute(
    builder: (context) => TampilData(  // Widget baru yang ditampilkan
      nama: nama,                        // Pass parameter
      nim: nim,
      tahunLahir: tahun,
    ),
  ),
);
```

- **context**: Context dari widget yang memanggil
- **MaterialPageRoute**: Menyediakan transisi animasi Material Design
- **builder**: Fungsi yang membuat widget baru dan menerima context
- **Parameter**: Data dikirim melalui constructor parameter

### 5. **Kunci Penting**

| Aspek | Penjelasan |
|-------|-----------|
| **FormData** | StatefulWidget yang mengelola input form |
| **TextEditingController** | Mengontrol dan mengambil nilai dari TextField |
| **Navigator.push()** | Navigasi ke halaman baru dan pass data |
| **Constructor Parameter** | Cara menerima data di widget baru |
| **Stateless vs Stateful** | Form butuh Stateful, tampilan bisa Stateless |

## Cara Menjalankan

```bash
flutter pub get
flutter run
```
