import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Todo 1: Buat variable yang dibutuhkan
  List<Candi> _filteredCandis = candiList;
  final TextEditingController _searchController = TextEditingController();

  void _filterCandis(String query) {
    setState(() {
      _filteredCandis = candiList.where((candi) {
        return candi.name.toLowerCase().contains(query.toLowerCase()) ||
            candi.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Todo 2: Buat appbar dengan judul pencarian candi
      appBar: AppBar(title: const Text("Pencarian Candi")),
      // Todo 3: Buat body berupa Column
      body: Column(
        children: [
          // Todo 4: Buat TextField pencarian
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                onChanged: _filterCandis,
                // TODO: 6. Implementasi fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Cari candi ...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            _filterCandis('');
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          // Todo 5: Buat ListView Hasil Pencarian
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (_, index) {
                final candi = _filteredCandis[index];
                // TODO: 8. Implementasi GestureDetector dan Hero animation
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(candi: candi),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              candi.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                candi.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(candi.location),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
