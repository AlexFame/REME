import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Label("Лента", systemImage: "house.fill") }

            RecommendationsView()
                .tabItem { Label("Рядом", systemImage: "sparkles") }

            CreatePostView()
                .tabItem { Label("Создать", systemImage: "plus.circle.fill") }

            ChatsView()
                .tabItem { Label("Чаты", systemImage: "bubble.left.and.bubble.right.fill") }

            ProfileView()
                .tabItem { Label("Профиль", systemImage: "person.fill") }
        }
        .tint(.primary)
    }
}

private struct RecommendationsView: View {
    var body: some View { placeholder("Рекомендации") }
}

private struct CreatePostView: View {
    var body: some View { placeholder("Новая публикация") }
}

private struct ChatsView: View {
    var body: some View { placeholder("Чаты") }
}

private struct ProfileView: View {
    var body: some View { placeholder("Профиль") }
}

private func placeholder(_ title: String) -> some View {
    NavigationStack {
        ContentUnavailableView(title, systemImage: "square.stack.3d.up")
    }
}
