class MahasiswaModel {
  final String? docId;
  final int nim;
  final String nama;
  final String prodi;
  final int id;

  MahasiswaModel({
    this.docId,
    required this.nim,
    required this.nama,
    required this.prodi,
    required this.id,
  });

  factory MahasiswaModel.fromMap(String docId, Map<String, dynamic> data) {
    return MahasiswaModel(
      docId: docId,
      nim: data['NIM'] ?? 0,
      nama: data['Nama'] ?? '',
      prodi: data['Prodi'] ?? '',
      id: data['id'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'NIM': nim,
      'Nama': nama,
      'Prodi': prodi,
      'id': id,
    };
  }
}
