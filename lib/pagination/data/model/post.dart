class ReqResModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;
  Support? support;

  ReqResModel(
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  );
}

class Datum {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Datum(
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  );
}

class Support {
  String? url;
  String? text;

  Support({
    required this.url,
    required this.text,
  });
}
