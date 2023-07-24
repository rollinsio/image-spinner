//
//  IntermittentRotateView.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/24/23.
//

import SwiftUI

struct IntermittentRotateView: View {
    @ObservedObject var viewModel: IntermittentRotateViewModel
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(viewModel.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(
                    Angle.degrees(viewModel.degrees),
                    anchor: .center)
                .frame(width: viewModel.width, height: viewModel.width)
                .onAppear {
                    withAnimation(
                        .easeInOut(duration: viewModel.speed)
                        .repeatForever(autoreverses: false)) {
                            viewModel.degrees = 1
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

struct IntermittentRotateView_Previews: PreviewProvider {
    static var previews: some View {
        IntermittentRotateView(viewModel: IntermittentRotateViewModel(imageName: "squareLogo"))
    }
}
