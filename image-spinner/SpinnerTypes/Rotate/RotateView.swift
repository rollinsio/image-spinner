//
//  RotateView.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/24/23.
//

import SwiftUI

struct RotateView: View {
    @ObservedObject var viewModel: RotateViewModel
    @State var showSheet: Bool = false
    
    init(viewModel: RotateViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(Angle.degrees(viewModel.degrees), anchor: .center)
                .frame(width: viewModel.width, height: viewModel.width)
                .onAppear {
                    withAnimation(.linear(duration: viewModel.speed).repeatForever(autoreverses: false)) {
                        viewModel.degrees = 1.truncatingRemainder(dividingBy: 360)
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

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView(viewModel: RotateViewModel(imageName: "dragon"))
    }
}
