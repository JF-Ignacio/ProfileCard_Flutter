import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileBanner(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileBanner extends StatefulWidget {
  const ProfileBanner({super.key});

  @override
  State<ProfileBanner> createState() => _ProfileBanner();
}

class _ProfileBanner extends State<ProfileBanner> {

  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void showAlert() {
    showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(

            iconColor: Colors.white,
            title: const Text('Future builder!'),
            content: Text(
              _nameController.text.isEmpty
                  ? 'This project is not finish yet. Soon to add input containers.'
                  : 'Hi Developer!'
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Ok'),
              )
            ],
          ); // ALERT DIALOG
        } // BUILDER
    ); // SHOW DIALOG
  } // END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'PROFILE APP VIEWER',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white
          )
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: showAlert,
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Profile Card',
              style:
              TextStyle(
                fontStyle: FontStyle.italic,
              ),

            ),
            // BUILDING WIDGETS AND DESIGN AFTER
            _buildProfileCard(), const Divider(height: 20),
            _builderInformationCard(), const Divider(height: 20)
          ]
        ),
      )
    );
  }
}

Widget _buildProfileCard() {
  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: Colors.blue,
        width: 0.5,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://scontent.fmnl25-8.fna.fbcdn.net/v/t39.30808-6/473646561_4166865343543836_5403416549590694445_n.jpg?stp=dst-jpg_tt6&cstp=mx960x970&ctp=s960x970&_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGpQnrf0Qtyaw1-fKeuXXePVH4-EJb4YRhUfj4QlvhhGLJerRjJhQBzI4HIcJpKCrOqXTq-TAO-pGcEP_DmetMn&_nc_ohc=-abjSkwtHCIQ7kNvwGIENiB&_nc_oc=Adqplw6GUwjIjpMgrspkXFFagMhLz1wpkYYYvQkXh9Xpn2TOS4vHim1s60pBC8ZM3Ro&_nc_zt=23&_nc_ht=scontent.fmnl25-8.fna&_nc_gid=q_QinXM3zuWIbleXaG-A8Q&_nc_ss=7b2a8&oh=00_AQGmCKYVNJdeSAG70c_ZMN1kXtDCoGKl3XU2AF2U2VvpUA&oe=6A79357B'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Franz Ignacio',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('PHP Developer and Flutter not Developer')
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget _builderInformationCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
       child: Text(
         'TUP logo + Stock Image',
         style:  GoogleFonts.blakaHollow(
           fontStyle: FontStyle.normal,
           fontSize: 15,
         )
       ),
      ),
      const SizedBox(height: 8),
      Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black
            ),
          )
        ],
      )
    ],
  );
}