class Operator{
  final String kelas;
  final String gambar;
  bool isFavorite;
  final String name;
  final String subclass;
  final String description;
  final List<String> imageUrls;

  Operator({
    required this.kelas,
    required this.gambar,
    this.isFavorite = false,
    required this.name,
    required this.subclass,
    required this.description,
    required this.imageUrls,
  });
}


