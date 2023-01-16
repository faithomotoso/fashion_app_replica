class Comment {
  late int _id;
  late String _body;

  int get id => _id;
  String get body => _body;

  Comment.fromJson({required Map<String, dynamic> json}) {
    this._id = json["id"];
    this._body = json["body"];
  }
}