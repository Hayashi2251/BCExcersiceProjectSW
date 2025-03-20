# BC Project Excercise 2

## 📝 Tasks

1️⃣ **Create Enum Extension**  
   - Perluas enumerasi **Customer Group** dengan menambahkan opsi baru:  
     - `"Others"`

2️⃣ **Create Enum Sales Type**  
   - Buat enumerasi **Sales Type** dengan opsi berikut:  
     - `"Item"`
     - `"G/L Account"`

3️⃣ **Create New Table: `Sales Transactions`**  
   - Buat tabel **Sales Transactions** dengan struktur sebagai berikut:

Tasks:
1	Create Enum Extension Extend Customer Group with additional option "Others".
2	Create Enum Sales Type with option "Item", "G/L Account".
3	Create New Table "Sales Transactions" with fields as below.
| **Field Name**         | **Data Type**         | **Description**                 |
|------------------------|----------------------|---------------------------------|
| `Line No.` (PK)       | `Integer`            | Primary Key, nomor baris unik. |
| `Salesperson Code`    | `Code[20]`           | Kode unik untuk salesperson.  |
| `Sales Type`          | `Enum Sales Type`    | Jenis penjualan, menggunakan enumerasi. |
| `Document No.`        | `Code[20]`           | Nomor dokumen transaksi. |
| `Customer Group`      | `Enum Customer Group` | Grup pelanggan berdasarkan kategori. |
| `Sales Amount`        | `Decimal`            | Total nilai penjualan. |

---

## 📖 Penjelasan
- **PK (Primary Key)**: `Line No.` digunakan sebagai identifier unik untuk setiap entri.  
- **Enum**: `Sales Type` dan `Customer Group` adalah enumerasi yang memiliki nilai tetap yang sudah ditentukan sebelumnya.  
- **Code[20]**: Tipe data yang digunakan untuk menyimpan kode unik dengan panjang maksimal 20 karakter.  
- **Decimal**: Digunakan untuk menyimpan jumlah penjualan dengan presisi tinggi.  

