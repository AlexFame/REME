import SwiftUI

struct FeedView: View {
    private let posts = Post.preview

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("REME")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 12)
                        .padding(.bottom, 18)

                    StoryRailView()
                        .padding(.bottom, 22)

                    LazyVStack(spacing: 28) {
                        ForEach(posts) { post in
                            PostCardView(post: post)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .background(Color(.systemGroupedBackground))
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
