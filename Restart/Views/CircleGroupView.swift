//
//  CircleGroupView.swift
//  Restart
//
//  Created by Roger Torres on 01/07/22.
//

import SwiftUI

struct CircleGroupView: View {
    @State var Shapecolor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Shapecolor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(Shapecolor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(Shapecolor: .white, ShapeOpacity: 0.2)
        }
    }
}
