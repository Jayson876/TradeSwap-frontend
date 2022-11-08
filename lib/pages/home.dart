import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tradeswap_front/utilities/works_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List workerType = [
    ['All', true],
    ['Carpenters', false],
    ['Painters', false],
    ['Plumbers', false],
    ['Masons', false],
    ['Electricians', false],
  ];

  void workerTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < workerType.length; i++) {
        workerType[i][1] = false;
      }
      workerType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.filter_list, color: Color(0xFFEBF5FF)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: Color(0xFFEBF5FF)),
          ),
        ],
        backgroundColor: const Color(0xFF003566),
      ),
      body: Column(
        children: [
          Container(
              decoration:
                  const BoxDecoration(color: Color(0xFF003566), boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4))
              ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: RichText(
                          text: TextSpan(
                              text: 'All the experts you need',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: const Color(0xFFEBF5FF),
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: workerType.length,
                      itemBuilder: (context, index) {
                        return WorkerType(
                          workerType: workerType[index][0],
                          isSelected: workerType[index][1],
                          onTap: () {
                            workerTypeSelected(index);
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            children: List.generate(
              20,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
