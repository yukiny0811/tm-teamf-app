//
//  ContentView.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

import TeamFLibrary

struct ContentView: View {
    
    @State var tabSelection = 1
    @Query var waitingPhotos: [Photo]
    
    var body: some View {
        TabView(selection: $tabSelection) {
            
            HaikuMapView()
                .tabItem {
                    Image(systemSymbol: .map)
                }
                .tag(1)
            
            PhotoView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemSymbol: .camera)
                }
                .tag(2)
            
            QueueView()
                .tabItem {
                    Image(systemSymbol: .gearshape2Fill)
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemSymbol: .person)
                }
                .tag(4)
        }
    }
}

#Preview {
    ContentView()
}
