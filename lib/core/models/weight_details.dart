class WeightDetails {
  String id;
  final double weight;
  final String dateAdded;
  final List<Map> modifications;

  WeightDetails({
    this.id,
    this.weight,
    this.dateAdded,
    this.modifications,
  });

  factory WeightDetails.fromJson(Map<String, dynamic> map) {
    return WeightDetails(
      weight: map["weight"],
      dateAdded: map["dateAdded"],
      modifications: map["modifications"] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "weight": weight,
      "dateAdded": dateAdded,
      "modificationDates": modifications,
    };
  }
}
