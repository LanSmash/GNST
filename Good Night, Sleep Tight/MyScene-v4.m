//
//  MyScene.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 8/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene {
    
    SKSpriteNode *_btnSound;
    BOOL _soundOff;
}




-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [_btnSound removeFromParent];
        
        _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"monster1-eyesopen"];
        _btnSound.position = CGPointMake(400.0f,400.0f);
        
        [self addChild:_btnSound];
        
        
    }
    return self;
}


- (void)setUpFooter
{
    
    /* add the sound button */
    
    if (_soundOff)
    {
        // NSLog(@"_soundOff");
        
        [_btnSound removeFromParent];
        
        _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"monster1-eyesopen"];
        _btnSound.position = CGPointMake(400.0f,400.0f);
        
        [self addChild:_btnSound];
        
    }
    else
    {
        // NSLog(@"_soundOn");
        
        [_btnSound removeFromParent];
        
        _btnSound = [SKSpriteNode spriteNodeWithImageNamed:@"monster1-eyesshut"];
        _btnSound.position = CGPointMake(400.0f,400.0f);
        
        [self addChild:_btnSound];
        
    }
}






- (void)showSoundButtonForTogglePosition:(BOOL)togglePosition
{
    // NSLog(@"togglePosition: %i", togglePosition);
    
    if (togglePosition)
    {
        _btnSound.texture = [SKTexture textureWithImageNamed:@"monster1-eyesopen"];
        _btnSound.position = CGPointMake(200.0f,400.0f);
        _soundOff = NO;
    }
    else
    {
        _btnSound.texture = [SKTexture textureWithImageNamed:@"monster1-eyesshut"];
        _soundOff = YES;
    }
}










-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    
    
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        if([_btnSound containsPoint:location])
        {
            NSLog(@"xxxxxxxxxxxxxxxxxxx sound toggle");
            
            [self showSoundButtonForTogglePosition:_soundOff];
        }
        else
        {
            NSLog(@"not a sound button touch");
        }
    }
    
}












-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
