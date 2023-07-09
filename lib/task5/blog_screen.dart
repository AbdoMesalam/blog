import 'package:flutter/material.dart';

import 'add_blog_screen.dart';
import 'blog.dart';
import 'edit_blog_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final String imageUrl =
      "https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt9255d042edec1bad/639f61cb9428ff65477f011a/messi12.jpg?auto=webp&format=pjpg&width=3840&quality=60";

  final String name = "Abdo Mesalam";

  List<Blog> blogs = [
    Blog(
      title: "بايدن لأردوغان: ينبغي الترحيب بالسويد في الناتو بأقرب وقت",
      content:
      "قال البيت الأبيض في بيان يوم الأحد إن الرئيس الأميركي جو بايدن عبّر في مكالمة هاتفية مع نظيره التركي رجب طيب أردوغان عن رغبته في الترحيب بالسويد عضوا في حلف شمال الأطلسي في أقرب وقت ممكن.",
      imageUrl:
      "https://images.skynewsarabia.com/images/v1/2023/07/10/1635725/1200/675/1-1635725.jpg",
    ), // 0
    Blog(
      title: "المغرب ومصر إلى أولمبياد باريس 2024.. تفاصيل البطولة",
      content:
      "ضمن منتخبا المغرب ومصر لكرة القدم، الوصول إلى أولمبياد باريس 2024، بعد تأهلهما لنهائي بطولة كأس أمم إفريقيا تحت 23 عاما، للمشاركة في منافسات كرة القدم، التي لطالما حملت طعما خاصا.",
      imageUrl:
      "https://images.skynewsarabia.com/images/v1/2023/07/09/1635684/1200/675/1-1635684.jpg",
    ), // 1
    Blog(
      title: "مصر.. تطوير حديقتي الحيوان والأورمان وخطة للسلالات النادرة",
      content:
      "بدأت أعمال التطوير في حديقتي الحيوان والأورمان في مصر، الأربعاء، مع وجود خطة للحفاظ على السلالات ‏النادرة داخلهما تحت إشراف فريق من جنسيات أجنبية مختلفة، لمنع تعرضها لأي طوارئ خلال فترة ‏إغلاقها، وفقا لتصريحات تريزا لبيب، استشاري الحدائق التاريخية في مصر، لموقع سكاي نيوز عربية.‏",
      imageUrl:
      "https://images.skynewsarabia.com/images/v1/2023/07/09/1635708/1200/675/1-1635708.jpeg",
    ), // 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddBlogScreen(),
        backgroundColor: blogs.length < 2 ? Colors.black : Colors.white,
        child: Icon(
          Icons.add,
          color: blogs.length < 2 ? Colors.blue : Colors.green,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 121,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>(),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            const CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.white,
                            ),
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(name.length > 7
                            ? "${name.substring(0, 7)}..."
                            : name),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return blogItem(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget blogItem(int index) {
    final blog = blogs[index];

    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueAccent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            child: Image.network(
              blog.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  onPressed: () => navigateToEditBlogScreen(index),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black54,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blogs.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              blog.content,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  navigateToAddBlogScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBlogScreen(),
      ),
    ).then((value) {
      print(value);
      blogs.add(value);
      setState(() {});
    });
  }

  navigateToEditBlogScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBlogScreen(
          title: blogs[index].title,
          content: blogs[index].content,
          imageUrl: blogs[index].imageUrl,
        ),
      ),
    ).then((value) {
      print(value);
      // blogs.add(value);
      blogs[index] = value;
      setState(() {});
    });
  }
}