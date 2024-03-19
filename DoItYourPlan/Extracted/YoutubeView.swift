//
//  TutoView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 14/03/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct YouTubeVideo: View {
    let youtubeLink : String
    
    var body: some View {
        WebView(urlString: youtubeLink)
            .frame(width: 360, height: 240)
    }
}

struct YoutubeComponent : Identifiable {
    var id : String
    var name : String
    
    func videoLink () -> String {
        return "https://www.youtube.com/embed/\(id)"
    }
    
    func miniatureLink () -> String {
        return "http://img.youtube.com/vi/\(id)/0.jpg"
    }
}
struct YoutubeView: View {
    var youtubeLink : String
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            YouTubeVideo(youtubeLink: youtubeLink)
            
        }
    }
}
#Preview {
    YoutubeView(youtubeLink: "https://www.youtube.com/watch?v=ViSl8ZTYflU")
}
