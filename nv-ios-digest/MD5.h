/*
 * Copyright (C) 2013 Neo Visionaries Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


//----------------------------------------------------------------------
// Headers
//----------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


//----------------------------------------------------------------------
// Interface
//----------------------------------------------------------------------
@interface MD5 : NSObject
- (int)updateWith:(const void *)data length:(CC_LONG)length;
- (int)updateWithString:(NSString *)string;
- (unsigned char *)final;
+ (MD5 *)md5WithString:(NSString *)string;
@end