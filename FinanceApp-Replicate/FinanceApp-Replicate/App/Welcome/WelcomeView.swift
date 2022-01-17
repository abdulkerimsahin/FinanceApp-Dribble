//
//  WelcomeView.swift
//  FinanceApp-Replicate
//
//  Created by Abdulkerim Sahin on 23.12.2021.
//

import SwiftUI

struct WelcomeView: View {
    @State private var size: CGSize = .zero
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ZStack(alignment: .center) {
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: Color("GradientStart"), location: 0.4),
                        .init(color: Color("GradientEnd"), location: 0.7)]), startPoint: .leading, endPoint: .trailing)
                        .mask {
                            LineShape()
                                .stroke(.white, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                        }
                    
                    CardView(size: $size)
                        .padding(.horizontal, 30)
                }
                .ignoresSafeArea(.all, edges: .top)
                .padding(.bottom, 60)
                
                bodyContent
                
                bottomButton
                
                NavigationLink("",
                               destination: Tabbar(isPresented: $isPresented),
                               isActive: $isPresented)
            }
            .background {
                Color("Background")
                    .ignoresSafeArea()
            }
            .navigationBarHidden(true)
        }
        .readSize { size in
            self.size = size
        }
    }
    
    @ViewBuilder private var bodyContent: some View {
        HStack(alignment: .top) {
            Text("Help You")
                .font(.system(size: UIFontMetrics.default.scaledValue(for: 50), weight: .medium))
            .foregroundColor(.white)
            
            StarShape()
                .fill(Color("Primary"))
                .frame(width: 60, height: 60)
        }
        .padding(.horizontal, 30)
        
        Text("Digitize Your Finances")
            .font(.system(size: UIFontMetrics.default.scaledValue(for: 50), weight: .medium))
        .lineSpacing(15)
        .foregroundColor(.white)
        .padding(.horizontal, 30)
    }
    
    @ViewBuilder private var bottomButton: some View {
        Button {
            isPresented.toggle()
        } label: {
            Text("Get Started")
                .foregroundColor(Color("Background"))
                .padding()
                .frame(maxWidth: .infinity)
        }
        .tint(Color("Secondary"))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle)
        .padding(.vertical)
        .padding(.horizontal, 30)
    }
}

struct CardView: View {
    @Binding var size: CGSize
    
    var body: some View {
        VStack {
            HStack {
                Text("Banksad")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(Color("Secondary"))
                    .padding(.leading)
                    .padding(.top)
                
                Spacer()
                
                let logoSize: CGFloat = size.width * 0.05
                Image("visa")
                    .resizable()
                    .scaledToFit()
                    .frame(height: logoSize)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .padding(.top)
            }
            .padding(.top)
            .padding(.horizontal)
            
            ArcShape()
                .stroke(Color("Primary"), lineWidth: 6)
                .padding(.horizontal)
        }
        .background {
            RoundedRectangle(cornerRadius: 30)
                .stroke(.white, lineWidth: 6)
                .background(Color("Background"))
        }
        .frame(height: size.height * 0.28)
    }
}

struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX / 4, y: rect.midY / 2))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - rect.midX / 4, y: rect.midY / 2),
                          control: CGPoint(x: rect.midX, y: rect.maxY + (rect.midY / 2)))
        
        return path
    }
}

struct StarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.minY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.midY),
                          control: CGPoint(x: rect.midX, y: rect.midY))
        
        return path
    }
}

struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let diff: CGFloat = 40
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - diff, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.maxY - diff),
                          control: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        
        let padding: CGFloat = 50
        path.move(to: CGPoint(x: rect.minX, y: rect.midY - padding))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - padding))
        
        path.move(to: CGPoint(x: rect.midX + padding, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + padding, y: rect.midY))
        
        return path
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
