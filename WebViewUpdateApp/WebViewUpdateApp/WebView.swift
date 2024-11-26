//
//  WebView.swift
//  WebViewUpdateApp
//
//  Created by Lyndon Cruz on 11/26/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @Binding var webView: WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No need to update the UIView in this example.
    }
}
