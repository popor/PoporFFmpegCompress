//
//  PoporFFmpeg.h
//  PoporFFmpeg
//
//  Created by apple on 2019/2/14.
//  Copyright © 2019 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^PoporFFmpegFinishBlock)(BOOL finished, NSString * info); // __BlockTypedef

@interface PoporFFmpeg : NSObject

@property (nonatomic, copy  ) PoporFFmpegFinishBlock finishBlock;

- (void)compressCmd:(NSString *)cmd finish:(PoporFFmpegFinishBlock)finishBlock;

@end
