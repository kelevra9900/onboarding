//
//  HomeView.swift
//  Restart
//
//  Created by Roger Torres on 01/07/22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnbiardingViewActive:Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing:20){
            // Header
            Spacer()
            ZStack {
                CircleGroupView(Shapecolor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever()
                    , value: isAnimating
                )
            }
            
            // Center
            Text("The time that leads to mastery id dependent on the intesity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            // Footer
            Spacer()
            
            Button(action: {
                playSound(sound: "success", type: "m4a")
                isOnbiardingViewActive = true
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
