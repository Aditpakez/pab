import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class ItemCard extends StatefulWidget {
  // todo 1 buat variable
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: widget.candi),
          ),
        );
      },
      child: Card(
        // todo 2 set parameter shape, margin, dan elevation
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // todo 3 : image widget
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.candi.imageAsset,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // todo 4 text widget (nama candi)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                widget.candi.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // todo 5 text widget (type candi)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                widget.candi.type,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
