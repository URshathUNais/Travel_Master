import 'package:flutter/material.dart';
import 'package:newflutter/screens/FAQ_Screen.dart';
import 'package:newflutter/screens/policy_screen.dart';
import 'package:newflutter/screens/rating_screen.dart';
import 'package:newflutter/screens/FavoritesScreen.dart';
import 'package:newflutter/services/sqflite_service.dart';
import 'screens/image_list_screen.dart';
import 'models/image_data.dart';
import 'screens/PackageScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SqfliteService.initDatabase();

  // Insert sample image data using the static method
  await SqfliteService.insertImage(ImageData(
      name: 'Pinnawala',
      path: 'image/download.jpg',
      details:
          'Pinnawala is a village in Kegalle District of Sri Lanka and is around 90 km from the capital, Colombo. It is well known for its elephant orphanage.',
      whattodo:
          'Pinnawala Elephant Orphanage: This is the main attraction in Pinnawala. Visitors can observe elephants bathing in the nearby river, feeding them, and learning about the conservation efforts and rehabilitation programs for these magnificent animals.\n\n Visit the Millennium Elephant Foundation: This organization is dedicated to the welfare of elephants and offers experiences like elephant walks and feeding sessions. You can learn about elephant conservation and interact closely with these gentle giants.\n\n Explore the Pinnawala Open Zoo: The zoo is home to various species of animals, including birds, mammals, and reptiles. Visitors can take a leisurely stroll through the zoo and observe the wildlife.\n\n Ride an Elephant: Several places offer elephant rides in Pinnawala. However, it is essential to choose an ethical and responsible operator that prioritizes the well-being of the elephants.',
      mapImagePath: 'image/pinnawala_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Hikkaduwa',
      path: 'image/hikkaduwa.jpg',
      details:
          'Description - Hikkaduwa is a seaside resort town in southwestern Sri Lanka. It’s known for its strong surf and beaches, including palm-dotted Hikkaduwa Beach, lined with restaurants and bars. The shallow waters opposite Hikkaduwa Beach shelter the Hikkaduwa National Park, which is a coral sanctuary and home to marine turtles and exotic fish',
      whattodo:
          'Beach Time: Hikkaduwa is renowned for its beautiful beaches. Spend your days lounging on the golden sands, swimming in the clear waters, or trying out water sports such as snorkeling and diving.\n\n Snorkeling and Diving: The coral reefs off the coast of Hikkaduwa are teeming with marine life, making it a fantastic spot for snorkeling and diving. You can rent equipment and join guided tours to explore the underwater world.\n\n Glass Bottom Boat Rides: If you prefer to stay dry but still want to see the colorful coral reefs and marine life, consider taking a glass-bottom boat ride.\n\n Turtle Hatchery: Visit the Hikkaduwa Turtle Hatchery to learn about conservation efforts and see baby turtles before they are released into the ocean. You may even get the chance to participate in a turtle release.',
      mapImagePath: 'image/hikkaduwa_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Ella',
      path: 'image/ella.jpg',
      details:
          'Description - Ella is a small town in the Badulla District of Uva Province, Sri Lanka governed by an Urban Council. It is approximately 200 kilometres east of Colombo and is situated at an elevation of 1,041 metres above sea level. The area has a rich bio-diversity, dense with numerous varieties of flora and fauna',
      whattodo:
          'Hike to Ella Rock: This is one of the most popular hikes in Ella, offering breathtaking panoramic views of the surrounding countryside. The hike takes about 2-3 hours and is best done early in the morning to avoid the heat.\n\n Visit Little Adams Peak: Another great hiking option, Little Adams Peak offers stunning views of the Ella Gap and the surrounding tea plantations. It is a relatively easy hike compared to Ella Rock and is suitable for all fitness levels.\n\n Explore the Nine Arch Bridge: This iconic bridge is a marvel of engineering and offers a picturesque setting surrounded by lush greenery. You can walk along the railway tracks and enjoy the scenery.\n\n Take a Train Ride: The train journey from Ella to Kandy or Nuwara Eliya is considered one of the most scenic train rides in the world. Make sure to book your tickets in advance and sit on the right side of the train for the best views.\n\n Visit Ravana Falls: This beautiful waterfall is located just a short drive from Ella town. You can take a refreshing dip in the pool at the base of the falls or simply enjoy the view from the top.',
      mapImagePath: 'image/ella_map.jpg'));
  await SqfliteService.insertImage(ImageData(
      name: 'Hambantota Birds Park',
      path: 'image/BirdsPark.jpg',
      details:
          'Description - Birds Park is a home to endemic and exotic birds with over 180 varieties and around 3200 birds. The park which is located in the Southern part of the island expands on a landscape of 35 acres dedicated for bird enthusiast and for those who study ornithology.',
      whattodo:
          'Bird Watching: The park is home to a variety of bird species, including both indigenous and migratory birds. Bring a pair of binoculars and enjoy observing these beautiful creatures in their natural habitat.\n\n Nature Trails: Take a leisurely stroll along the parks well-maintained nature trails. These trails wind through lush greenery and offer opportunities to spot birds, butterflies, and other wildlife..',
      mapImagePath: 'image/BirdsPark_map.jpg'));

  await SqfliteService.insertImage(ImageData(
      name: 'Sigiriya',
      path: 'image/sigiriya.jpg',
      details:
          'Description - Sigiriya or Sinhagiri (Lion Rock Sinhala: සීගිරිය, Tamil: சிகிரியா/சிங்ககிரி, pronounced see-gi-ri-yə) is an ancient rock fortress located in the northern Matale District near the town of Dambulla in the Central Province, Sri Lanka. It is a site of historical and archaeological significance that is dominated by a massive column of granite approximately 180 m (590 ft) high.',
      whattodo:
          'Climb Sigiriya Rock: The main attraction of Sigiriya is the ancient rock fortress, which offers stunning views from the top. The climb can be quite steep and challenging, but the panoramic views of the surrounding landscape make it worth it.\n\n Explore the Gardens: Surrounding the rock fortress are beautiful landscaped gardens with water features, fountains, and ancient ruins. Take some time to wander through these gardens and appreciate the craftsmanship and design.\n\n Pidurangala Rock: Just nearby Sigiriya is Pidurangala Rock, which offers a different perspective of Sigiriya Rock and the surrounding area. It is less crowded compared to Sigiriya and provides excellent opportunities for photography.',
      mapImagePath: 'image/sigiriya_map.jpg'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ImageListScreen(),
    const PackageScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white), // Set the icon color to white
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/Banner.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_sharp),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(225, 1, 36, 83),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.help_outline,
                color: Colors.black,
              ),
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const FAQScreen()), // Navigate to FAQ page
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.black,
              ),
              title: const Text(
                'Privacy',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const PolicyScreen()), // Navigate to Policy screen
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              title: const Text(
                'Rate Us',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FeedbackListScreen()), // Navigate to Rating screen
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
