import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradeswap_front/models/workers_model.dart';
import '../../utilities/navbar.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              print("Back button pressed");
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              size: 24,
            )),
        title: const Text(
          "Painting",
          style: TextStyle(color: Color(0xFFEAEAEB)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF003566),
      ),
      body: ListView.builder(
        itemCount: Worker.workers.length,
        itemBuilder: (context, index) {
          final worker = Worker.workers[index];
          return Card(
            elevation: 0,
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(worker.imageUrl),
              ),
              title: Text(
                '${worker.firstName} ${worker.lastName}',
                style: GoogleFonts.lato(fontWeight: FontWeight.w700),
              ),
              subtitle: Text('${worker.skill}\n${worker.contactNumber}'),
              trailing: IconTheme(
                data: const IconThemeData(
                  color: Colors.amber,
                  size: 48,
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const Icon(
                    Icons.star,
                    size: 24,
                  ),
                  Text(
                    '${worker.rating}',
                    style: GoogleFonts.lato(fontWeight: FontWeight.w700),
                  )
                ]),
              ),
              isThreeLine: true,
              onTap: () {},
            ),
          );
        },
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
