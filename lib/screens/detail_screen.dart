import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Detail Header
            Stack(
              children: [
                //image utama
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      candi.imageAsset,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //tombol back
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),

            //Detail Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  //info atas :nama candi dan tombol favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        candi.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          candi.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: candi.isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          // Handle favorite button press
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  //info tengah : lokasi candi, kapan dibangun, dan tipe
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.red),
                      const SizedBox(width: 8.0),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(candi.location),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.blue),
                      const SizedBox(width: 8.0),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Dibangun',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(candi.built),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.house, color: Colors.green),
                      const SizedBox(width: 8.0),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Tipe',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(candi.type),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Divider(color: Colors.deepPurple.shade100),
                  const SizedBox(height: 16.0),
                  //info bawah : deskripsi candi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  Text(candi.description, textAlign: TextAlign.justify),
                ],
              ),
            ),

            //Detail Gallery
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100),
                  const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: candi.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: candi.imageUrls[index],
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 150,
                                    height: 150,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Klik gambar untuk memperbesar',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
