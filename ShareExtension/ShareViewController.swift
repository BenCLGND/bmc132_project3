//
//  ShareViewController.swift
//  ShareExtension
//
//  Created by Clark,Benjamin on 4/25/18.
//  Copyright © 2018 Clark,Benjamin. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        
        // content of the post
        print(#function, #line, self.contentText ?? "NO CONTENT")
        
        // extract URL from attachments
        if let item = extensionContext?.inputItems.first as? NSExtensionItem,
            let itemProvider = item.attachments?.first as? NSItemProvider,
            itemProvider.hasItemConformingToTypeIdentifier("public.url") {
            
            itemProvider.loadItem(forTypeIdentifier: "public.url", options: nil) {
                url, error in
                
                if let error = error {
                    print(#function, #line, error)
                    return
                }
                
                if let shareURL = url as? NSURL {
                    print(shareURL)
                }
                
                self.extensionContext?.completeRequest(returningItems: [], completionHandler:nil)
            }
        }
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
