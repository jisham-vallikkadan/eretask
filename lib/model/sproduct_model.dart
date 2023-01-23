class Sproducts {
  int? sproductsid;
  int? shopid;
  String? name;
  String? desc;
  Sproducts({this.name, this.desc, this.shopid, this.sproductsid});
  factory Sproducts.fromJson(Map<String, dynamic> response) {
    return Sproducts(
        name: response['name'],
        desc: response['desc'],
        shopid: response['shopid'],
        sproductsid: response['id']);
  }
}
