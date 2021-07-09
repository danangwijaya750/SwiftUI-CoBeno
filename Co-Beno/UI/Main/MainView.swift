//
//  MainView.swift
//  Co-Beno
//
//  Created by Danang Wijaya on 08/07/21.
//

import Foundation
import SwiftUI
import ToastUI
struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @State var province = ""
    var body: some View{
        NavigationView{
            ZStack{
                VStack{
                    SearchBar(text: $province) { q in
                        if(!q.isEmpty){
                            viewModel.getAvailableBeds(province: q)
                        }
                    }
                        List(viewModel.availableBeds){ item in
                            RowItem(data: item)
                        }
                }
                ProgressView().isHidden(!viewModel.onLoading)
            }
            .navigationTitle("Covid-19 Bed Info")
            }
    }
}

struct RowItem: View {
    let data: BedInfo
    var body: some View{
        VStack(alignment:.leading,spacing: 5.0){
            HStack(spacing:10){
                Image(systemName: "stethoscope")
                Text(data.name).font(.headline)
            }
            HStack(spacing:10){
                Image(systemName: "location.fill")
                Text(data.address).font(.body)
            }
            HStack(spacing:10){
                Image(systemName: "bed.double.fill")
                Text("Tersedia : \(data.available_bed)").foregroundColor((data.available_bed > 0) ? .green : .red)
            }
            HStack(spacing:10){
                Image(systemName: "square.stack.3d.down.right.fill")
                Text("Antrian : \(data.bed_queue)").foregroundColor((data.bed_queue > 0) ? .green : .red)
            }
            HStack(spacing:10){
                Image(systemName: "phone.fill")
                if(data.hotline.count>0){
                    Text(data.hotline)
                }else{
                    Text("Not Available")
                }
            }
        }
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View{
        MainView()
    }
}
