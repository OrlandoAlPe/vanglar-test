// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.answers,
        this.answersPerDay,
        this.questions,
        this.studyEvents,
        this.users,
    });

    Map<String, Answer> answers;
    Map<String, Map<String, int>> answersPerDay;
    List<Question> questions;
    Map<String, StudyEvent> studyEvents;
    Map<String, User> users;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        answers: Map.from(json["answers"]).map((k, v) => MapEntry<String, Answer>(k, Answer.fromJson(v))),
        answersPerDay: Map.from(json["answersPerDay"]).map((k, v) => MapEntry<String, Map<String, int>>(k, Map.from(v).map((k, v) => MapEntry<String, int>(k, v)))),
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
        studyEvents: Map.from(json["studyEvents"]).map((k, v) => MapEntry<String, StudyEvent>(k, StudyEvent.fromJson(v))),
        users: Map.from(json["users"]).map((k, v) => MapEntry<String, User>(k, User.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "answers": Map.from(answers).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "answersPerDay": Map.from(answersPerDay).map((k, v) => MapEntry<String, dynamic>(k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "studyEvents": Map.from(studyEvents).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "users": Map.from(users).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Answer {
    Answer({
        this.answer,
        this.guideId,
        this.questionId,
        this.right,
        this.studentEventId,
        this.time,
        this.timestamp,
        this.userId,
        this.extra,
        this.timeStamp,
        this.email,
    });

    String answer;
    GuideId guideId;
    int questionId;
    bool right;
    String studentEventId;
    int time;
    int timestamp;
    UserId userId;
    Extra extra;
    int timeStamp;
    String email;

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json["answer"],
        guideId: guideIdValues.map[json["guideId"]],
        questionId: json["questionId"],
        right: json["right"],
        studentEventId: json["studentEventId"],
        time: json["time"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        userId: userIdValues.map[json["userId"]],
        extra: json["extra"] == null ? null : Extra.fromJson(json["extra"]),
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "guideId": guideIdValues.reverse[guideId],
        "questionId": questionId,
        "right": right,
        "studentEventId": studentEventId,
        "time": time,
        "timestamp": timestamp == null ? null : timestamp,
        "userId": userIdValues.reverse[userId],
        "extra": extra == null ? null : extra.toJson(),
        "timeStamp": timeStamp == null ? null : timeStamp,
        "email": email == null ? null : email,
    };
}

class Extra {
    Extra({
        this.sedema,
        this.gpmass,
        this.csn,
    });

    Sedema sedema;
    Gpmass gpmass;
    Csn csn;

    factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        sedema: json["SEDEMA"] == null ? null : Sedema.fromJson(json["SEDEMA"]),
        gpmass: json["gpmass"] == null ? null : Gpmass.fromJson(json["gpmass"]),
        csn: json["CSN"] == null ? null : Csn.fromJson(json["CSN"]),
    );

    Map<String, dynamic> toJson() => {
        "SEDEMA": sedema == null ? null : sedema.toJson(),
        "gpmass": gpmass == null ? null : gpmass.toJson(),
        "CSN": csn == null ? null : csn.toJson(),
    };
}

class Csn {
    Csn({
        this.estado,
    });

    Estado estado;

    factory Csn.fromJson(Map<String, dynamic> json) => Csn(
        estado: estadoValues.map[json["estado"]],
    );

    Map<String, dynamic> toJson() => {
        "estado": estadoValues.reverse[estado],
    };
}

enum Estado { CAMPECHE, ESTADO_CAMPECHE, BAJA_CALIFORNIA, VERACRUZ }

final estadoValues = EnumValues({
    "Baja California": Estado.BAJA_CALIFORNIA,
    "CAMPECHE": Estado.CAMPECHE,
    "Campeche": Estado.ESTADO_CAMPECHE,
    "Veracruz": Estado.VERACRUZ
});

class Gpmass {
    Gpmass({
        this.admin,
        this.slide,
        this.isSuperAdmin,
    });

    Admin admin;
    Slide slide;
    bool isSuperAdmin;

    factory Gpmass.fromJson(Map<String, dynamic> json) => Gpmass(
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
        slide: Slide.fromJson(json["slide"]),
        isSuperAdmin: json["isSuperAdmin"] == null ? null : json["isSuperAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "admin": admin == null ? null : admin.toJson(),
        "slide": slide.toJson(),
        "isSuperAdmin": isSuperAdmin == null ? null : isSuperAdmin,
    };
}

class Admin {
    Admin({
        this.supervisores,
        this.campaas,
        this.turnos,
    });

    Map<String, bool> supervisores;
    Campaas campaas;
    Turnos turnos;

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        supervisores: Map.from(json["supervisores"]).map((k, v) => MapEntry<String, bool>(k, v)),
        campaas: json["campañas"] == null ? null : Campaas.fromJson(json["campañas"]),
        turnos: json["turnos"] == null ? null : Turnos.fromJson(json["turnos"]),
    );

    Map<String, dynamic> toJson() => {
        "supervisores": Map.from(supervisores).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "campañas": campaas == null ? null : campaas.toJson(),
        "turnos": turnos == null ? null : turnos.toJson(),
    };
}

class Campaas {
    Campaas({
        this.liverpoolServicios,
    });

    bool liverpoolServicios;

    factory Campaas.fromJson(Map<String, dynamic> json) => Campaas(
        liverpoolServicios: json["LIVERPOOL_SERVICIOS"],
    );

    Map<String, dynamic> toJson() => {
        "LIVERPOOL_SERVICIOS": liverpoolServicios,
    };
}

class Turnos {
    Turnos({
        this.matutino,
        this.vespertino,
    });

    bool matutino;
    bool vespertino;

    factory Turnos.fromJson(Map<String, dynamic> json) => Turnos(
        matutino: json["MATUTINO"],
        vespertino: json["VESPERTINO"],
    );

    Map<String, dynamic> toJson() => {
        "MATUTINO": matutino,
        "VESPERTINO": vespertino,
    };
}

class Slide {
    Slide({
        this.jIsraelToledoGmailCom,
        this.renecrapaudGmailCom,
        this.victorQuiroz00GmailCom,
        this.dulsinaGmailCom,
    });

    bool jIsraelToledoGmailCom;
    bool renecrapaudGmailCom;
    bool victorQuiroz00GmailCom;
    bool dulsinaGmailCom;

    factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        jIsraelToledoGmailCom: json["j¿israel¿toledo@gmail¿com"],
        renecrapaudGmailCom: json["renecrapaud@gmail¿com"] == null ? null : json["renecrapaud@gmail¿com"],
        victorQuiroz00GmailCom: json["victor¿quiroz00@gmail¿com"] == null ? null : json["victor¿quiroz00@gmail¿com"],
        dulsinaGmailCom: json["dulsina@gmail¿com"] == null ? null : json["dulsina@gmail¿com"],
    );

    Map<String, dynamic> toJson() => {
        "j¿israel¿toledo@gmail¿com": jIsraelToledoGmailCom,
        "renecrapaud@gmail¿com": renecrapaudGmailCom == null ? null : renecrapaudGmailCom,
        "victor¿quiroz00@gmail¿com": victorQuiroz00GmailCom == null ? null : victorQuiroz00GmailCom,
        "dulsina@gmail¿com": dulsinaGmailCom == null ? null : dulsinaGmailCom,
    };
}

class Sedema {
    Sedema({
        this.verificentro,
    });

    Verificentro verificentro;

    factory Sedema.fromJson(Map<String, dynamic> json) => Sedema(
        verificentro: verificentroValues.map[json["verificentro"]],
    );

    Map<String, dynamic> toJson() => {
        "verificentro": verificentroValues.reverse[verificentro],
    };
}

enum Verificentro { INSPECTOR_V3, INSPECTOR_V6, INSPECTOR_V2, INSPECTOR_V1 }

final verificentroValues = EnumValues({
    "Inspector_V1": Verificentro.INSPECTOR_V1,
    "Inspector_V2": Verificentro.INSPECTOR_V2,
    "Inspector_V3": Verificentro.INSPECTOR_V3,
    "Inspector V6": Verificentro.INSPECTOR_V6
});

enum GuideId { HSK1_EN }

final guideIdValues = EnumValues({
    "HSK1_en": GuideId.HSK1_EN
});

enum UserId { Q_UB_CB_EV4_BARZ84_PIV_UB_CZ5_GH_R_ZP2, FR1_DT_WX_GY7_Z4_O2_E_XA_BZW_SO961_UK2, A_YU1_WP_YC_NQ_PPRQ_W_MF_P8_JV_SD_SJ_I42, DXF_PFX0_F_WU_V_YKS_KDP_H_UQX3_P_U_WUB2, THE_97_H4_LT8_R_XB_PG2_Q03_PY_TL4_Q_IP5_JQ2, PY1_X_AS8_W8_J_NP_IZV_P4_WO_GDZ_DC4_J32, SS_MS_X_YZP_F_CB0_FOD4_G_TE8_D_X_IS7_Y_X2, K_O0_NMH2_GG_AN_XX3_VY9280_DR_OEV_YT2, AY2_NXHOVMCFQ_KP05_O_U7_ICQ_TJZZ_X2, D_AC_UI_IK_VC9_WG889_BN_XY_MNK_DGAC82, DTH239_HDE8_SZ_X2_OEETA1_LMUK3_T43, DL45_Q_GYM_PIFM_E6_SA_FQ_F_PR6_KUX_SX2, NFV_UIT_OVD0_P8_J_OB6_X82_NM_N_NWR_EX2, UK10_O_X2_Y_MQVO_RB9_U3_P1_IT0_B7_V_RW2, THE_5_DFH37_BG_DXF_R_XFH_QOB_F_OGW_OF_RT_V2, RMK6_ZUKZ_BAXK07_SHQ_OS_T_DOZ_ZK833, XPF3_YL98_QLA_JJ_FTDH4_V_I_XIP3_YX83, THE_5_B3_TF_YO_K3_JWL_ET_VIB_JOLLFO0_T092, THE_62_Q_MEBLH0_PB_N_OA_QM_ZN0_F_LXLC2_M_J2 }

final userIdValues = EnumValues({
    "Ay2nxhovmcfqKP05oU7ICQTjzzX2": UserId.AY2_NXHOVMCFQ_KP05_O_U7_ICQ_TJZZ_X2,
    "AYu1WpYCNqPprqWMfP8JVSdSjI42": UserId.A_YU1_WP_YC_NQ_PPRQ_W_MF_P8_JV_SD_SJ_I42,
    "dl45qGYMPifmE6saFqFPr6kuxSX2": UserId.DL45_Q_GYM_PIFM_E6_SA_FQ_F_PR6_KUX_SX2,
    "DTH239hde8SzX2Oeeta1Lmuk3t43": UserId.DTH239_HDE8_SZ_X2_OEETA1_LMUK3_T43,
    "DxfPfx0fWuVYksKdpHUqx3pUWub2": UserId.DXF_PFX0_F_WU_V_YKS_KDP_H_UQX3_P_U_WUB2,
    "dACUiIkVc9Wg889BNXyMnkDGAC82": UserId.D_AC_UI_IK_VC9_WG889_BN_XY_MNK_DGAC82,
    "FR1DTWxGy7Z4O2eXaBzwSo961Uk2": UserId.FR1_DT_WX_GY7_Z4_O2_E_XA_BZW_SO961_UK2,
    "kO0Nmh2ggANXx3vy9280drOEVYt2": UserId.K_O0_NMH2_GG_AN_XX3_VY9280_DR_OEV_YT2,
    "nfvUitOvd0P8jOb6X82NmNNwrEX2": UserId.NFV_UIT_OVD0_P8_J_OB6_X82_NM_N_NWR_EX2,
    "Py1xAs8W8jNpIzvP4woGdzDc4J32": UserId.PY1_X_AS8_W8_J_NP_IZV_P4_WO_GDZ_DC4_J32,
    "QUbCBEv4BARZ84PIVUbCz5GhRZp2": UserId.Q_UB_CB_EV4_BARZ84_PIV_UB_CZ5_GH_R_ZP2,
    "rmk6ZukzBAXK07shqOsTDozZk833": UserId.RMK6_ZUKZ_BAXK07_SHQ_OS_T_DOZ_ZK833,
    "SsMsXYzpFCb0Fod4gTE8dXIs7yX2": UserId.SS_MS_X_YZP_F_CB0_FOD4_G_TE8_D_X_IS7_Y_X2,
    "5B3tfYoK3JWLEtVibJollfo0t092": UserId.THE_5_B3_TF_YO_K3_JWL_ET_VIB_JOLLFO0_T092,
    "5dfh37BGDxfRXfhQobFOgwOfRtV2": UserId.THE_5_DFH37_BG_DXF_R_XFH_QOB_F_OGW_OF_RT_V2,
    "62qMEBLH0pbNOaQmZN0fLxlc2mJ2": UserId.THE_62_Q_MEBLH0_PB_N_OA_QM_ZN0_F_LXLC2_M_J2,
    "97H4lt8rXbPG2q03pyTL4qIp5JQ2": UserId.THE_97_H4_LT8_R_XB_PG2_Q03_PY_TL4_Q_IP5_JQ2,
    "uk10oX2yMQVORb9u3P1It0b7vRw2": UserId.UK10_O_X2_Y_MQVO_RB9_U3_P1_IT0_B7_V_RW2,
    "Xpf3YL98qlaJjFtdh4vIXip3YX83": UserId.XPF3_YL98_QLA_JJ_FTDH4_V_I_XIP3_YX83
});

class Question {
    Question({
        this.avgTime,
        this.rights,
        this.wrongs,
    });

    double avgTime;
    int rights;
    int wrongs;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        avgTime: json["avgTime"].toDouble(),
        rights: json["rights"] == null ? null : json["rights"],
        wrongs: json["wrongs"] == null ? null : json["wrongs"],
    );

    Map<String, dynamic> toJson() => {
        "avgTime": avgTime,
        "rights": rights == null ? null : rights,
        "wrongs": wrongs == null ? null : wrongs,
    };
}

class StudyEvent {
    StudyEvent({
        this.address,
        this.adminArea,
        this.count,
        this.countryCode,
        this.countryName,
        this.guideId,
        this.key,
        this.latitude,
        this.locality,
        this.longitude,
        this.postalCode,
        this.rights,
        this.subAdminArea,
        this.subLocality,
        this.totalTime,
        this.userId,
        this.wrongs,
        this.deviceId,
        this.locationServiceActive,
        this.timestamp,
    });

    String address;
    AdminArea adminArea;
    int count;
    CountryCode countryCode;
    CountryName countryName;
    GuideId guideId;
    String key;
    double latitude;
    Locality locality;
    double longitude;
    String postalCode;
    int rights;
    String subAdminArea;
    String subLocality;
    int totalTime;
    UserId userId;
    int wrongs;
    String deviceId;
    bool locationServiceActive;
    int timestamp;

    factory StudyEvent.fromJson(Map<String, dynamic> json) => StudyEvent(
        address: json["address"] == null ? null : json["address"],
        adminArea: json["adminArea"] == null ? null : adminAreaValues.map[json["adminArea"]],
        count: json["count"],
        countryCode: json["countryCode"] == null ? null : countryCodeValues.map[json["countryCode"]],
        countryName: json["countryName"] == null ? null : countryNameValues.map[json["countryName"]],
        guideId: guideIdValues.map[json["guideId"]],
        key: json["key"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        locality: json["locality"] == null ? null : localityValues.map[json["locality"]],
        longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        rights: json["rights"],
        subAdminArea: json["subAdminArea"] == null ? null : json["subAdminArea"],
        subLocality: json["subLocality"] == null ? null : json["subLocality"],
        totalTime: json["totalTime"],
        userId: userIdValues.map[json["userId"]],
        wrongs: json["wrongs"],
        deviceId: json["deviceId"] == null ? null : json["deviceId"],
        locationServiceActive: json["locationServiceActive"] == null ? null : json["locationServiceActive"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "adminArea": adminArea == null ? null : adminAreaValues.reverse[adminArea],
        "count": count,
        "countryCode": countryCode == null ? null : countryCodeValues.reverse[countryCode],
        "countryName": countryName == null ? null : countryNameValues.reverse[countryName],
        "guideId": guideIdValues.reverse[guideId],
        "key": key,
        "latitude": latitude == null ? null : latitude,
        "locality": locality == null ? null : localityValues.reverse[locality],
        "longitude": longitude == null ? null : longitude,
        "postalCode": postalCode == null ? null : postalCode,
        "rights": rights,
        "subAdminArea": subAdminArea == null ? null : subAdminArea,
        "subLocality": subLocality == null ? null : subLocality,
        "totalTime": totalTime,
        "userId": userIdValues.reverse[userId],
        "wrongs": wrongs,
        "deviceId": deviceId == null ? null : deviceId,
        "locationServiceActive": locationServiceActive == null ? null : locationServiceActive,
        "timestamp": timestamp == null ? null : timestamp,
    };
}

enum AdminArea { CIUDAD_DE_MXICO, GUANAJUATO, EMPTY, HIDALGO, COAHUILA_DE_ZARAGOZA, ESTADO_DE_MXICO, NUEVO_LEN, PANAM, VERACRUZ, BOGOT }

final adminAreaValues = EnumValues({
    "Bogotá": AdminArea.BOGOT,
    "Ciudad de México": AdminArea.CIUDAD_DE_MXICO,
    "Coahuila de Zaragoza": AdminArea.COAHUILA_DE_ZARAGOZA,
    "": AdminArea.EMPTY,
    "Estado de México": AdminArea.ESTADO_DE_MXICO,
    "Guanajuato": AdminArea.GUANAJUATO,
    "Hidalgo": AdminArea.HIDALGO,
    "Nuevo León": AdminArea.NUEVO_LEN,
    "Panamá": AdminArea.PANAM,
    "Veracruz": AdminArea.VERACRUZ
});

enum CountryCode { MX, EMPTY, PA, CO }

final countryCodeValues = EnumValues({
    "CO": CountryCode.CO,
    "": CountryCode.EMPTY,
    "MX": CountryCode.MX,
    "PA": CountryCode.PA
});

enum CountryName { MXICO, MEXICO, EMPTY, PANAMA, COLOMBIA }

final countryNameValues = EnumValues({
    "Colombia": CountryName.COLOMBIA,
    "": CountryName.EMPTY,
    "Mexico": CountryName.MEXICO,
    "México": CountryName.MXICO,
    "Panama": CountryName.PANAMA
});

enum Locality { CIUDAD_DE_MXICO, LEN, EMPTY, SAN_AGUSTN_TLAXIACA, SALTILLO, BENITO_JUREZ, NAUCALPAN_DE_JUREZ, MONTERREY, SAN_MIGUELITO, NEZAHUALCYOTL, VALENTE_DAZ, BOGOT }

final localityValues = EnumValues({
    "Benito Juárez": Locality.BENITO_JUREZ,
    "Bogotá": Locality.BOGOT,
    "Ciudad de México": Locality.CIUDAD_DE_MXICO,
    "": Locality.EMPTY,
    "León": Locality.LEN,
    "Monterrey": Locality.MONTERREY,
    "Naucalpan de Juárez": Locality.NAUCALPAN_DE_JUREZ,
    "Nezahualcóyotl": Locality.NEZAHUALCYOTL,
    "Saltillo": Locality.SALTILLO,
    "San Agustín Tlaxiaca": Locality.SAN_AGUSTN_TLAXIACA,
    "San Miguelito": Locality.SAN_MIGUELITO,
    "Valente Díaz": Locality.VALENTE_DAZ
});

class User {
    User({
        this.averageTime,
        this.numStudies,
        this.totalRights,
        this.totalStudies,
        this.totalTime,
        this.totalWrongs,
    });

    double averageTime;
    int numStudies;
    int totalRights;
    int totalStudies;
    int totalTime;
    int totalWrongs;

    factory User.fromJson(Map<String, dynamic> json) => User(
        averageTime: json["averageTime"].toDouble(),
        numStudies: json["numStudies"] == null ? null : json["numStudies"],
        totalRights: json["totalRights"],
        totalStudies: json["totalStudies"],
        totalTime: json["totalTime"],
        totalWrongs: json["totalWrongs"],
    );

    Map<String, dynamic> toJson() => {
        "averageTime": averageTime,
        "numStudies": numStudies == null ? null : numStudies,
        "totalRights": totalRights,
        "totalStudies": totalStudies,
        "totalTime": totalTime,
        "totalWrongs": totalWrongs,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
