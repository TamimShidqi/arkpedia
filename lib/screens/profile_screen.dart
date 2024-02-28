import 'package:flutter/material.dart';
import 'package:arkpedia/main.dart';
import 'package:arkpedia/screens/home_screen.dart';
import 'package:arkpedia/screens/singin_screen.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  //TODO: 1. Deklarasika variabel yang dibutuhkan
  bool isSignedIn = false;
  String Email = 'admin@gmail.com';
  String userName = 'admin';
  String password = '*****';

  //TODO: 5. Implementasi fungsi SignIn
  void signIn(String Email, String username, String password) {
    setState(() {
      isSignedIn = true;
      userName = username;
      this.password = password;
    });
  }
  //TODO: 6. implementasi fungsi SignOut
  void SignOut() {
    setState(() {
      isSignedIn = true;
      userName = '';
      password = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 34, 34),
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(255, 75, 75, 75),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  //TODO: 2. Buat bagian profile header(gambar profile)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: 
                              AssetImage('assets/images/placeholder_image.png'),
                            ),
                          ),
                          if(isSignedIn)
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.camera_alt),
                            color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  ),
                  //TODO: 3. Buat bagian profile info(info profile)
                  const SizedBox(height: 20,),
                  Divider(color: Colors.indigoAccent[100],),
                  const SizedBox(height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Row(
                          children: [
                            Icon(Icons.person, 
                            color: Colors.blue,
                            ),
                             SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(': $Email',
                        style: TextStyle(fontSize: 18),
                        )
                      ),
                      if(isSignedIn)Icon(Icons.edit),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Divider(
                    color: Colors.indigoAccent[100],),
                  const SizedBox(height: 4,
                  ),
                  Row(
                    children: [
                      //Username
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: const Row(
                          children: [
                            Icon(Icons.lock, 
                            color: Colors.amber,
                            ),
                             SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(': $userName',
                        style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Divider(
                    color: Colors.indigoAccent[100],),
                  const SizedBox(height: 4,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: const Row(
                          children: [
                            Icon(Icons.lock, 
                            color: Colors.amber,
                            ),
                             SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(': $password',
                        style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  //TODO: 4. buat bagian profile action(tombol sigin / sigout)
                  const SizedBox(height: 4,),
                  Divider(
                    color: Colors.indigoAccent[100],),
                  const SizedBox(height: 20,
                  ),
                  isSignedIn ?
                  TextButton(onPressed: SignOut, 
                  child: const Text('Sign Out')):
                  TextButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                }, child: const Text('Sign Out'))
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
  
}