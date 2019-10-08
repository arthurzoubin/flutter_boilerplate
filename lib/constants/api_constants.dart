class ApiConstantItem {
  final String uriGet;
  final String uriPost;

  const ApiConstantItem({
    this.uriGet,
    this.uriPost,
  });
}

class ApiConstants {
  static final ApiConstantItem search = ApiConstantItem(
    uriGet: "search/repositories",
  );
}