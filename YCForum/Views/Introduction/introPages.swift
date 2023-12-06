//
//  introPages.swift
//  YCForum
//
//  Created by Sonic Liu on 30/11/2023.
//

import SwiftUI

struct introPages: View {
    @State private var pageIndex = 0
    private let pages: [introPageType] = introPageType.PreIntroPage
    private let dotAppearance = UIPageControl.appearance()
    @Binding var preIntro: Bool
    let defaults = UserDefaults.standard
    
    var body: some View {
        TabView(selection: $pageIndex){
            ForEach(pages) { page in
                VStack {
                    Spacer()
                    introPageView(introPage: page)
                    Spacer()
                    
                    if page == pages.last {
                        Button("Lets Go!") {
                            preIntro = false
                            defaults.set(preIntro, forKey: "preIntro")
                        }
                        .buttonStyle(.borderedProminent)

                    }
                    Spacer()
                }
                .tag(page.tag)
            }
            
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    func incrementPage() {
        pageIndex += 1
    }
}

#Preview {
    introPages(preIntro: .constant(true))
}
