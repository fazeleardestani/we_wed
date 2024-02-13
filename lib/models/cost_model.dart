class CostModel {
  String costId;
  String title;
  String description;
  String dateTime;
  int cost;

  CostModel({
    required this.costId,
    required this.title,
    this.description = '-',
    required this.dateTime,
    required this.cost,
  });

  factory CostModel.fromMap(String costId, Map<String, dynamic> data) {
    String title = data['title'];
    String description = data['description'];
    String dateTime = data['dateTime'];
    int cost = int.tryParse(data['cost'] ?? '0') ?? 0;

    return CostModel(
        costId: costId,
        title: title,
        description: description,
        cost: cost,
        dateTime: dateTime,);
  }
}
