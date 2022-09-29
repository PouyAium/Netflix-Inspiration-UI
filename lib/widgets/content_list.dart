import 'package:flutter/material.dart';
import 'package:netflix_clone_app_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    required this.isOriginal,
  }) : super(key: key);

  final String title;
  final List<Content> contentList;
  final bool isOriginal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: isOriginal ? 550.0 : 220.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: contentList.length,
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return InkWell(
                  onTap: () => debugPrint(content.name),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginal ? 400.0 : 200.0,
                    width: isOriginal ? 200.0 : 130.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(content.imageUrl),
                      ),
                    ),
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
