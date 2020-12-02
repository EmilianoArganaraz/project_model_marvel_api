// To parse this JSON data, do
//
//     final comicModel = comicModelFromJson(jsonString);

import 'dart:convert';

ComicModel comicModelFromJson(String str) => ComicModel.fromJson(json.decode(str));

String comicModelToJson(ComicModel data) => json.encode(data.toJson());

class ComicModel {
    ComicModel({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.data,
        this.etag,
    });

    int code;
    String status;
    String copyright;
    String attributionText;
    String attributionHtml;
    Data data;
    String etag;

    factory ComicModel.fromJson(Map<String, dynamic> json) => ComicModel(
        code: json['code'],
        status: json['status'],
        copyright: json['copyright'],
        attributionText: json['attributionText'],
        attributionHtml: json['attributionHTML'],
        data: Data.fromJson(json['data']),
        etag: json['etag'],
    );

    Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'copyright': copyright,
        'attributionText': attributionText,
        'attributionHTML': attributionHtml,
        'data': data.toJson(),
        'etag': etag,
    };
}

class Data {
    Data({
        this.offset,
        this.limit,
        this.total,
        this.count,
        this.results,
    });

    int offset;
    int limit;
    int total;
    int count;
    List<Result> results;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json['offset'],
        limit: json['limit'],
        total: json['total'],
        count: json['count'],
        results: List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.digitalId,
        this.title,
        this.issueNumber,
        this.variantDescription,
        this.description,
        this.modified,
        this.isbn,
        this.upc,
        this.diamondCode,
        this.ean,
        this.issn,
        this.format,
        this.pageCount,
        this.textObjects,
        this.resourceUri,
        this.urls,
        this.series,
        this.variants,
        this.collections,
        this.collectedIssues,
        this.dates,
        this.prices,
        this.thumbnail,
        this.images,
        this.creators,
        this.characters,
        this.stories,
        this.events,
    });

    int id;
    int digitalId;
    String title;
    double issueNumber;
    String variantDescription;
    String description;
    String modified;
    String isbn;
    String upc;
    String diamondCode;
    String ean;
    String issn;
    String format;
    int pageCount;
    List<TextObject> textObjects;
    String resourceUri;
    List<Url> urls;
    Series series;
    List<Series> variants;
    List<Series> collections;
    List<Series> collectedIssues;
    List<Date> dates;
    List<Price> prices;
    Thumbnail thumbnail;
    List<Thumbnail> images;
    Characters creators;
    Characters characters;
    Stories stories;
    Events events;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'],
        digitalId: json['digitalId'],
        title: json['title'],
        issueNumber: json['issueNumber']?.toDouble(),
        variantDescription: json['variantDescription'],
        description: json['description'],
        modified: json['modified'],
        isbn: json['isbn'],
        upc: json['upc'],
        diamondCode: json['diamondCode'],
        ean: json['ean'],
        issn: json['issn'],
        format: json['format'],
        pageCount: json['pageCount'],
        textObjects: List<TextObject>.from(json['textObjects'].map((x) => TextObject.fromJson(x))),
        resourceUri: json['resourceURI'],
        urls: List<Url>.from(json['urls'].map((x) => Url.fromJson(x))),
        series: Series.fromJson(json['series']),
        variants: List<Series>.from(json['variants'].map((x) => Series.fromJson(x))),
        collections: List<Series>.from(json['collections'].map((x) => Series.fromJson(x))),
        collectedIssues: List<Series>.from(json['collectedIssues'].map((x) => Series.fromJson(x))),
        dates: List<Date>.from(json['dates'].map((x) => Date.fromJson(x))),
        prices: List<Price>.from(json['prices'].map((x) => Price.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json['thumbnail']),
        images: List<Thumbnail>.from(json['images'].map((x) => Thumbnail.fromJson(x))),
        creators: Characters.fromJson(json['creators']),
        characters: Characters.fromJson(json['characters']),
        stories: Stories.fromJson(json['stories']),
        events: Events.fromJson(json['events']),
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'digitalId': digitalId,
        'title': title,
        'issueNumber': issueNumber,
        'variantDescription': variantDescription,
        'description': description,
        'modified': modified,
        'isbn': isbn,
        'upc': upc,
        'diamondCode': diamondCode,
        'ean': ean,
        'issn': issn,
        'format': format,
        'pageCount': pageCount,
        'textObjects': List<dynamic>.from(textObjects.map((x) => x.toJson())),
        'resourceURI': resourceUri,
        'urls': List<dynamic>.from(urls.map((x) => x.toJson())),
        'series': series.toJson(),
        'variants': List<dynamic>.from(variants.map((x) => x.toJson())),
        'collections': List<dynamic>.from(collections.map((x) => x.toJson())),
        'collectedIssues': List<dynamic>.from(collectedIssues.map((x) => x.toJson())),
        'dates': List<dynamic>.from(dates.map((x) => x.toJson())),
        'prices': List<dynamic>.from(prices.map((x) => x.toJson())),
        'thumbnail': thumbnail.toJson(),
        'images': List<dynamic>.from(images.map((x) => x.toJson())),
        'creators': creators.toJson(),
        'characters': characters.toJson(),
        'stories': stories.toJson(),
        'events': events.toJson(),
    };
}

class Characters {
    Characters({
        this.available,
        this.returned,
        this.collectionUri,
        this.items,
    });

    int available;
    int returned;
    String collectionUri;
    List<CharactersItem> items;

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<CharactersItem>.from(json['items'].map((x) => CharactersItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class CharactersItem {
    CharactersItem({
        this.resourceUri,
        this.name,
        this.role,
    });

    String resourceUri;
    String name;
    String role;

    factory CharactersItem.fromJson(Map<String, dynamic> json) => CharactersItem(
        resourceUri: json['resourceURI'],
        name: json['name'],
        role: json['role'],
    );

    Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
        'role': role,
    };
}

class Series {
    Series({
        this.resourceUri,
        this.name,
    });

    String resourceUri;
    String name;

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json['resourceURI'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
    };
}

class Date {
    Date({
        this.type,
        this.date,
    });

    String type;
    String date;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json['type'],
        date: json['date'],
    );

    Map<String, dynamic> toJson() => {
        'type': type,
        'date': date,
    };
}

class Events {
    Events({
        this.available,
        this.returned,
        this.collectionUri,
        this.items,
    });

    int available;
    int returned;
    String collectionUri;
    List<Series> items;

    factory Events.fromJson(Map<String, dynamic> json) => Events(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<Series>.from(json['items'].map((x) => Series.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Thumbnail {
    Thumbnail({
        this.path,
        this.extension,
    });

    String path;
    String extension;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json['path'],
        extension: json['extension'],
    );

    Map<String, dynamic> toJson() => {
        'path': path,
        'extension': extension,
    };
}

class Price {
    Price({
        this.type,
        this.price,
    });

    String type;
    double price;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json['type'],
        price: json['price']?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        'type': type,
        'price': price,
    };
}

class Stories {
    Stories({
        this.available,
        this.returned,
        this.collectionUri,
        this.items,
    });

    int available;
    int returned;
    String collectionUri;
    List<StoriesItem> items;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<StoriesItem>.from(json['items'].map((x) => StoriesItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class StoriesItem {
    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    String resourceUri;
    String name;
    String type;

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json['resourceURI'],
        name: json['name'],
        type: json['type'],
    );

    Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
        'type': type,
    };
}

class TextObject {
    TextObject({
        this.type,
        this.language,
        this.text,
    });

    String type;
    String language;
    String text;

    factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json['type'],
        language: json['language'],
        text: json['text'],
    );

    Map<String, dynamic> toJson() => {
        'type': type,
        'language': language,
        'text': text,
    };
}

class Url {
    Url({
        this.type,
        this.url,
    });

    String type;
    String url;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json['type'],
        url: json['url'],
    );

    Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
    };
}
