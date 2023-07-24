//
//  SquarePulse.swift
//  employee-directory
//
//  Created by Michael Rollins on 7/18/23.
//

// This is simply a fun little loading animation. I was really close to making
// it Jack's face, but I thought maybe that would be one bridge too far. I can
// pretty much assure you that if you used Steve Jobs as a loading animation
// for an Apple take-home they would very much not be happy.
// If you've gotten this far, remind me to tell you about how Flurry leaked the
// iPad and Steve personally gave our CEO a phone call, then banned all
// analytics SDKs for a few months. Those times were lit!

import SwiftUI

struct Pulse: View {
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
        Pulse(viewModel: viewModel)
    }
}
