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
    @Published var onLoading = true
    func getAvailableBeds(province: String){
        self.onLoading = true
        let url = "https://ina-covid-bed.vercel.app/api/bed?prov=\(province.lowercased())"
        AF.request(url)
            .responseJSON{res in
                if let json = res.value{
                    print(json)
                    if let data = json as? Response{
                        if(data.status == 200){
                            print("here")
                            self.onLoading=false
                            data.data.forEach{item in
                                self.availableBeds.append(item)
                            }
                        }
                    }
                }
            }
    }
}
