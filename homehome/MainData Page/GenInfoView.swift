//
//  GenInfoView.swift
//  homehome
//
//  Created by Evangeline Jing on 8/29/22.
//  Description: Main Page View, Background View + Front View
//

import SwiftUI

struct GenInfoView: View {
    var body: some View {
        VStack{
            ZStack{
                GenInfoBack()
                GenInfoData()
            }
        }
    }
}

struct GenInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GenInfoView()
    }
}
