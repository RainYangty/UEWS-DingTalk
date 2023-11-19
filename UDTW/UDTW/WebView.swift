//
//  WebView.swift
//  UDTW
//
//  Created by RainYang on 2023/8/29.
//
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    // 需打开网页的 URL 地址
    let url: URL

    // UIViewRepresentable 协议中必需的方法
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
    }
    
    // UIViewRepresentable 协议中必需的方法，当状态发生变化时，可以加载一个新的 URL。
    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: url)
        webView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // 可以实现 WKNavigationDelegate 的其他方法来处理页面加载状态、错误等
    }
}
