import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Restoran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RestaurantProfile(),
    );
  }
}

class RestaurantProfile extends StatelessWidget {
  void _launchEmail() async {
    const email = 'dapurdono11@email.com';
    const subject = 'Tanya Seputar Resto';
    final url = 'mailto:$email?subject=$subject';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMap() async {
    const latitude = -6.982548327947448;
    const longitude = 110.40916261453145;
    final url = 'https://maps.google.com/?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhone() async {
    const phoneNumber = '085123457';
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Restoran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Restoran Dapur Dono',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/resto.jpg'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.email),
                  onPressed: _launchEmail,
                ),
                IconButton(
                  icon: Icon(Icons.map),
                  onPressed: _launchMap,
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: _launchPhone,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Deskripsi Restoran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Text(
                'Dapur Dono,  adalah tempat yang nyaman dan ramah untuk menikmati hidangan lezat dari berbagai masakan. \nDengan suasana yang hangat dan staf yang ramah, kami berkomitmen untuk menyajikan pengalaman kuliner yang tak terlupakan. Dari menu klasik hingga hidangan inovatif, \nsetiap sajian kami disiapkan dengan cinta dan bahan-bahan segar berkualitas. Selamat datang di Dapur Dono, tempat di mana rasa dan kehangatan bertemu.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Menu Restoran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Container(
                width: 300,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(title: Text('Nasi Ayam Gochujang')),
                    ListTile(title: Text('Nasi Beef Mushroom')),
                    ListTile(title: Text('Nasi Beef Blackpepper')),
                    ListTile(title: Text('Nasi Katsu Curry')),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Alamat Restoran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Pujasera, Jl. Kyai Saleh, Mugassari, Kec. Semarang Sel.\nKota Semarang, Jawa Tengah 50224'),
            SizedBox(height: 10),
            Text(
              'Jam Buka',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Senin - Jumat: 10.00 - 20.00\nSabtu - Minggu: 11.00 - 22.00'),
          ],
        ),
      ),
    );
  }
}
