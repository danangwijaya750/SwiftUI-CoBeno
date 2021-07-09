//
//  BedInfo.swift
//  Co-Beno
//
//  Created by Danang Wijaya on 08/07/21.
//

import Foundation


struct Response: Identifiable {
    let id = UUID()
    let status: Int
    let data: [BedInfo]
}

struct BedInfo: Identifiable, Codable {
    var id = UUID()
    let name: String
    let address: String
    let available_bed: Int
    let bed_queue: Int
    let hotline: String
    let bed_detail_link: String
    let hospital_code: String
    let updated_at_minutes: Int
    let lat: String
    let lon: String
}

