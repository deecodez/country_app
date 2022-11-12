// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromJson(jsonString);

List<CountryListModel> countryListModelFromJson(List<dynamic> str) =>
    List<CountryListModel>.from(str.map((x) => CountryListModel.fromJson(x)));

// List<CountryListModel> countryListModelFromJson(String str) => List<CountryListModel>.from(json.decode(str).map((x) => CountryListModel.fromJson(x)));

// String countryListModelToJson(List<CountryListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryListModel {
  CountryListModel({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
    this.borders,
    this.gini,
  });

  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  Status? status;
  bool? unMember;
  // Currencies? currencies;
  // Map<String, Currencies>? currencies;
  final Map<String, Currency>? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  Region? region;
  String? subregion;
  Map<String, String>? languages;
  Map<String, Translation>? translations;
  List<double>? latlng;
  bool? landlocked;
  double? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  num? population;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<Continent>? continents;
  CoatOfArms? flags;
  CoatOfArms? coatOfArms;
  StartOfWeek? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;
  List<String>? borders;
  Map<String, double>? gini;

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      CountryListModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? null
            : List<String>.from(json["tld"].map((x) => x)),
        cca2: json["cca2"] ?? "",
        ccn3: json["ccn3"] ?? "",
        cca3: json["cca3"] ?? "",
        cioc: json["cioc"] ?? "",
        independent: json["independent"] ?? false,
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        unMember: json["unMember"] ?? false,
        // currencies: json["currencies"] == null
        //     ? null
        //     : Currencies.fromJson(json["currencies"]),
        // currencies: Map.from(json["currencies"]).map(
        //     (k, v) => MapEntry<String, Currencies>(k, Currencies.fromJson(v))),
        currencies: json["currencies"] == null
            ? null
            : Map.from(json["currencies"]).map(
                (k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),

        idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"].map((x) => x)),
        altSpellings: json["altSpellings"] == null
            ? null
            : List<String>.from(json["altSpellings"].map((x) => x)),
        region:
            json["region"] == null ? null : regionValues.map![json["region"]],
        subregion: json["subregion"] ?? "",
        languages: json["languages"] == null
            ? null
            : Map.from(json["languages"])
                .map((k, v) => MapEntry<String, String>(k, v)),
        translations: json["translations"] == null
            ? null
            : Map.from(json["translations"]).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: json["latlng"] == null
            ? null
            : List<double>.from(json["latlng"].map((x) => x.toDouble())),
        landlocked: json["landlocked"] ?? false,
        area: json["area"].toDouble() ?? 0.0,
        demonyms: json["demonyms"] == null
            ? null
            : json["demonyms"] == null
                ? null
                : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"] ?? "",
        maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
        population: json["population"] ?? 0,
        fifa: json["fifa"] ?? "",
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
        timezones: json["timezones"] == null
            ? null
            : List<String>.from(json["timezones"].map((x) => x)),
        continents: json["continents"] == null
            ? null
            : List<Continent>.from(
                json["continents"].map((x) => continentValues.map![x])),
        flags:
            json["flags"] == null ? null : CoatOfArms.fromJson(json["flags"]),
        coatOfArms: json["coatOfArms"] == null
            ? null
            : CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"] == null
            ? null
            : startOfWeekValues.map![json["startOfWeek"]],
        capitalInfo: json["capitalInfo"] == null
            ? null
            : CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
        borders: json["borders"] == null
            ? null
            : List<String>.from(json["borders"].map((x) => x)),
        gini: json["gini"] == null
            ? null
            : Map.from(json["gini"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "name": name!.toJson(),
        "tld": List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": statusValues.reverse[status],
        "unMember": unMember,
        // "currencies": currencies!.toJson(),
        // "currencies": Map.from(currencies!)
        //     .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "currencies": Map.from(currencies!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),

        "idd": idd!.toJson(),
        "capital": List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings!.map((x) => x)),
        "region": regionValues.reverse[region],
        "subregion": subregion,
        "languages":
            Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": List<dynamic>.from(latlng!.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms == null ? null : demonyms!.toJson(),
        "flag": flag,
        "maps": maps!.toJson(),
        "population": population,
        "fifa": fifa,
        "car": car!.toJson(),
        "timezones": List<dynamic>.from(timezones!.map((x) => x)),
        "continents": List<dynamic>.from(
            continents!.map((x) => continentValues.reverse[x])),
        "flags": flags!.toJson(),
        "coatOfArms": coatOfArms!.toJson(),
        "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        "capitalInfo": capitalInfo!.toJson(),
        "postalCode": postalCode!.toJson(),
        "borders":
            borders == null ? null : List<dynamic>.from(borders!.map((x) => x)),
        "gini": gini == null
            ? null
            : Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class CapitalInfo {
  CapitalInfo({
    this.latlng,
  });

  List<double>? latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? null
            : List<double>.from(json["latlng"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? null : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  Car({
    this.signs,
    this.side,
  });

  List<String>? signs;
  Side? side;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? null
            : List<String>.from(json["signs"].map((x) => x)),
        side: sideValues.map![json["side"]],
      );

  Map<String, dynamic> toJson() => {
        "signs":
            signs == null ? null : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}

enum Side { left, right }

final sideValues = EnumValues({"left": Side.left, "right": Side.right});

class CoatOfArms {
  CoatOfArms({
    this.png,
    this.svg,
  });

  String? png;
  String? svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"] ?? "",
        svg: json["svg"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

enum Continent {
  northAmerica,
  asia,
  africa,
  southAmerica,
  europe,
  oceania,
  antarctica
}

final continentValues = EnumValues({
  "Africa": Continent.africa,
  "Antarctica": Continent.antarctica,
  "Asia": Continent.asia,
  "Europe": Continent.europe,
  "North America": Continent.northAmerica,
  "Oceania": Continent.oceania,
  "South America": Continent.southAmerica
});

class Currency {
  Currency({
    this.name,
    this.symbol,
  });

  final String? name;
  final String? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

// class Currencies {
//   Currencies({
//     this.name,
//     this.symbol,
//   });

//   final String? name;
//   final String? symbol;

//   factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
//         name: json["name"] ?? '',
//         symbol: json["symbol"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "symbol": symbol,
//       };
// }

// class Currencies {
//   Currencies({
//     this.bbd,
//     this.usd,
//     this.xaf,
//     this.brl,
//     this.eur,
//     this.aud,
//     this.kid,
//     this.ron,
//     this.lak,
//     this.xof,
//     this.iqd,
//     this.kes,
//     this.kyd,
//     this.gnf,
//     this.tnd,
//     this.bob,
//     this.cny,
//     this.krw,
//     this.kwd,
//     this.dzd,
//     this.awg,
//     this.rub,
//     this.dkk,
//     this.gbp,
//     this.twd,
//     this.cad,
//     this.fjd,
//     this.xpf,
//     this.pen,
//     this.clp,
//     this.egp,
//     this.mkd,
//     this.bdt,
//     this.sgd,
//     this.etb,
//     this.bsd,
//     this.tmt,
//     this.ang,
//     this.zmw,
//     this.hnl,
//     this.mad,
//     this.npr,
//     this.xcd,
//     this.omr,
//     this.hkd,
//     this.pyg,
//     this.mdl,
//     this.kgs,
//     this.mur,
//     this.btn,
//     this.inr,
//     this.yer,
//     this.imp,
//     this.dop,
//     this.ggp,
//     this.lrd,
//     this.zwl,
//     this.ugx,
//     this.vuv,
//     this.ils,
//     this.jod,
//     this.pkr,
//     this.bnd,
//     this.aed,
//     this.gel,
//     this.scr,
//     this.fkp,
//     this.gip,
//     this.sbd,
//     this.uzs,
//     this.mnt,
//     this.gyd,
//     this.bam,
//     this.top,
//     this.rwf,
//     this.bgn,
//     this.ngn,
//     this.shp,
//     this.fok,
//     this.lsl,
//     this.zar,
//     this.cve,
//     this.kpw,
//     this.cuc,
//     this.cup,
//     this.srd,
//     this.nzd,
//     this.mxn,
//     this.php,
//     this.sek,
//     this.jmd,
//     this.ves,
//     this.jep,
//     this.afn,
//     this.mop,
//     this.syp,
//     this.stn,
//     this.chf,
//     this.szl,
//     this.myr,
//     this.pln,
//     this.ssp,
//     this.khr,
//     this.lkr,
//     this.ghs,
//     this.ern,
//     this.bzd,
//     this.ttd,
//     this.ckd,
//     this.mzn,
//     this.irr,
//     this.cdf,
//     this.mvr,
//     this.mru,
//     this.czk,
//     this.byn,
//     this.all,
//     this.mwk,
//     this.sos,
//     this.rsd,
//     this.isk,
//     this.wst,
//     this.mmk,
//     this.thb,
//     this.lbp,
//     this.kzt,
//     this.tvd,
//     this.huf,
//     this.nok,
//     this.kmf,
//     this.sdg,
//     this.amd,
//     this.uyu,
//     this.sar,
//     this.bif,
//     this.uah,
//     this.sll,
//     this.bmd,
//     this.nad,
//     this.htg,
//     this.lyd,
//     this.pgk,
//     this.aoa,
//     this.idr,
//     this.ars,
//     this.pab,
//     this.jpy,
//     this.nio,
//     this.tzs,
//     this.tjs,
//     this.gtq,
//     this.bhd,
//     this.mga,
//     this.djf,
//     this.gmd,
//     this.bwp,
//     this.currenciesTry,
//     this.azn,
//     this.crc,
//     this.vnd,
//     this.hrk,
//     this.qar,
//     this.cop,
//   });

//   Aed? bbd;
//   Aed? usd;
//   Aed? xaf;
//   Aed? brl;
//   Aed? eur;
//   Aed? aud;
//   Aed? kid;
//   Aed? ron;
//   Aed? lak;
//   Aed? xof;
//   Aed? iqd;
//   Aed? kes;
//   Aed? kyd;
//   Aed? gnf;
//   Aed? tnd;
//   Aed? bob;
//   Aed? cny;
//   Aed? krw;
//   Aed? kwd;
//   Aed? dzd;
//   Aed? awg;
//   Aed? rub;
//   Aed? dkk;
//   Aed? gbp;
//   Aed? twd;
//   Aed? cad;
//   Aed? fjd;
//   Aed? xpf;
//   Aed? pen;
//   Aed? clp;
//   Aed? egp;
//   Aed? mkd;
//   Aed? bdt;
//   Aed? sgd;
//   Aed? etb;
//   Aed? bsd;
//   Aed? tmt;
//   Aed? ang;
//   Aed? zmw;
//   Aed? hnl;
//   Aed? mad;
//   Aed? npr;
//   Aed? xcd;
//   Aed? omr;
//   Aed? hkd;
//   Aed? pyg;
//   Aed? mdl;
//   Aed? kgs;
//   Aed? mur;
//   Aed? btn;
//   Aed? inr;
//   Aed? yer;
//   Aed? imp;
//   Aed? dop;
//   Aed? ggp;
//   Aed? lrd;
//   Aed? zwl;
//   Aed? ugx;
//   Aed? vuv;
//   Aed? ils;
//   Aed? jod;
//   Aed? pkr;
//   Aed? bnd;
//   Aed? aed;
//   Aed? gel;
//   Aed? scr;
//   Aed? fkp;
//   Aed? gip;
//   Aed? sbd;
//   Aed? uzs;
//   Aed? mnt;
//   Aed? gyd;
//   Bam? bam;
//   Aed? top;
//   Aed? rwf;
//   Aed? bgn;
//   Aed? ngn;
//   Aed? shp;
//   Aed? fok;
//   Aed? lsl;
//   Aed? zar;
//   Aed? cve;
//   Aed? kpw;
//   Aed? cuc;
//   Aed? cup;
//   Aed? srd;
//   Aed? nzd;
//   Aed? mxn;
//   Aed? php;
//   Aed? sek;
//   Aed? jmd;
//   Aed? ves;
//   Aed? jep;
//   Aed? afn;
//   Aed? mop;
//   Aed? syp;
//   Aed? stn;
//   Aed? chf;
//   Aed? szl;
//   Aed? myr;
//   Aed? pln;
//   Aed? ssp;
//   Aed? khr;
//   Aed? lkr;
//   Aed? ghs;
//   Aed? ern;
//   Aed? bzd;
//   Aed? ttd;
//   Aed? ckd;
//   Aed? mzn;
//   Aed? irr;
//   Aed? cdf;
//   Aed? mvr;
//   Aed? mru;
//   Aed? czk;
//   Aed? byn;
//   Aed? all;
//   Aed? mwk;
//   Aed? sos;
//   Aed? rsd;
//   Aed? isk;
//   Aed? wst;
//   Aed? mmk;
//   Aed? thb;
//   Aed? lbp;
//   Aed? kzt;
//   Aed? tvd;
//   Aed? huf;
//   Aed? nok;
//   Aed? kmf;
//   Bam? sdg;
//   Aed? amd;
//   Aed? uyu;
//   Aed? sar;
//   Aed? bif;
//   Aed? uah;
//   Aed? sll;
//   Aed? bmd;
//   Aed? nad;
//   Aed? htg;
//   Aed? lyd;
//   Aed? pgk;
//   Aed? aoa;
//   Aed? idr;
//   Aed? ars;
//   Aed? pab;
//   Aed? jpy;
//   Aed? nio;
//   Aed? tzs;
//   Aed? tjs;
//   Aed? gtq;
//   Aed? bhd;
//   Aed? mga;
//   Aed? djf;
//   Aed? gmd;
//   Aed? bwp;
//   Aed? currenciesTry;
//   Aed? azn;
//   Aed? crc;
//   Aed? vnd;
//   Aed? hrk;
//   Aed? qar;
//   Aed? cop;

//   factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
//         bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
//         usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
//         xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
//         brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
//         eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
//         aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
//         kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
//         ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
//         lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
//         xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
//         iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
//         kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
//         kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
//         gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
//         tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
//         bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
//         cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
//         krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
//         kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
//         dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
//         awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
//         rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
//         dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
//         gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
//         twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
//         cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
//         fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
//         xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
//         pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
//         clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
//         egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
//         mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
//         bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
//         sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
//         etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
//         bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
//         tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
//         ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
//         zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
//         hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
//         mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
//         npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
//         xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
//         omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
//         hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
//         pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
//         mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
//         kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
//         mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
//         btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
//         inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
//         yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
//         imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
//         dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
//         ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
//         lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
//         zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
//         ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
//         vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
//         ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
//         jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
//         pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
//         bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
//         aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
//         gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
//         scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
//         fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
//         gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
//         sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
//         uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
//         mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
//         gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
//         bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
//         top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
//         rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
//         bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
//         ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
//         shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
//         fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
//         lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
//         zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
//         cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
//         kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
//         cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
//         cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
//         srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
//         nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
//         mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
//         php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
//         sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
//         jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
//         ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
//         jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
//         afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
//         mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
//         syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
//         stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
//         chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
//         szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
//         myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
//         pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
//         ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
//         khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
//         lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
//         ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
//         ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
//         bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
//         ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
//         ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
//         mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
//         irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
//         cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
//         mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
//         mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
//         czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
//         byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
//         all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
//         mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
//         sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
//         rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
//         isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
//         wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
//         mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
//         thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
//         lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
//         kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
//         tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
//         huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
//         nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
//         kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
//         sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
//         amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
//         uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
//         sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
//         bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
//         uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
//         sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
//         bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
//         nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
//         htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
//         lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
//         pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
//         aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
//         idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
//         ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
//         pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
//         jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
//         nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
//         tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
//         tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
//         gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
//         bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
//         mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
//         djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
//         gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
//         bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
//         currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
//         azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
//         crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
//         vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
//         hrk: json["HRK"] == null ? null : Aed.fromJson(json["HRK"]),
//         qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
//         cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "BBD": bbd!.toJson(),
//         "USD": usd!.toJson(),
//         "XAF": xaf!.toJson(),
//         "BRL": brl!.toJson(),
//         "EUR": eur!.toJson(),
//         "AUD": aud!.toJson(),
//         "KID": kid!.toJson(),
//         "RON": ron!.toJson(),
//         "LAK": lak!.toJson(),
//         "XOF": xof!.toJson(),
//         "IQD": iqd!.toJson(),
//         "KES": kes!.toJson(),
//         "KYD": kyd!.toJson(),
//         "GNF": gnf!.toJson(),
//         "TND": tnd!.toJson(),
//         "BOB": bob!.toJson(),
//         "CNY": cny!.toJson(),
//         "KRW": krw!.toJson(),
//         "KWD": kwd!.toJson(),
//         "DZD": dzd!.toJson(),
//         "AWG": awg!.toJson(),
//         "RUB": rub!.toJson(),
//         "DKK": dkk!.toJson(),
//         "GBP": gbp!.toJson(),
//         "TWD": twd!.toJson(),
//         "CAD": cad!.toJson(),
//         "FJD": fjd!.toJson(),
//         "XPF": xpf!.toJson(),
//         "PEN": pen!.toJson(),
//         "CLP": clp!.toJson(),
//         "EGP": egp!.toJson(),
//         "MKD": mkd!.toJson(),
//         "BDT": bdt!.toJson(),
//         "SGD": sgd!.toJson(),
//         "ETB": etb!.toJson(),
//         "BSD": bsd!.toJson(),
//         "TMT": tmt!.toJson(),
//         "ANG": ang!.toJson(),
//         "ZMW": zmw!.toJson(),
//         "HNL": hnl!.toJson(),
//         "MAD": mad!.toJson(),
//         "NPR": npr!.toJson(),
//         "XCD": xcd!.toJson(),
//         "OMR": omr!.toJson(),
//         "HKD": hkd!.toJson(),
//         "PYG": pyg!.toJson(),
//         "MDL": mdl!.toJson(),
//         "KGS": kgs!.toJson(),
//         "MUR": mur!.toJson(),
//         "BTN": btn!.toJson(),
//         "INR": inr!.toJson(),
//         "YER": yer!.toJson(),
//         "IMP": imp!.toJson(),
//         "DOP": dop!.toJson(),
//         "GGP": ggp!.toJson(),
//         "LRD": lrd!.toJson(),
//         "ZWL": zwl!.toJson(),
//         "UGX": ugx!.toJson(),
//         "VUV": vuv!.toJson(),
//         "ILS": ils!.toJson(),
//         "JOD": jod!.toJson(),
//         "PKR": pkr!.toJson(),
//         "BND": bnd!.toJson(),
//         "AED": aed!.toJson(),
//         "GEL": gel!.toJson(),
//         "SCR": scr!.toJson(),
//         "FKP": fkp!.toJson(),
//         "GIP": gip!.toJson(),
//         "SBD": sbd!.toJson(),
//         "UZS": uzs!.toJson(),
//         "MNT": mnt!.toJson(),
//         "GYD": gyd!.toJson(),
//         "BAM": bam!.toJson(),
//         "TOP": top!.toJson(),
//         "RWF": rwf!.toJson(),
//         "BGN": bgn!.toJson(),
//         "NGN": ngn!.toJson(),
//         "SHP": shp!.toJson(),
//         "FOK": fok!.toJson(),
//         "LSL": lsl!.toJson(),
//         "ZAR": zar!.toJson(),
//         "CVE": cve!.toJson(),
//         "KPW": kpw!.toJson(),
//         "CUC": cuc!.toJson(),
//         "CUP": cup!.toJson(),
//         "SRD": srd!.toJson(),
//         "NZD": nzd!.toJson(),
//         "MXN": mxn!.toJson(),
//         "PHP": php!.toJson(),
//         "SEK": sek!.toJson(),
//         "JMD": jmd!.toJson(),
//         "VES": ves!.toJson(),
//         "JEP": jep!.toJson(),
//         "AFN": afn!.toJson(),
//         "MOP": mop!.toJson(),
//         "SYP": syp!.toJson(),
//         "STN": stn!.toJson(),
//         "CHF": chf!.toJson(),
//         "SZL": szl!.toJson(),
//         "MYR": myr!.toJson(),
//         "PLN": pln!.toJson(),
//         "SSP": ssp!.toJson(),
//         "KHR": khr!.toJson(),
//         "LKR": lkr!.toJson(),
//         "GHS": ghs!.toJson(),
//         "ERN": ern!.toJson(),
//         "BZD": bzd!.toJson(),
//         "TTD": ttd!.toJson(),
//         "CKD": ckd!.toJson(),
//         "MZN": mzn!.toJson(),
//         "IRR": irr!.toJson(),
//         "CDF": cdf!.toJson(),
//         "MVR": mvr!.toJson(),
//         "MRU": mru!.toJson(),
//         "CZK": czk!.toJson(),
//         "BYN": byn!.toJson(),
//         "ALL": all!.toJson(),
//         "MWK": mwk!.toJson(),
//         "SOS": sos!.toJson(),
//         "RSD": rsd!.toJson(),
//         "ISK": isk!.toJson(),
//         "WST": wst!.toJson(),
//         "MMK": mmk!.toJson(),
//         "THB": thb!.toJson(),
//         "LBP": lbp!.toJson(),
//         "KZT": kzt!.toJson(),
//         "TVD": tvd!.toJson(),
//         "HUF": huf!.toJson(),
//         "NOK": nok!.toJson(),
//         "KMF": kmf!.toJson(),
//         "SDG": sdg!.toJson(),
//         "AMD": amd!.toJson(),
//         "UYU": uyu!.toJson(),
//         "SAR": sar!.toJson(),
//         "BIF": bif!.toJson(),
//         "UAH": uah!.toJson(),
//         "SLL": sll!.toJson(),
//         "BMD": bmd!.toJson(),
//         "NAD": nad!.toJson(),
//         "HTG": htg!.toJson(),
//         "LYD": lyd!.toJson(),
//         "PGK": pgk!.toJson(),
//         "AOA": aoa!.toJson(),
//         "IDR": idr!.toJson(),
//         "ARS": ars!.toJson(),
//         "PAB": pab!.toJson(),
//         "JPY": jpy!.toJson(),
//         "NIO": nio!.toJson(),
//         "TZS": tzs!.toJson(),
//         "TJS": tjs!.toJson(),
//         "GTQ": gtq!.toJson(),
//         "BHD": bhd!.toJson(),
//         "MGA": mga!.toJson(),
//         "DJF": djf!.toJson(),
//         "GMD": gmd!.toJson(),
//         "BWP": bwp!.toJson(),
//         "TRY": currenciesTry!.toJson(),
//         "AZN": azn!.toJson(),
//         "CRC": crc!.toJson(),
//         "VND": vnd!.toJson(),
//         "HRK": hrk!.toJson(),
//         "QAR": qar!.toJson(),
//         "COP": cop!.toJson(),
//       };
// }

// class Aed {
//   Aed({
//     this.name,
//     this.symbol,
//   });

//   String? name;
//   String? symbol;

//   factory Aed.fromJson(Map<String, dynamic> json) => Aed(
//         name: json["name"] ?? '',
//         symbol: json["symbol"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "symbol": symbol,
//       };
// }

// class Bam {
//   Bam({
//     this.name,
//   });

//   String? name;

//   factory Bam.fromJson(Map<String, dynamic> json) => Bam(
//         name: json["name"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }

class Demonyms {
  Demonyms({
    this.eng,
    this.fra,
  });

  Eng? eng;
  Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng!.toJson(),
        "fra": fra!.toJson(),
      };
}

class Eng {
  Eng({
    this.f,
    this.m,
  });

  String? f;
  String? m;

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"] ?? '',
        m: json["m"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Idd {
  Idd({
    this.root,
    this.suffixes,
  });

  String? root;
  List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"] ?? '',
        suffixes: json["suffixes"] == null
            ? null
            : List<String>.from(json["suffixes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Maps {
  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  String? googleMaps;
  String? openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"] ?? '',
        openStreetMaps: json["openStreetMaps"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  String? common;
  String? official;
  Map<String, Translation>? nativeName;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"] ?? "",
        official: json["official"] ?? "",
        nativeName: json["nativeName"] == null
            ? null
            : Map.from(json["nativeName"]).map((k, v) =>
                MapEntry<String, Translation>(k, Translation.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Translation {
  Translation({
    this.official,
    this.common,
  });

  String? official;
  String? common;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"] ?? "",
        common: json["common"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  PostalCode({
    this.format,
    this.regex,
  });

  String? format;
  String? regex;

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"] ?? '',
        regex: json["regex"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { americas, africa, europe, oceania, asia, antarctic }

final regionValues = EnumValues({
  "Africa": Region.africa,
  "Americas": Region.americas,
  "Antarctic": Region.antarctic,
  "Asia": Region.asia,
  "Europe": Region.europe,
  "Oceania": Region.oceania
});

enum StartOfWeek { monday, sunday, saturday }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.monday,
  "saturday": StartOfWeek.saturday,
  "sunday": StartOfWeek.sunday
});

enum Status { officiallyAssigned, userAssigned }

final statusValues = EnumValues({
  "officially-assigned": Status.officiallyAssigned,
  "user-assigned": Status.userAssigned
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
