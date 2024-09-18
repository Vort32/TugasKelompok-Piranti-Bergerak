import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ChatsPage(),
    StoriesPage(),
    CallsPage(),
    GalleryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _currentIndex == 0
                ? 'Chat'
                : (_currentIndex == 1
                    ? 'Stori'
                    : (_currentIndex == 2 ? 'Panggilan' : 'Galeri')),
          ),
          backgroundColor: Colors.teal,
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Stori',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Panggilan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              label: 'Galeri',
            ),
          ],
        ),
      ),
    );
  }
}

// Chats Page 1
class ChatsPage extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Ashadi',
      'time': '11:30 AM',
      'chat': 'Info mole?',
      'imgUrl':
          'https://images.pexels.com/photos/5477855/pexels-photo-5477855.jpeg?auto=compress&cs=tinysrgb&w=600'
    },
    {
      'name': 'Arianda',
      'time': '09:15 AM',
      'chat': 'Gas mole ngab',
      'imgUrl':
          'https://images.pexels.com/photos/1585634/pexels-photo-1585634.jpeg'
    },
    {
      'name': 'Bima',
      'time': '08:45 AM',
      'chat': 'Oke',
      'imgUrl':
          'https://images.pexels.com/photos/35183/people-homeless-man-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Reyy',
      'time': '10:05 PM',
      'chat': 'Oyy',
      'imgUrl':
          'https://images.pexels.com/photos/1136575/pexels-photo-1136575.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
    {
      'name': 'Wilson',
      'time': '10:05 PM',
      'chat': 'Oke2',
      'imgUrl':
          'https://images.pexels.com/photos/458381/pexels-photo-458381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image
              Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(chat['imgUrl']),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          chat['time'],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.done_all, size: 16, color: Colors.blue),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            chat['chat'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Stori Page 2
class StoriesPage extends StatelessWidget {
  final List<String> storyImages = [
    'https://images.pexels.com/photos/5477855/pexels-photo-5477855.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1585634/pexels-photo-1585634.jpeg',
    'https://picsum.photos/250?image=9',
    'https://images.pexels.com/photos/35183/people-homeless-man-male.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  final List<String> storyNames = [
    'Ashadi',
    'Arianda',
    'Bima',
    'Reyy',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  elevation: 4,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(storyImages[index]),
                    backgroundColor: Colors.grey[300],
                    onBackgroundImageError: (exception, stackTrace) {},
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  storyNames[index],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Panggilan Page 3
class CallsPage extends StatelessWidget {
  final List<Map<String, dynamic>> calls = [
    {
      'name': 'Ashadi',
      'time': 'Yesterday, 11:30 AM',
      'callType': Icons.call_received,
      'callStatusColor': Colors.red,
      'isVideoCall': false
    },
    {
      'name': 'Bima',
      'time': 'Today, 09:15 AM',
      'callType': Icons.call_made,
      'callStatusColor': Colors.green,
      'isVideoCall': true
    },
    {
      'name': 'Reyy',
      'time': 'Today, 08:45 AM',
      'callType': Icons.call_made,
      'callStatusColor': Colors.green,
      'isVideoCall': false
    },
    {
      'name': 'Arianda',
      'time': 'Yesterday, 10:05 PM',
      'callType': Icons.call_received,
      'callStatusColor': Colors.red,
      'isVideoCall': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 25,
            child: Text(
              calls[index]['name']![0],
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(calls[index]['name']!),
          subtitle: Row(
            children: [
              Icon(
                calls[index]['callType'],
                color: calls[index]['callStatusColor'],
                size: 16,
              ),
              SizedBox(width: 4),
              Text(calls[index]['time']!),
            ],
          ),
          trailing: Icon(
            calls[index]['isVideoCall']! ? Icons.videocam : Icons.call,
            color: Colors.green,
          ),
          onTap: () {},
        );
      },
    );
  }
}

// Galeri Page
class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'https://images.pexels.com/photos/28056728/pexels-photo-28056728/free-photo-of-a-table-with-several-different-types-of-food-on-it.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://picsum.photos/250?image=9',
    'https://images.pexels.com/photos/28368418/pexels-photo-28368418.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/18105/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/28410262/pexels-photo-28410262/free-photo-of-default.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/28251766/pexels-photo-28251766/free-photo-of-a-bench-in-front-of-a-window-covered-in-ivy.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/28347061/pexels-photo-28347061/free-photo-of-a-scoop-of-ice-cream-sits-on-a-table-next-to-a-magazine.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/27911165/pexels-photo-27911165/free-photo-of-coffee-aesthetic.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}