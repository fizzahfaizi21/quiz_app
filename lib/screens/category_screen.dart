import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categories = const [
    {'id': 9, 'name': 'General Knowledge', 'color': Colors.blue},
    {'id': 10, 'name': 'Books', 'color': Colors.brown},
    {'id': 11, 'name': 'Film', 'color': Colors.red},
    {'id': 12, 'name': 'Music', 'color': Colors.purple},
    {'id': 14, 'name': 'Television', 'color': Colors.orange},
    {'id': 15, 'name': 'Video Games', 'color': Colors.green},
    {'id': 17, 'name': 'Science & Nature', 'color': Colors.teal},
    {'id': 18, 'name': 'Computers', 'color': Colors.indigo},
    {'id': 21, 'name': 'Sports', 'color': Colors.pink},
    {'id': 22, 'name': 'Geography', 'color': Colors.amber},
    {'id': 23, 'name': 'History', 'color': Colors.deepOrange},
    {'id': 27, 'name': 'Animals', 'color': Colors.lightGreen},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Category',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return InkWell(
                    onTap: () {
                      // Navigate to quiz screen with selected category
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            category: category['id'] as int,
                            categoryName: category['name'] as String,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category['color'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        category['name'].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
