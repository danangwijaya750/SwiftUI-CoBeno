//
//  SearchBarComponent.swift
//  Co-Beno
//
//  Created by Danang Wijaya on 08/07/21.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
       var onSearchButtonClicked: (String)->Void

       class Coordinator: NSObject, UISearchBarDelegate {

           let control: SearchBar

           init(_ control: SearchBar) {
               self.control = control
           }

           func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
               control.text = searchText
           }

           func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            control.onSearchButtonClicked(searchBar.text ?? "")
           }
       }

       func makeCoordinator() -> Coordinator {
           return Coordinator(self)
       }

       func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
           let searchBar = UISearchBar(frame: .zero)
           searchBar.delegate = context.coordinator
           return searchBar
       }
       func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
           uiView.text = text
       }
}
