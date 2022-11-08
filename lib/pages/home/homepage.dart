import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradeswap_front/models/skills_model.dart';
import 'package:tradeswap_front/pages/searchresults/searchresults.dart';
import 'package:tradeswap_front/utilities/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF00203D),
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      bottomNavigationBar: const NavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 314,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFF003566), Color(0xFF00203D)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 72,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Location for service",
                              style: TextStyle(
                                  fontSize: 11.52, color: Color(0xFFCCCCCC)),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: const Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFFD60A),
                                  )),
                              const Text(
                                "Kingston, Jamaica",
                                style: TextStyle(
                                    fontSize: 14.40, color: Color(0xFFFFFFFF)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Hi Mike,",
                    style: TextStyle(fontSize: 35.16, color: Color(0xFFFFFFFF)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "How can we help you today?",
                    style: TextStyle(fontSize: 14.40, color: Color(0xFFCCCCCC)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none),
                        hintText: 'Search',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF00203D),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
                itemCount: skills.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: ((context, index) {
                  final skill = skills[index];

                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SearchResults(),
                      //     // Pass the arguments as part of the RouteSettings. The
                      //     // DetailScreen reads the arguments from these settings.
                      //     settings: RouteSettings(
                      //       arguments: skill,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 24,
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: GridTile(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 24),
                            Image(
                              image: ExactAssetImage(skill.imageURL),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              skill.title,
                              style: const TextStyle(
                                  color: Color(0XFF003566),
                                  fontSize: 14.40,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
