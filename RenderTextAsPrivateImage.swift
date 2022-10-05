@ViewBuilder
    func screenshotProtectedText(with text: String, andGeoProxy proxy: GeometryProxy) -> some View {
        let (renderer, attrs, textHeight) = imageRendererAndTextAttributes(with: text, andGeoProxy: proxy)
        let img = renderer.image { ctx in
            let drawHeight = max(textHeight, proxy.size.height)
        
            text.draw(
                with: .init(origin: .init(x: 0, y: 0), size: .init(width: proxy.size.width, height: drawHeight)),
                options: [.usesLineFragmentOrigin],
                attributes: attrs,
                context: nil
            )
        }
        PrivateImageView(image: img)
            .frame(minHeight: textHeight)
    }