import 'package:flutter/material.dart';
import 'blog.dart';

class AddBlogScreen extends StatefulWidget {
  AddBlogScreen({Key? key}) : super(key: key);

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Blog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: contentController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Content",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Image URL",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  addNewNote();
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addNewNote() {
    String title = titleController.text;
    String content = contentController.text;
    String imageUrl = imageUrlController.text;

    final blog = Blog(
      title: title,
      content: content,
      imageUrl: imageUrl,
    );

    Navigator.pop(context, blog);
  }
}