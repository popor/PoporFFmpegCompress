//
//  PoporFFmpegCompress.h
//  PoporFFmpegCompress
//
//  Created by apple on 2019/2/14.
//  Copyright © 2019 popor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PoporFFmpeg.h"

@interface PoporFFmpegCompress : NSObject

@property (nonatomic, strong) PoporFFmpeg * ffmpeg;

// 只支持本地URL
- (void)compressVideoUrl:(NSString *)url size:(CGSize)tSize tPath:(NSString *)tPath finish:(PoporFFmpegFinishBlock)finishBlock;

- (void)compressCmd:(NSString *)cmd finish:(PoporFFmpegFinishBlock)finishBlock;

#pragma mark - tool
+ (CGSize)sizeFrom:(CGSize)originSize targetSize:(CGSize)targetSize;
+ (CGSize)videoSizeFromUrl:(NSString *)url;

@end
