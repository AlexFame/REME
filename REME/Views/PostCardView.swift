import SwiftUI

struct PostCardView: View {
    let post: Post
    @State private var isLiked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Circle()
                    .fill(Color.secondary.opacity(0.18))
                    .frame(width: 38, height: 38)
                    .overlay {
                        Text(post.authorInitials)
                            .font(.caption.bold())
                    }

                VStack(alignment: .leading, spacing: 2) {
                    Text(post.authorName)
                        .font(.subheadline.weight(.semibold))
                    Text(post.authorHandle)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Image(systemName: "ellipsis")
                    .foregroundStyle(.secondary)
            }

            if let imageURL = post.imageURL {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFill()
                    default:
                        Rectangle().fill(Color.secondary.opacity(0.15))
                            .overlay { ProgressView() }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 360)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            }

            Text(post.caption)
                .font(.body)

            HStack(spacing: 22) {
                actionButton(
                    systemName: isLiked ? "heart.fill" : "heart",
                    title: "(post.likes)",
                    tint: isLiked ? .red : .primary
                ) { isLiked.toggle() }

                actionButton(systemName: "bubble.right", title: "(post.comments)") {}
                actionButton(systemName: "arrow.2.squarepath", title: "(post.reposts)") {}

                Spacer()

                Button(action: {}) {
                    Label("Донат", systemImage: "gift")
                        .font(.subheadline.weight(.semibold))
                }
                .buttonStyle(.bordered)
                .clipShape(Capsule())
            }
            .foregroundStyle(.primary)
        }
    }

    private func actionButton(
        systemName: String,
        title: String,
        tint: Color = .primary,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Label(title, systemImage: systemName)
                .font(.subheadline)
                .foregroundStyle(tint)
        }
    }
}
