//
//  Tabbar.swift
//  FinanceApp-Replicate
//
//  Created by Abdulkerim Sahin on 26.12.2021.
//

import SwiftUI

struct Tabbar: View {
    @State private var selectedTag: Tab = .Home
    @Binding public var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTag) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    HomeView(isPresented: $isPresented)
                        .tag(tab)
                }
            }
            
            Spacer()
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        selectedTag = tab
                    } label: {
                        Image(tab.imageName(selected: selectedTag))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                    .background {
                        Circle()
                            .fill(tab == .Scan ? .black : .clear)
                    }
                }
            }
        }
        .background(.clear)
    }
    
    enum Tab: String, CaseIterable {
        case Home = "Home"
        case Activity = "Activity"
        case Scan = "Scan"
        case Wallet = "Wallet"
        case Paper = "Paper"
        
        func imageName(selected: Tab) -> String {
            if selected == .Scan {
                return self.rawValue
            }
            return self.rawValue + "\(selected == self ? "_Selected" : "")"
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar(isPresented: .constant(false))
    }
}
