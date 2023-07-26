//
//  ComplexSpinnerViewModel.swift
//  image-spinner
//
//  Created by Michael Rollins on 7/24/23.
//

import Foundation

class ChasingSpinnerViewModel: SpinnerViewModel, ObservableObject {
    @Published var width: CGFloat
    @Published var speed: Double
    var numberOfCircles: Int
    @Published var strokeWidth: CGFloat
    
    @Published var circleDegrees: [Double]
    
    init(width: CGFloat = 200, speed: Double = 1.0, numberOfCircles: Int = 2, strokeWidth: CGFloat = 15) {
        self.width = width
        self.speed = speed
        self.strokeWidth = strokeWidth
        self.numberOfCircles = numberOfCircles
        self.circleDegrees = Array(repeating: 360, count: numberOfCircles)
    }
    
    func getCode() -> String {
        return
"""
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
"""
    }
    
    func updateCircle(circleNumber: Int, value: Double) {
        objectWillChange.send()
        circleDegrees[circleNumber] = value
    }
}
