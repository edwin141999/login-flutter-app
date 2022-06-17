import 'dart:convert';

PetItemInfo petItemInfoFromJson(String str) => PetItemInfo.fromJson(json.decode(str));

String petItemInfoToJson(PetItemInfo data) => json.encode(data.toJson());

class PetItemInfo {
    PetItemInfo({
        required this.code,
        required this.globalMessage,
        required this.dtoPetTaxonomies,
    });

    bool code;
    String globalMessage;
    List<DtoPetTaxonomy> dtoPetTaxonomies;

    factory PetItemInfo.fromJson(Map<String, dynamic> json) => PetItemInfo(
        code: json["code"],
        globalMessage: json["globalMessage"],
        dtoPetTaxonomies: List<DtoPetTaxonomy>.from(json["dtoPetTaxonomies"].map((x) => DtoPetTaxonomy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "globalMessage": globalMessage,
        "dtoPetTaxonomies": List<dynamic>.from(dtoPetTaxonomies.map((x) => x.toJson())),
    };
}

class DtoPetTaxonomy {
    DtoPetTaxonomy({
        required this.pet,
    });

    List<Pet> pet;

    factory DtoPetTaxonomy.fromJson(Map<String, dynamic> json) => DtoPetTaxonomy(
        pet: List<Pet>.from(json["pet"].map((x) => Pet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pet": List<dynamic>.from(pet.map((x) => x.toJson())),
    };
}

class Pet {
    Pet({
        required this.pet,
        required this.detallePets,
    });

    String pet;
    List<DetallePet> detallePets;

    factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        pet: json["pet"],
        detallePets: List<DetallePet>.from(json["detallePets"].map((x) => DetallePet.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pet": pet,
        "detallePets": List<dynamic>.from(detallePets.map((x) => x.toJson())),
    };
}

class DetallePet {
    DetallePet({
        required this.item,
    });

    String item;

    factory DetallePet.fromJson(Map<String, dynamic> json) => DetallePet(
        item: json["item"],
    );

    Map<String, dynamic> toJson() => {
        "item": item,
    };
}
