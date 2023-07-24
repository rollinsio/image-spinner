//
//  MainSpinnerView.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/21/23.
//

import SwiftUI

struct MainSpinnerView: View {
    
    let views = [Pulse(viewModel: PulseViewModel(imageName: "squareLogo")),
                 Pulse(viewModel: PulseViewModel(imageName: "dragon")),
                 Pulse(viewModel: PulseViewModel(imageName: "dragonFull"))
    ]
    
    var body: some View {
        
        VStack {
            TabView {
                ForEach(0..<views.count,id:\.self) { i in
                    views[i]
                        .tag(i)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
        

}

struct MainSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        MainSpinnerView()
    }
}
