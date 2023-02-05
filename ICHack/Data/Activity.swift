//
//  Activity.swift
//  ICHack
//
//  Created by Artemy on 05/02/2023.
//  Copyright © 2023 artemiy. All rights reserved.
//

import ActivityIndicatorView
import SwiftUI

struct ContentView2: View {
    
    @State var loading = true
    
    var body: some View {
        NavigationView {
            VStack {
                ActivityIndicatorView(isVisible: $loading,
                    type: .growingArc(.red, lineWidth: 4))
                .frame(width: 15, height: 15, alignment: .center)
            }
        }
    }
    
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
