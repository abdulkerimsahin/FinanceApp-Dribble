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
        VStack {
            CardView(size: $size)
                .padding()
            
            Spacer()
        }
        .background {
            Color("Background")
                .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .readSize { size in
            self.size = size
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
