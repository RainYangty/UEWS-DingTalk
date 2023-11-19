//
//  API.swift
//  UDTW
//
//  Created by RainYang on 2023/8/30.
//

import Foundation

// MARK: - API
struct API: Codable {
    
    let no0, no1, no2, no3: No0
    let no4, no5, no6, no7: No0
    let no8, no9, no10, no11: No0
    let no12, no13, no14, no15: No0
    let no16, no17, no18, no19: No0
    let no20, no21, no22, no23: No0
    let no24, no25, no26, no27: No0
    let no28, no29, no30, no31: No0
    let no32, no33, no34, no35: No0
    let no36, no37, no38, no39: No0
    let no40, no41, no42, no43: No0
    let no44, no45, no46, no47: No0
    let no48, no49, no50: No0
    let md5: String

    enum CodingKeys: String, CodingKey {
        case no0 = "No0"
        case no1 = "No1"
        case no2 = "No2"
        case no3 = "No3"
        case no4 = "No4"
        case no5 = "No5"
        case no6 = "No6"
        case no7 = "No7"
        case no8 = "No8"
        case no9 = "No9"
        case no10 = "No10"
        case no11 = "No11"
        case no12 = "No12"
        case no13 = "No13"
        case no14 = "No14"
        case no15 = "No15"
        case no16 = "No16"
        case no17 = "No17"
        case no18 = "No18"
        case no19 = "No19"
        case no20 = "No20"
        case no21 = "No21"
        case no22 = "No22"
        case no23 = "No23"
        case no24 = "No24"
        case no25 = "No25"
        case no26 = "No26"
        case no27 = "No27"
        case no28 = "No28"
        case no29 = "No29"
        case no30 = "No30"
        case no31 = "No31"
        case no32 = "No32"
        case no33 = "No33"
        case no34 = "No34"
        case no35 = "No35"
        case no36 = "No36"
        case no37 = "No37"
        case no38 = "No38"
        case no39 = "No39"
        case no40 = "No40"
        case no41 = "No41"
        case no42 = "No42"
        case no43 = "No43"
        case no44 = "No44"
        case no45 = "No45"
        case no46 = "No46"
        case no47 = "No47"
        case no48 = "No48"
        case no49 = "No49"
        case no50 = "No50"
        case md5
    }
}

// MARK: - No0
struct No0: Codable {
    let type: String
    let time, location, magnitude, depth: String
    let latitude, longitude: String
}

enum TypeEnum: String, Codable {
    case reviewed = "reviewed"	
}
