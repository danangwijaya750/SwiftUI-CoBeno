//
//  ViewComponent.swift
//  Co-Beno
//
//  Created by Danang Wijaya on 08/07/21.
//

import Foundation
import SwiftUI

extension View{
    @ViewBuilder func isHidden(_ isHidden: Bool)-> some View{
        if(isHidden){
            self.hidden()
        }else{
            self
        }
    }
}
