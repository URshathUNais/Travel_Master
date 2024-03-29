import 'package:flutter/material.dart';
import 'package:newflutter/screens/PackageImageDetailScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';

class PackageScreen extends StatelessWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 6, 0, 60),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Packages',
          style: TextStyle(fontSize: 15), // Adjust the font size here
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('packages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          final packages = snapshot.data!.docs;
          return ListView.builder(
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final package = packages[index];
              return ListTile(
                title: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Image.asset(
                        'assets/${package['packagePath']}',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  var connectivityResult =
                      await Connectivity().checkConnectivity();
                  if (connectivityResult == ConnectivityResult.none) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('No Internet Connection'),
                        content: const Text(
                            'Please check your internet connection and try again.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PackageImageDetailScreen(
                          imageData: package,
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
