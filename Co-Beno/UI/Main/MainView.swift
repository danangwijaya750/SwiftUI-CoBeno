//
//  MainView.swift
//  Co-Beno
//
//  Created by Danang Wijaya on 08/07/21.
//

import Foundation
import SwiftUI

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
                        VStack{
                            Text(item.name).font(.headline)
                        }
                    }
                }
                ProgressView().isHidden(viewModel.onLoading)
                }.navigationTitle("Covid-19 Bed Info")
            }
    }
}

struct MainView_Preview: PreviewProvider {
    static var previews: some View{
        MainView()
    }
}
