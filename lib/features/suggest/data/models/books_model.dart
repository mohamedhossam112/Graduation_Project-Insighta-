import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel {
  final String? kind;
  final int? totalItems;
  final List<Items>? items;

  BooksModel({this.kind, this.totalItems, this.items});

  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);
  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}

@JsonSerializable()
class Items {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  Items({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  final String? title;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<IndustryIdentifiers>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final String? subtitle;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.subtitle,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class IndustryIdentifiers {
  final String? type;
  final String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);
  Map<String, dynamic> toJson() => _$IndustryIdentifiersToJson(this);
}

@JsonSerializable()
class ReadingModes {
  final bool? text;
  final bool? image;

  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      _$ReadingModesFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}

@JsonSerializable()
class PanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);
}

@JsonSerializable()
class ImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}

@JsonSerializable()
class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice? listPrice;
  final ListPrice? retailPrice;
  final String? buyLink;
  final List<Offers>? offers;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}

@JsonSerializable()
class Offers {
  final int? finskyOfferType;
  final ListPrice? listPrice;
  final ListPrice? retailPrice;

  Offers({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);
  Map<String, dynamic> toJson() => _$OffersToJson(this);
}

@JsonSerializable()
class ListPrice {
  final double? amount;
  final int? amountInMicros;
  final String? currencyCode;

  ListPrice({
    this.amount,
    this.amountInMicros,
    this.currencyCode,
  });

  factory ListPrice.fromJson(Map<String, dynamic> json) =>
      _$ListPriceFromJson(json);
  Map<String, dynamic> toJson() => _$ListPriceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final Epub? epub;
  final Epub? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);
}

@JsonSerializable()
class Epub {
  final bool? isAvailable;
  final String? acsTokenLink;

  Epub({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);
  Map<String, dynamic> toJson() => _$EpubToJson(this);
}

@JsonSerializable()
class SearchInfo {
  final String? textSnippet;

  SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);
}
