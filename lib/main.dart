import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        )
    );
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

  // HEADER === BANNER
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

      // BODY STORE WIDGETS
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
            const SizedBox(height: 1),
            _buildProfileCard(), const Divider(height: 20),
            _builderInformationCard(), const Divider(height: 20),
            _buildHorizontalListButtons(), const Divider(height: 20),
            _buildCardForContacts(), const Divider(height: 20, thickness: 0)
          ],
        ),
      )
    );
  }

  // PROFILE CARD
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
            const CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage('https://scontent.fmnl25-6.fna.fbcdn.net/v/t39.30808-6/473646561_4166865343543836_5403416549590694445_n.jpg?stp=dst-jpg_tt6&cstp=mx960x970&ctp=s960x970&_nc_cat=109&_nc_map=urlgen_bucketless&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGpQnrf0Qtyaw1-fKeuXXePVH4-EJb4YRhUfj4QlvhhGLJerRjJhQBzI4HIcJpKCrOqXTq-TAO-pGcEP_DmetMn&_nc_ohc=-abjSkwtHCIQ7kNvwGIENiB&_nc_oc=Adqplw6GUwjIjpMgrspkXFFagMhLz1wpkYYYvQkXh9Xpn2TOS4vHim1s60pBC8ZM3Ro&_nc_zt=23&_nc_ht=scontent.fmnl25-6.fna&_nc_gid=iOvrgWpI9XR112gF6u1NqA&_nc_ss=7b2a8&oh=00_AQFgZkSB9rrE8PJjjDIfHvt9y4KvufLWxbwVIjMPmylIpw&oe=6A7BD87B'),
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
                  Text('PHP Developer and I love Flutter for now')
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
              'ALBUM MAKER',
              style:  GoogleFonts.abel(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              )
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ), child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    '',
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if(progress == null) return child;
                      return const Center( child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.broken_image, size: 50,));
                    },
                  )
              ),
            ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'PAGINATION IMAGE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),
                  )
              ),
            ),
          ],
        ),
      ],
    );
  }

  String? _selectedColor;

  final Map<String, Color> _colorMap = {
    'RED' : Colors.red,
    'BLUE' : Colors.blue,
    'ORANGE' : Colors.deepOrange,
    'YELLOW': Colors.yellowAccent,
    'GREEN': Colors.green
  };


  Widget _buildHorizontalListButtons() {
    final list = ['RED', 'BLUE', 'ORANGE', 'YELLOW', 'GREEN'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Picker'.toUpperCase(),
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(0, 20),
                    const Offset(150, 20),
                    <Color> [
                      Colors.yellowAccent,
                      Colors.red
                    ],
                  ),
            ),
          )
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final label = list[index];
              final isSelected = _selectedColor == label;
              final color = _colorMap[label];

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child:
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState( () => _selectedColor = label);
                    _showSnackBar('Tapped: $label');
                  },
                  onHover: (isHovering) {
                    if (isHovering) setState( () => _selectedColor = label);
                  },

                  child: Container(
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? color : Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 20,
                        color: isSelected ? Colors.white : color,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
        )
      ],
    );
  }

  // BUILD CARD WITH INFORMATION DETAILS
  Widget _buildCardForContacts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT CARD',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Colors.black,
              width: 1
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'JF-Ignacio',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12
                        ),

                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          launch('https://github.com/JF-Ignacio');
                          },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}