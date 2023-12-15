import 'package:flutter/material.dart';
import 'dog.dart';
import 'owner.dart';

class FakeDogDatabase {
  static Owner owner = Owner("Spikey Sanju", "Developer & Pet Lover", "assets/owner.jpg");

  static List<Dog> dogList = [
    Dog(
        0,
        "Hachiko",
        3.5,
        "Male",
        "Brown",
        12.9,
        "389m away",
        "assets/orange_dog.png",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
        owner),
    Dog(
        1,
        "Skooby Doo",
        3.5,
        "Male",
        "Gold",
        12.4,
        "412m away",
        "assets/blue_dog.png",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
        owner),
    Dog(
        2,
        "Miss Agnes",
        3.5,
        "Female",
        "White",
        9.6,
        "879m away",
        "assets/red_dog.png",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
        owner),
    Dog(
        3,
        "Cyrus",
        3.5,
        "Male",
        "Black",
        8.2,
        "672m away",
        "assets/yellow_dog.png",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
        owner),
    Dog(
        4,
        "Shelby",
        3.5,
        "Female",
        "Choco",
        14.9,
        "982m away",
        "assets/white_dog.png",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
        owner)
  ];
}

void main() {
  runApp(MyApp());
}

class DogCard extends StatelessWidget {
  final Dog dog;

  DogCard({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                dog.imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dog.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text("Age: ${dog.age}"),
                Text("Color: ${dog.color}"),
                Text("Distance: ${dog.distance}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DogDetailsPage extends StatelessWidget {
  final Dog dog;

  DogDetailsPage({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${dog.name}'s Details")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                dog.imageAsset,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text("Name: ${dog.name}", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text("Age: ${dog.age}"),
            SizedBox(height: 8.0),
            Text("Color: ${dog.color}"),
            SizedBox(height: 8.0),
            Text("Weight: ${dog.weight}"),
            SizedBox(height: 8.0),
            Text("Gender: ${dog.gender}"),
            SizedBox(height: 8.0),
            Text("About ${dog.name}:", style: TextStyle(fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text("${dog.description}", style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}

class DogListPage extends StatelessWidget {
  final List<Dog> dogList;

  DogListPage({required this.dogList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dogs List")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: dogList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DogDetailsPage(dog: dogList[index]),
                ),
              );
            },
            child: DogCard(dog: dogList[index]),
          );
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DogListPage(dogList: FakeDogDatabase.dogList),
    );
  }
}
