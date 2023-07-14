class News {

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  News(
      {
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  factory News.fromJson(Map<String, dynamic> json) {
   return News (
    author : json['author']as dynamic,
    title : json['title']as dynamic,
    description : json['description']as dynamic,
    url : json['url']as String,
    urlToImage : json['urlToImage']as dynamic,
    publishedAt : json['publishedAt']as dynamic,
    content : json['content']as dynamic,
   );
  }

}