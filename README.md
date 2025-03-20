# Business Central Project to Excercise 3
---
 _Created by Siloam Wahyu_
Dokumen ini merinci perubahan dan penambahan fitur dalam tabel **Sales Transactions** serta integrasinya dengan halaman lain.

---

## 📝 Tasks & Implementation Details

### **1️⃣ Tambah Field "Description" ke Tabel Sales Transactions**
- **Field Name**: `Description`
- **Data Type**: `Text[100]`
- **Fungsi**: 
  - Secara otomatis terisi dengan **Description dari Table Item** atau **G/L Account Name** ketika field `No.` diperbarui.

---

### **2️⃣ Tambah Field "Salesperson Name" ke Tabel Sales Transactions**
- **Field Name**: `Salesperson Name`
- **Data Type**: `Text[100]`
- **Fungsi**: 
  - **Tidak dapat diperbarui oleh pengguna.**
  - Secara otomatis dihitung oleh sistem berdasarkan **Salesperson Code**.

---

### **3️⃣ Ubah Caption "Salesperson Code" menjadi "Salesperson"**
- **Perubahan**: Label **Salesperson Code** pada tabel **Sales Transactions** akan diubah menjadi **Salesperson** untuk meningkatkan keterbacaan.

---

### **4️⃣ Buat List Page untuk Sales Transactions**
- **Sumber Data**: `Sales Transactions`
- **Fungsi**: 
  - Digunakan sebagai halaman utama ketika pengguna ingin melihat detail tabel **Sales Transactions** dari field lain di tabel lain.

---

### **5️⃣ Tambah Informasi Lookup di Item & Customer Tiles**
#### 📌 **Lookup Item**  
- Menampilkan informasi tambahan:
  - **Costing Method**
  - **Vendor No**
  - **Vendor Item No.**

#### 📌 **Customer Tiles**
- Menampilkan informasi tambahan:
  - **Responsibility Center**
  - **Location Code**
  - **Address**

---

### **6️⃣ Tambah Fields dalam Tabel & Halaman Salesperson/Purchaser**
#### 📌 **Fields yang Ditambahkan di Table & Page Salesperson/Purchaser Card (Tab Sales Transactions)**

| **Field Name**        | **Fungsi** |
|-----------------------|-----------|
| `Sales Type Filter`   | Filter berdasarkan jenis Sales Type untuk perhitungan di bawah. |
| `Total Sales`         | Total Sales Amount dalam Sales Transactions berdasarkan filter. |
| `Max Sales`           | Nilai maksimum Sales Amount berdasarkan filter. |
| `Min Sales`           | Nilai minimum Sales Amount berdasarkan filter. |
| `Avg Sales`           | Nilai rata-rata Sales Amount berdasarkan filter. |
| `Sales Count`         | Jumlah transaksi Sales berdasarkan filter. |
| `Sales Exist`         | Menentukan apakah transaksi Sales ada untuk Salesperson dengan filter tertentu. |

✅ **Semua field ini dihitung otomatis oleh sistem, tidak dapat diperbarui oleh pengguna.**

---

## 🚀 **Implementation Notes**
- **Otomatisasi & Lookup**:
  - **Field Description** → Auto-fill dari **Item/G/L Account**.
  - **Field Salesperson Name** → Auto-fill berdasarkan **Salesperson Code**.
  - **Lookup Item & Customer** → Menampilkan informasi tambahan untuk referensi yang lebih jelas.
  - **Sales Calculations** → Dihitung otomatis berdasarkan Sales Type Filter.

- **UX/UI Improvements**:
  - **Caption "Salesperson Code"** diganti menjadi **"Salesperson"**.
  - **List Page untuk Sales Transactions** dibuat agar lebih mudah diakses.

---

💡 **Catatan:** Pastikan semua perubahan diuji sebelum di-deploy ke production untuk memastikan akurasi data dan integrasi berjalan lancar. 🚀  
