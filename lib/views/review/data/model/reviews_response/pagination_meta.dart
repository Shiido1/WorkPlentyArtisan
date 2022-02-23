import 'package:json_annotation/json_annotation.dart';

part 'pagination_meta.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginationMeta {
  @JsonKey(name: 'current_page')
  int? currentPage;
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  int? from;
  @JsonKey(name: 'last_page')
  int? lastPage;
  @JsonKey(name: 'last_page_url')
  String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  dynamic nextPageUrl;
  String? path;
  @JsonKey(name: 'per_page')
  int? perPage;
  @JsonKey(name: 'prev_page_url')
  dynamic prevPageUrl;
  int? to;
  int? total;
  @JsonKey(name: 'can_load_more')
  bool? canLoadMore;

  PaginationMeta({
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
    this.canLoadMore,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return _$PaginationMetaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationMetaToJson(this);
}
