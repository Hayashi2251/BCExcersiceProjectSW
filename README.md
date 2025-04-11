# Project 4

## Objective
Menambahkan fitur baru terkait keanggotaan pelanggan (Member) dalam sistem Sales di Microsoft Dynamics 365 Business Central.

---

## Task List

### 1. Menambahkan Field "Member Nos." pada Sales & Receivable Setup
- **Table**: `Sales & Receivables Setup`
- **Page**: `Sales & Receivables Setup`
- **Field**: `Member Nos.` (`Code[20]`)
- **Fungsi**:
  - Lookup ke `No. Series` untuk menentukan nomor keanggotaan (Member Nos.)

---

### 2. Menambahkan Field "Member ID" pada Customer
- **Table**: `Customer`
- **Page**: `Customer Card`
- **Field**: `Member ID` (`Code[20]`)

---

### 3. Menambahkan Action untuk Generate "Member ID"
- **Page**: `Customer Card`
- **Action**: `Generate Member ID`
- **Fungsi**:
  - Menggunakan function `GetNextNo` dari `Codeunit NoSeriesManagement`
  - Mengambil dari `Member Nos.` di `Sales & Receivables Setup`

---

### 4. Menambahkan Field "Member ID" di Dokumen Penjualan
- **Tables**:
  - `Sales Header`
  - `Sales Header Archive`
  - `Sales Shipment Header`
  - `Sales Invoice Header`
- **Pages**:
  - `Sales Order`
  - `Posted Sales Shipment`
  - `Posted Sales Invoice`
- **Field**: `Member ID` (`Code[20]`)
- **Logic**:
  - **Sales Order**: otomatis isi `Member ID` dari `Customer`
  - **Posted Documents**: otomatis isi `Member ID` dari `Sales Order`

---

### 5. Menambahkan Field "Discount Member %" pada Sales & Receivable Setup
- **Table**: `Sales & Receivables Setup`
- **Page**: `Sales & Receivables Setup`
- **Field**: `Discount Member %` (`Decimal`)

---

### 6. Menambahkan Field "Discount Member %" pada Sales Line
- **Table**: `Sales Line`
- **Page**: `Sales Order Subform`
- **Field**: `Discount Member %` (`Decimal`)
- **Logic**:
  - Saat membuat baris Sales Order baru dan **Member ID tidak kosong**, isi `Discount Member %` dari `Sales & Receivables Setup`
  - Jika **Type = Item** dan No. diisi/diubah:
    - Isi `Discount Member %` dari `Sales & Receivables Setup`
    - Isi `Line Discount %` dengan nilai dari `Discount Member %`

---

## Catatan Pengembangan
- Pastikan semua field baru memiliki properti `Editable`, `Visible`, dan `ApplicationArea` yang sesuai.
- Perhatikan trigger yang digunakan untuk mengisi otomatis seperti `OnValidate`, `OnInsert`, atau event publisher/subscriber.

---

```

Kalau kamu sudah oke dengan struktur ini, next step tinggal kita breakdown satu-satu untuk implementasi AL-nya nanti. Mau lanjut ke coding atau ada tambahan/editan dulu di dokumennya? 💬