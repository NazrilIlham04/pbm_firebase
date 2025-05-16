import 'package:cloud_firestore/cloud_firestore.dart';
import 'mahasiswa_model.dart';

class MahasiswaService {
  // Referensi ke koleksi 'Mahasiswa' (huruf M besar, sesuai di Firestore)
  static final CollectionReference _collection =
      FirebaseFirestore.instance.collection('Mahasiswa');

  // CREATE - Tambah data mahasiswa
  static Future<void> addMahasiswa(MahasiswaModel mahasiswa) async {
    await _collection.add(mahasiswa.toMap());
  }

  // READ - Ambil daftar mahasiswa
  static Future<List<MahasiswaModel>> getMahasiswaList() async {
    final snapshot = await _collection.get();
    return snapshot.docs
        .map((doc) => MahasiswaModel.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList();
  }

  // UPDATE - Perbarui data berdasarkan docId
  static Future<void> updateMahasiswa(String docId, MahasiswaModel mahasiswa) async {
    await _collection.doc(docId).update(mahasiswa.toMap());
  }

  // DELETE - Hapus data berdasarkan docId
  static Future<void> deleteMahasiswa(String docId) async {
    await _collection.doc(docId).delete();
  }

  // GET BY ID - Ambil data satu mahasiswa berdasarkan docId (opsional)
  static Future<MahasiswaModel?> getMahasiswaById(String docId) async {
    final docSnapshot = await _collection.doc(docId).get();
    if (docSnapshot.exists) {
      return MahasiswaModel.fromMap(docSnapshot.id, docSnapshot.data() as Map<String, dynamic>);
    }
    return null;
  }
}
