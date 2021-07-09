//
//  MainViewModel.swift
//  Co-Beno
//
//  Created by Danang Wijaya on 08/07/21.
//

import Foundation
import Alamofire

class MainViewModel: ObservableObject {
    @Published var availableBeds = [BedInfo]()
    @Published var onLoading = false
    @Published var isError = ""
    func getAvailableBeds(province: String){
        self.onLoading = true
        let url = "https://ina-covid-bed.vercel.app/api/bed?prov=\(province.lowercased())"
        AF.request(url)
            .responseJSON{res in
                if let json = res.value{
                    print(json)
                    if let data = json as? Dictionary<String, AnyObject?>{
                        if let responseCode = data["status"] as? Int, let items = data["data"] as? Array<Dictionary<String,AnyObject?>>{
                            if responseCode==200{
                                self.isError=""
                                self.onLoading=false
                                items.forEach{item in
                                    self.availableBeds
                                        .append(BedInfo(name: (item["name"] as? String)!, address: (item["address"] as? String)!, available_bed: (item["available_bed"] as? Int)!, bed_queue: (item["bed_queue"] as? Int)!, hotline: (item["hotline"] as? String)!, bed_detail_link: (item["bed_detail_link"] as? String)!, hospital_code: (item["hospital_code"] as? String)!, updated_at_minutes: (item["updated_at_minutes"] as? Int)!, lat: (item["lat"] as? String)!, lon: (item["lon"] as? String)!))
                                }
                            }
                            
                        }
                    }
                }
            }
    }
}
