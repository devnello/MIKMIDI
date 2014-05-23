//
//  MIKMIDIMetadataTextEvent.m
//  MIDI Files Testbed
//
//  Created by Jake Gundersen on 5/22/14.
//  Copyright (c) 2014 Mixed In Key. All rights reserved.
//

#import "MIKMIDIMetaTextEvent.h"
#import "MIKMIDIEvent_SubclassMethods.h"
#import "MIKMIDIUtilities.h"

@implementation MIKMIDIMetaTextEvent

+ (void)load { [MIKMIDIEvent registerSubclass:self]; }
+ (BOOL)supportsMIKMIDIEventType:(MIKMIDIEventType)type { return type == MIKMIDIEventType_MetaText; }
+ (Class)immutableCounterpartClass { return [MIKMIDIMetaTextEvent class]; }
+ (Class)mutableCounterpartClass { return [MIKMutableMIDIMetaTextEvent class]; }
+ (BOOL)isMutable { return NO; }

- (NSString *)string
{
    return [[NSString alloc] initWithData:self.metaData encoding:NSUTF8StringEncoding];
}

- (void)setString:(NSString *)string
{
    if (![[self class] isMutable]) return MIKMIDI_RAISE_MUTATION_ATTEMPT_EXCEPTION;
    
    [self willChangeValueForKey:@"string"];
    [self setMetaData:[string dataUsingEncoding:NSUTF8StringEncoding]];
    [self didChangeValueForKey:@"string"];
}

@end


@implementation MIKMutableMIDIMetaTextEvent

+ (BOOL)isMutable { return YES; }

@dynamic string;

@end