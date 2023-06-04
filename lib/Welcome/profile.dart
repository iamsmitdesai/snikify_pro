import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _editProfile() {
    // Add functionality for edit profile button
  }
  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(16),
                      
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/coder.jpg"), // Replace with desired image
                      radius: 80, // Adjust this value to change the size
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Smit Desai",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "UI/UX Designer",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          // Add functionality for social media button 1
                        },
                        icon: Icon(
                          Icons.facebook,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      "assets/insta.jpg",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 20),
                    Image.asset(
                      "assets/flutter.png",
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _editProfile,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    elevation: 3,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(
                    "smitdesai200@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    "+91 901-652-0966",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(
                    "Surat, Gujarat",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Bio",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Hello, I'm Smit Desai! I'm a passionate UI/UX designer with a keen eye for detail and a focus on creating visually stunning and user-friendly designs. I believe that great design can make a positive impact on people's lives. Feel free to connect with me to discuss design opportunities or collaborations.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
