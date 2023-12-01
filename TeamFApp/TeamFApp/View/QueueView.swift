//
//  QueueView.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary

struct QueueView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var waitingPhotos: [Photo]
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(waitingPhotos) { photo in
                    if let processedData = photo.processedData {
                        NavigationLink {
                            HaikuPostView(vc: HaikuPostViewController(photo: photo))
                        } label: {
                            Image(uiImage: processedData.jpeg()!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .padding(.vertical, 30)
                        }
                    } else {
                        ZStack {
                            Image(uiImage: photo.rawData.jpeg()!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .padding(.vertical, 30)
                            ActivityIndicator()
                        }
                    }
                }
            }
            .navigationTitle("生成キュー")
        }
    }
}
