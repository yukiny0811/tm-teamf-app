//
//  HaikuMapView.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary

struct HaikuMapView: View {
    
    @State var selectedPost: Post?
    
    @Environment(\.modelContext) var modelContext
    @Query var posts: [Post]
    
    var body: some View {
        Map {
            ForEach(posts) { post in
                UserAnnotation()
                Annotation(coordinate: .init(latitude: post.lat, longitude: post.lon)) {
                    Button {
                        selectedPost = post
                    } label: {
                        ZStack {
                            
                            Rectangle()
                                .fill(.yellow)
                            Image(uiImage: post.image.jpeg()!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                        }
                    }
                } label: {
                    Text("写真1")
                }
            }
        }
        .sheet(item: $selectedPost) { post in
            HaikuView(vc: HaikuViewController(post: post))
        }
    }
}
