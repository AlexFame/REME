import Foundation

struct Post: Identifiable {
    let id = UUID()
    let authorName: String
    let authorHandle: String
    let authorInitials: String
    let imageURL: URL?
    let caption: String
    let likes: Int
    let comments: Int
    let reposts: Int
    let isBeforeAfter: Bool
}

extension Post {
    static let preview: [Post] = [
        Post(
            authorName: "Maya Studio",
            authorHandle: "@maya.studio",
            authorInitials: "MS",
            imageURL: URL(string: "https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=1200"),
            caption: "New space, same energy.",
            likes: 248,
            comments: 19,
            reposts: 7,
            isBeforeAfter: false
        ),
        Post(
            authorName: "Alex Visuals",
            authorHandle: "@alexvisuals",
            authorInitials: "AV",
            imageURL: URL(string: "https://images.unsplash.com/photo-1523726491678-bf852e717f6a?w=1200"),
            caption: "Before → after. A small change can shift everything.",
            likes: 531,
            comments: 42,
            reposts: 18,
            isBeforeAfter: true
        )
    ]
}
