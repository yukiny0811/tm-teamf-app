//
//  ProfileView.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary

struct ProfileView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var posts: [Post]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(posts) { post in
                    NavigationLink {
                        HaikuView(vc: HaikuViewController(post: post))
                    } label: {
                        Image(uiImage: post.image.jpeg()!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .padding(.vertical, 30)
                    }
                }
            }
            .navigationTitle("過去投稿")
        }
    }
}
