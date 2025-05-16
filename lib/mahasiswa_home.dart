import 'package:flutter/material.dart';
import 'mahasiswa_model.dart';
import 'mahasiswa_service.dart';

class MahasiswaHomePage extends StatefulWidget {
  const MahasiswaHomePage({super.key});

  @override
  State<MahasiswaHomePage> createState() => _MahasiswaHomePageState();
}

class _MahasiswaHomePageState extends State<MahasiswaHomePage> {
  late Future<List<MahasiswaModel>> _mahasiswaFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _mahasiswaFuture = MahasiswaService.getMahasiswaList();
  }

  void _showForm({MahasiswaModel? existingData}) {
    final TextEditingController nimController =
        TextEditingController(text: existingData?.nim.toString() ?? '');
    final TextEditingController namaController =
        TextEditingController(text: existingData?.nama ?? '');
    final TextEditingController prodiController =
        TextEditingController(text: existingData?.prodi ?? '');
    final TextEditingController idController =
        TextEditingController(text: existingData?.id.toString() ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(existingData == null ? "Tambah Mahasiswa" : "Edit Mahasiswa"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "NIM"),
              ),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama"),
              ),
              TextField(
                controller: prodiController,
                decoration: const InputDecoration(labelText: "Prodi"),
              ),
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "ID"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () async {
              final mahasiswa = MahasiswaModel(
                docId: existingData?.docId,
                nim: int.tryParse(nimController.text) ?? 0,
                nama: namaController.text,
                prodi: prodiController.text,
                id: int.tryParse(idController.text) ?? 0,
              );

              if (existingData == null) {
                await MahasiswaService.addMahasiswa(mahasiswa);
              } else {
                await MahasiswaService.updateMahasiswa(existingData.docId!, mahasiswa);
              }

              Navigator.pop(context);
              setState(_loadData);
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(String docId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Hapus Data"),
        content: const Text("Apakah kamu yakin ingin menghapus data ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Hapus"),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await MahasiswaService.deleteMahasiswa(docId);
      setState(_loadData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mahasiswa CRUD")),
      body: FutureBuilder<List<MahasiswaModel>>(
        future: _mahasiswaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data mahasiswa."));
          }

          final mahasiswaList = snapshot.data!;
          return ListView.builder(
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              final mhs = mahasiswaList[index];
              return ListTile(
                title: Text(mhs.nama),
                subtitle: Text("NIM: ${mhs.nim} | Prodi: ${mhs.prodi}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showForm(existingData: mhs),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDelete(mhs.docId!),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
