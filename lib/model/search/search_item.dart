import 'package:flutter_boilerplate/model/github/gihub_user.dart';

class SearchItem {
  final String fullName;
  final String htmlUrl;
  final GithubUser owner;

  const SearchItem({
    this.fullName,
    this.htmlUrl,
    this.owner,
  });

  static SearchItem fromJson(dynamic json) {
    return SearchItem(
      fullName: json["full_name"] as String,
      htmlUrl: json["html_url"] as String,
      owner: GithubUser.fromJson(json["owner"]),
    );
  }
}