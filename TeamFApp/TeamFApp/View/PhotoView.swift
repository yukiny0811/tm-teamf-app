//
//  CameraView.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/01.
//

import TeamFLibrary

struct PhotoView: View {
    
    @State var takePhoto = false
    
    @Binding var tabSelection: Int
    
    init(tabSelection: Binding<Int>) {
        self._tabSelection = tabSelection
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                CameraTakingView(takePhoto: $takePhoto)
                Text("タップして撮影")
                    .foregroundStyle(.white.opacity(0.3))
            }
        }
        .onTapGesture {
            takePhoto = true
            tabSelection = 3
        }
    }
}
