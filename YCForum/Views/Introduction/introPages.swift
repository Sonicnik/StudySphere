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
    @Binding var avaliableTime: String
    @Binding var selectedSubject: Set<Subject>
    let defaults = UserDefaults.standard
    
    var body: some View {
        TabView(selection: $pageIndex){
            ForEach(pages) { page in
                VStack {
                    Spacer()
                    if page == pages[0] {
                        introPageView(introPage: page)
                        Spacer()
                        Button(NSLocalizedString("IntroPages.Next-String", comment: "Next button")) {
                            incrementPage()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                
                    if page == pages[1] {
                        TimeSelectorView(avaliableTime: $avaliableTime)
                        Spacer()
                        Button(NSLocalizedString("IntroPages.Next-String", comment: "Next button")) {
                            incrementPage()
                        }
                        .buttonStyle(.borderedProminent)
                        Spacer()
                    }
                    
                    if page == pages[2] {
                        SelectionOFSubject()
                        Spacer()
                        Button(NSLocalizedString("IntroPages.Next-String", comment: "Next button")) {
                            incrementPage()
                        }
                        
                    }
                    
                    if page == pages.last {
                        introPageView(introPage: page)
                        Spacer()
                        Button(NSLocalizedString("IntroPages.LetsGo-String", comment: "Let's Go button")) {
                            preIntro = false
                            defaults.set(preIntro, forKey: "preIntro")
                        }
                        .buttonStyle(.borderedProminent)

                    }
                    Spacer()
                }
                .tag(page.tag)
                .padding()
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
    introPages(preIntro: .constant(true), avaliableTime: .constant("1"), selectedSubject: .constant([.BM,.Biology,.CAS]))
}
