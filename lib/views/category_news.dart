import 'package:flutter/material.dart';
import 'package:news/views/ariticle_view.dart';
import '../helper/category_newss.dart';
import '../helper/news.dart';
import '../models/article_model.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  bool _isLoading = true;

  List<AritcleModel> categoryArticle = <AritcleModel>[];

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewss ob = CategoryNewss();
    await ob.getNews(widget.category);
    categoryArticle = ob.news;
    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: const [
            SizedBox(
              width: 65,
            ),
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'News',
              style: TextStyle(
                color: Colors.white,
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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categoryArticle.length,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (contx, index) {
                          return BlogTile(
                            imageUrl: categoryArticle[index].urlToImage,
                            title: categoryArticle[index].title,
                            description: categoryArticle[index].description,
                            url: categoryArticle[index].url,
                          );
                        }),
                  ),
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
