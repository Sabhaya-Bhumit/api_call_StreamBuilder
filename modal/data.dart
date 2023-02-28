class DataModal {
  int id;
  String title;
  String body;

  DataModal({required this.body, required this.id, required this.title});

  factory DataModal.FromMap({required Map data}) {
    return DataModal(body: data['body'], id: data['id'], title: data['title']);
  }
}
