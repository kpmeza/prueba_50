import 'package:flutter/material.dart';

class RAS1 extends StatefulWidget {
  const RAS1({super.key});

  @override
  State<RAS1> createState() => _RAS1State();
}

class _RAS1State extends State<RAS1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GALERIA DE SERPIENTES',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: serpientes(),
    );
  }
}

class serpientes extends StatefulWidget {
  const serpientes({super.key});

  @override
  State<serpientes> createState() => _serpientesState();
}

class _serpientesState extends State<serpientes> {
  final List<Map<String, dynamic>> photos = [
    {
      'title': 'MANDALA VERDE',
      'description': 'colombia',
      'imageUrl':
          'https://es3y77fcmfa.exactdn.com/wp-content/uploads/2023/02/Bothriechis-lateralis-.jpg?strip=all&lossy=1&ssl=1',
    },
    {
      'title': 'NUBE DE MONTE',
      'description': 'peligro de extinción',
      'imageUrl':
          'https://nubedemonte.com/wp-content/uploads/2021/04/120766903_202628284557039_5592220530880508101_n.jpg',
    },
    {
      'title': 'SHUSHUPE',
      'description': '',
      'imageUrl':
          'https://efeverde.com/wp-content/uploads/2022/01/Mongabay-serpientes-FOTO-9.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GALERIA DE FOTOS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailsPage(photo: photo),
                      ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            photo['imageUrl'],
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
                              photo['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              photo['description'],
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class PhotoDetailsPage extends StatelessWidget {
  final Map<String, dynamic> photo;

  const PhotoDetailsPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo['title']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              photo["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              photo["description"],
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
