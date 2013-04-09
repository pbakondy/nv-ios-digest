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
#import "SHA1.h"


//----------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------
@implementation SHA1
{
    CC_SHA1_CTX _context;
    unsigned char _digest[CC_SHA1_DIGEST_LENGTH];
    NSString *_description;
}


- (id)init
{
    self = [super init];

    if (self == nil)
    {
        return nil;
    }

    CC_SHA1_Init(&_context);

    _description = @"'final' not called";

    return self;
}


- (NSString *)description
{
    return _description;
}


- (int)updateWith:(const void *)data length:(CC_LONG)length
{
    return CC_SHA1_Update(&_context, data, length);
}


- (int)updateWithString:(NSString *)string
{
    // Convert the given 'NSString *' to 'const char *'.
    const char *str = [string cStringUsingEncoding:NSUTF8StringEncoding];

    // Get the length of the C-string.
    CC_LONG len = strlen(str);

    return [self updateWith:str length:len];
}


- (unsigned char *)final
{
    CC_SHA1_Final(_digest, &_context);

    _description = [NSString stringWithFormat:
                    @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                    _digest[ 0], _digest[ 1], _digest[ 2], _digest[ 3],
                    _digest[ 4], _digest[ 5], _digest[ 6], _digest[ 7],
                    _digest[ 8], _digest[ 9], _digest[10], _digest[11],
                    _digest[12], _digest[13], _digest[14], _digest[15],
                    _digest[16], _digest[17], _digest[18], _digest[19]];

    return _digest;
}


+ (SHA1 *)sha1WithString:(NSString *)string
{
    SHA1 *md = [[SHA1 alloc] init];

    [md updateWithString:string];
    [md final];

    return md;
}


@end
