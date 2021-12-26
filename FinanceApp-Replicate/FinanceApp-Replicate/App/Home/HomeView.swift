//
//  HomeView.swift
//  FinanceApp-Replicate
//
//  Created by Abdulkerim Sahin on 23.12.2021.
//

import SwiftUI

struct HomeView: View {
    @State private var size: CGSize = .zero
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("$1,200")
                                    .font(.system(.largeTitle, design: .rounded))
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.top, 40)
                                    .padding(.leading, 30)
                                
                                Spacer()
                                
                                let logoSize: CGFloat = size.width * 0.05
                                Image("visa")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: logoSize)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 30)
                                    .padding(.top)
                            }
                            .padding(.bottom)
                            
                            Text("4225 •••• •••• ••••")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.semibold)
                                .kerning(3)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                                .padding(.vertical)
                            
                            HStack {
                                Text("Debid Card")
                                    .foregroundColor(Color("GradientStart"))
                                    .font(.system(.subheadline, design: .rounded))
                                    .padding(.leading, 30)
                                    .padding(.vertical)
                                
                                Spacer()
                                
                                Text("09/24")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 30)
                                    .padding(.bottom)
                            }
                            .padding(.vertical)
                        }
                        .background(Color("Background"))
                        .cornerRadius(40)
                        .padding()
                        .layoutPriority(1000)
                        .shadow(color: Color("Background").opacity(0.5),
                                radius: 15, x: 0, y: 10)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                            
                            Image(systemName: "plus")
                                .font(.title2)
                                .padding()
                        }
                        .foregroundColor(Color("Background").opacity(0.5))
                        .padding(.trailing)
                    }
                    .frame(height: size.height * 0.35)
                    .padding(.bottom)
                    
                    HStack {
                        Button {
                            isPresented = false
                        } label: {
                            HStack {
                                Spacer()
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(Color("Background"))
                                
                                Text("Transfer")
                                    .foregroundColor(Color("Background"))
                                    .font(.title3)
                                    .padding()
                                Spacer()
                            }
                        }
                        .tint(Color("Primary"))
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                        
                        Button {
                        } label: {
                            HStack {
                                Spacer()
                                Image(systemName: "square.and.arrow.down.fill")
                                    .foregroundColor(Color("Background"))
                                
                                Text("Request")
                                    .foregroundColor(Color("Background"))
                                    .font(.title3)
                                    .padding()
                                Spacer()
                            }
                        }
                        .tint(Color("Secondary"))
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle)
                    }
                    .padding()
                    
                    Section {
                        ForEach(0..<6) { i in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .shadow(color: Color("Background").opacity(0.1),
                                            radius: 10,
                                            x: 0,
                                            y: 10)
                                
                                HStack(alignment: .top) {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(i % 2 == 0 ? Color("GradientStart") : Color("Secondary"))
                                        .scaledToFit()
                                        .padding()
                                    
                                    VStack(alignment: .leading) {
                                        Text("Dribble Premium")
                                            .foregroundColor(Color("Background"))
                                            .padding(.bottom)
                                        Text("3 Dec 2021")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.top)
                                    Spacer()
                                    Text(i % 2 == 0 ? "-$180" : "$60")
                                        .foregroundColor(i % 2 == 0 ? .red : .green)
                                        .padding(.top)
                                }
                                .padding(.horizontal)
                            }
                            .scaledToFill()
                            .padding()
                        }
                    } header: {
                        HStack {
                            Text("Recent Transactions")
                                .font(.title3.bold())
                                .foregroundColor(Color("Background"))
                                .kerning(0.5)
                            Spacer()
                            
                            Button {
                                
                            } label: {
                                Image(systemName: "ellipsis")
                                    .font(.title2.bold())
                                    .foregroundColor(Color("Background"))
                                    .padding(.vertical)
                                    .padding(.leading)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .padding(.top)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Banksad")
                    .font(.title.weight(.bold))
                    .foregroundColor(Color("Background"))
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "bell.badge")
                        .font(.system(.title3, design: .rounded))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color("Secondary"), Color("Background"))
                }

            }
        })
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = .white
            
            // Inline appearance (standard height appearance)
            UINavigationBar.appearance().standardAppearance = appearance
            // Large Title appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        .readSize { size in
            self.size = size
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView(isPresented: .constant(false))
        }
    }
}
