import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

void main() => runApp(const CountingApp());

class CountingApp extends StatelessWidget {
  const CountingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IncrementBanner(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IncrementBanner extends StatefulWidget {
  const IncrementBanner({super.key});

  @override
  State<IncrementBanner> createState() => _IncrementBannerState();
}

class _IncrementBannerState extends State<IncrementBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Subtle background makes cards pop
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PROFILE SAVER APP".toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[800],
            height: 1.0,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      // SECTION 1 AND CARD 1
      // ADDED MAINAXIS SIZE TO AVOID COLLAPSE
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 5,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Colors.black,
                width: 0.6
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://scontent.fmnl25-8.fna.fbcdn.net/v/t39.30808-6/473646561_4166865343543836_5403416549590694445_n.jpg?stp=dst-jpg_tt6&cstp=mx960x970&ctp=s960x970&_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGpQnrf0Qtyaw1-fKeuXXePVH4-EJb4YRhUfj4QlvhhGLJerRjJhQBzI4HIcJpKCrOqXTq-TAO-pGcEP_DmetMn&_nc_ohc=C7N6VohEcZ4Q7kNvwE13XrP&_nc_oc=AdqsyYyGKnTAGeFM6pHiQTiEa-imYG7dEtG_7yL4JJr-djwf2_hT1URRfd5l7erWNgQ&_nc_zt=23&_nc_ht=scontent.fmnl25-8.fna&_nc_gid=BZPWAQCgo0x9L12r-zdIyw&_nc_ss=7b2a8&oh=00_AQHEbsmXrWGF42pbpnc7DFWiKZXbok1R147Lhz_TlRMSeQ&oe=6A77E3FB'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // OVERFLOW PROTECTION
                        Text(
                          'Franz Ignacio',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            foreground: Paint()
                              ..shader = ui.Gradient.linear(
                                const Offset(0, 0),
                                const Offset(150, 0),
                                <Color>[
                                  Colors.blue[700]!,
                                  Colors.black,
                                ],
                              ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Mobile Developer',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Card(
            elevation: 4,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20.0)
              )
              )
            ),
        ],
      ),
    );
  }
}