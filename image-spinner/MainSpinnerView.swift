//
//  MainSpinnerView.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/21/23.
//

import SwiftUI

struct MainSpinnerView: View {
    @ObservedObject var viewModel = PulseViewModel(imageName: "squareLogo")
    @State var showSheet: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                Pulse(viewModel: viewModel)
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.9)
                
                Button(action: {
                    self.showSheet.toggle()
                }) {
                    Text("Show Code")
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1)
            }
            .sheet(isPresented: $showSheet) {
                Text(viewModel.getCode())
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
        }
    }
        

}

struct MainSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        MainSpinnerView()
    }
}
