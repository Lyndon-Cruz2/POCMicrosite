//
//  ContentView.swift
//  WebViewUpdateApp
//
//  Created by Lyndon Cruz on 11/26/24.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var webView = WKWebView()

    var body: some View {
        VStack {
            // Display the WebView
            WebView(webView: $webView)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Button to update content
            Button("Update Content") {
                updateWebViewContent()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .onAppear {
            loadInitialContent()
        }
    }

    // Load the initial HTML content
    private func loadInitialContent() {
        let htmlString = """
        <html>
        <body>
            <div id="content1" style="font-size: 18px; line-height: 1.6; color: #333; font-family: Arial, sans-serif; padding: 16px;">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae congue neque. Nulla facilisi. Aenean sit amet gravida nisi. Ut varius massa at turpis consequat feugiat.
            </div>
            <div id="content2" style="font-size: 18px; line-height: 1.6; color: #333; font-family: Arial, sans-serif; padding: 16px;">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae congue neque. Nulla facilisi. Aenean sit amet gravida nisi. Ut varius massa at turpis consequat feugiat.
            </div>
            <div id="content3" style="font-size: 18px; line-height: 1.6; color: #333; font-family: Arial, sans-serif; padding: 16px;">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae congue neque. Nulla facilisi. Aenean sit amet gravida nisi. Ut varius massa at turpis consequat feugiat.
            </div>
        </body>
        </html>
        """
        webView.loadHTMLString(htmlString, baseURL: nil)
    }

    // Update the web content dynamically
    private func updateWebViewContent() {
        let jsCode = """
        document.getElementById('content1').innerHTML = '1Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
        document.getElementById('content2').innerHTML = '2Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
        document.getElementById('content3').innerHTML = '3Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
        """
        webView.evaluateJavaScript(jsCode) { result, error in
            if let error = error {
                print("Error updating content: \(error)")
            } else {
                print("Content updated successfully")
            }
        }
    }
}

#Preview {
    ContentView()
}
