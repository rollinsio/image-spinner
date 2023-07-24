//
//  SquarePulse.swift
//  employee-directory
//
//  Created by Michael Rollins on 7/18/23.
//

import SwiftUI

struct PulseView: View {
    @ObservedObject var viewModel: PulseViewModel
    @State var showSheet: Bool = false
    
    init(viewModel: PulseViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: viewModel.width, height: viewModel.width)
                .onAppear {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(viewModel.speed)) {
                        viewModel.width = viewModel.minWidth
                    }
                }
            Spacer()
            Button(action: {
                self.showSheet.toggle()
            }) {
                Text("Show Code")
            }
            .sheet(isPresented: $showSheet) {
                Text(viewModel.getCode())
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
            }
        }
    }
}

struct SquarePulse_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PulseViewModel(imageName: "squareLogo")
        PulseView(viewModel: viewModel)
    }
}
