//
//  ComplexSpinnerView.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/24/23.
//

import SwiftUI

struct ChasingSpinnerView: View {
    @ObservedObject var viewModel: ChasingSpinnerViewModel
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .trim(from: 0.01, to: 0.3)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: viewModel.strokeWidth, lineCap: .round))
                    .rotationEffect(Angle.degrees(viewModel.circleDegrees[0]), anchor: .center)
                    .frame(width: viewModel.width, height: viewModel.width)
                    .onAppear {
                        withAnimation(.easeOut(duration: viewModel.speed).repeatForever(autoreverses: false)) {
                            viewModel.updateCircle(circleNumber: 0, value: 4)
                        }
                    }
                Circle()
                    .trim(from: 0.0, to: 0.32)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: viewModel.strokeWidth, lineCap: .butt))
                    .rotationEffect(Angle.degrees(viewModel.circleDegrees[1]), anchor: .center)
                    .frame(width: viewModel.width)
                    .onAppear {
                        withAnimation(.easeInOut(duration: viewModel.speed).repeatForever(autoreverses: false)) {
                            viewModel.updateCircle(circleNumber: 1, value: 2)
                        }
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

struct ComplexSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        ChasingSpinnerView(viewModel: ChasingSpinnerViewModel())
    }
}
