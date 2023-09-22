//
//  NewSheet.swift
//  YCForum
//
//  Created by Sonic Liu on 9/7/2023.
//

import SwiftUI

struct NewSheet: View {
    @State private var newPage = PageInfo.emptyPage
    @Binding var infos: [PageInfo]
    @Binding var isPresentingNewEditView : Bool
    var body: some View {
        NavigationStack {
            EditPage(info: $newPage)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Post") {
                            infos.append(newPage)
                            isPresentingNewEditView = false
                        }
                    }
                }
        }
    }
}

struct NewSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSheet(infos: .constant(PageInfo.sampleData), isPresentingNewEditView: .constant(true))
    }
}
