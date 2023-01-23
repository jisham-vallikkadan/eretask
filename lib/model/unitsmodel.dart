class Unitporducr{

  int? id;
  int?prize;
  int?offerprize;
  Unitporducr({
    this.id,
    this.prize,
    this.offerprize
});
  factory Unitporducr.fromJson(Map<String, dynamic> response) {
    return Unitporducr(
    id: response['id'],
      offerprize: response['price'],
      prize: response['offerprice'],
    );

  }
}