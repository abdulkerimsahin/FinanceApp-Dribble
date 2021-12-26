//
//  Tabbar.swift
//  FinanceApp-Replicate
//
//  Created by Abdulkerim Sahin on 26.12.2021.
//

import SwiftUI

struct Tabbar: View {
    @State private var selectedTag = 0
    @State private var isPresented = false
    
    var body: some View {
        TabView(selection: $selectedTag) {
            ForEach(0..<5) { index in
                HomeView(isPresented: $isPresented)
                    .tabItem {
                        tabImage(for: index)
                    }
                    .tag(index)
            }
        }
    }
    
    private func tabImage(for index: Int) -> Image {
        let tabImages = [Image("Home"), Image("Activity"), Image("Scan"), Image("Wallet"), Image("Paper")]
        
        let selectedTabImages = [Image("Home_Selected"), Image("Activity_Selected"), Image("Scan"), Image("Wallet_Selected"), Image("Paper_Selected")]
        
        return selectedTag == index ? selectedTabImages[index] : tabImages[index]
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
