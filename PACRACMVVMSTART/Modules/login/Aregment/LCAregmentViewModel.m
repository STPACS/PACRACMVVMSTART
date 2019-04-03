//
//  LCAregmentViewModel.m
//  PACRACMVVMSTART
//
//  Created by chenliang on 2019/4/3.
//  Copyright © 2019 STPACS. All rights reserved.
//

#import "LCAregmentViewModel.h"

@implementation LCAregmentViewModel
- (void)initialize {
    [super initialize];
    self.shouldNavBackItem = YES;
}


- (RACSignal *)requestRemoteDataSignalWithPage:(NSUInteger)page {
    
    @weakify(self)
    
//    if (self.MESSAGE_ID) {
//        return [[[self.services net_userApi]request_Api_api_aboutUsMessage_getContent_doMESSAGE_ID:self.MESSAGE_ID]map:^id(RACTuple * value) {
//            @strongify(self)
//            if ([value.first[@"code"] isEqualToString:@"200"]) {
//                NSDictionary *dic = value.first[@"data"];
//                self.url = [dic objectForKey:@"CONTENT"];
//
//                NSString *htmlString = [NSString stringWithFormat:@"<html> \n"
//                                        "<head> \n"
//                                        "<style type=\"text/css\"> \n"
//                                        "body {font-size:15px;}\n"
//                                        "</style> \n"
//                                        "</head> \n"
//                                        "<body>"
//                                        "<script type='text/javascript'>"
//                                        "window.onload = function(){\n"
//                                        "var $img = document.getElementsByTagName('img');\n"
//                                        "for(var p in  $img){\n"
//                                        " $img[p].style.width = '100%%';\n"
//                                        "$img[p].style.height ='auto'\n"
//                                        "}\n"
//                                        "}"
//                                        "</script>%@"
//                                        "</body>"
//                                        "</html>",self.url];
//                NSString * htmlcontent = [NSString stringWithFormat:@"<div id=\"webview_content_wrapper\">%@</div>", htmlString];
//
//                if (self.reloadData) {
//                    self.reloadData(htmlcontent);
//                }
//            }
//            return value;
//
//        }];
//    } else {
//        return [RACSignal empty];
//    }
//
    return [RACSignal empty];
    
}

@end
