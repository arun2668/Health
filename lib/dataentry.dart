class DataEntry {
  final int id;
  final String type;
  final double liters;
  final String dateTime;
  final String remarks;

  DataEntry({
    required this.id,
    required this.type,
    required this.liters,
    required this.dateTime,
    required this.remarks,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'liters': liters,
      'dateTime': dateTime,
      'remarks': remarks,
    };
  }
}
