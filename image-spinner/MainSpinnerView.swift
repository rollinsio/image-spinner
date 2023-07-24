//
//  MainSpinnerView.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/21/23.
//

import SwiftUI

struct MainSpinnerView: View {
    @ObservedObject var viewModel: MainSpinnerViewModel = MainSpinnerViewModel()
    
    var body: some View {
        
        VStack {
            TabView {
                Group {
                    ForEach(0..<viewModel.viewModels.count,id:\.self) { i in
                        if viewModel.viewModels[i] is PulseViewModel {
                            Pulse(viewModel: viewModel.viewModels[i] as! PulseViewModel)
                                .tag(i)
                        } else if viewModel.viewModels[i] is RotateViewModel {
                            RotateView(viewModel: viewModel.viewModels[i] as! RotateViewModel)
                                .tag(i)
                        }
                    }
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
