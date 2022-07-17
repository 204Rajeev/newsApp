import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/views/ariticle_view.dart';
import 'package:news/views/category_news.dart';
import '../helper/data.dart';
import '../helper/news.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<AritcleModel> ariticles = <AritcleModel>[];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News ob = News();
    await ob.getNews();
    ariticles = ob.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      //categories of news
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (ctx, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              CategoryName: categories[index].CategoryName,
                            );
                          },
                        ),
                      ),

                      //Blogs

                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: ariticles.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (contx, index) {
                              return BlogTile(
                                imageUrl: ariticles[index].urlToImage,
                                title: ariticles[index].title,
                                description: ariticles[index].description,
                                url: ariticles[index].url,
                              );
                            }),
                      ),
                    ],
                  )),
            ),
    );
  }
}

//widgets below -------------------------------------------------------------------------------------------------->

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, this.imageUrl, this.CategoryName})
      : super(key: key);
  final imageUrl;
  final CategoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => CategoryNews(
                      category: CategoryName.toString().toLowerCase(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                width: 120,
                height: 60,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              width: 120,
              height: 60,
              child: Text(
                CategoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  BlogTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.url,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => ArticleView(
                      BlogUrl: url,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 26),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(height: 5),
            Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text(description,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
