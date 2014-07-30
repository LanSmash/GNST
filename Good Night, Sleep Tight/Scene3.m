
//  Scene3.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 23/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "Scene4.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>



@implementation Scene3 {
    
    SKSpriteNode *_btnAnimal;
    SKSpriteNode *_btnNextScene;
    SKSpriteNode *_btnPrevScene;
    SKSpriteNode *_btnHome;
    SKSpriteNode *_btnMoon;
    SKSpriteNode *_btnNightSky;
    SKSpriteNode *_btnHouse;
    AVAudioPlayer *_moonSound;
    AVAudioPlayer *_yawnSound;
    BOOL _HouseLightsOn;
}





-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        
        
        // add the night sky background
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s3nightsky"];
        _btnNightSky.position = CGPointMake(size.width/2, (size.height-215));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        // add the non-interactive foreground image asset
        SKSpriteNode *foreground = [SKSpriteNode spriteNodeWithImageNamed:@"s3foreground"];
        foreground.position = CGPointMake(size.width/2, size.height/2);
        foreground.zPosition = DrawingOrderForeground;
        [self addChild:foreground];

        // add the house
        _btnHouse = [SKSpriteNode spriteNodeWithImageNamed:@"houselightson"];
        _btnHouse.position = CGPointMake(170.0f,250.0f);
        _btnHouse.zPosition = DrawingOrderOtherSprites;
        _HouseLightsOn = YES;
        [self addChild:_btnHouse];
        
        // add the animal
        _btnAnimal = [SKSpriteNode spriteNodeWithImageNamed:@"cow"];
        _btnAnimal.position = CGPointMake(650.0f,180.0f);
        _btnAnimal.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnAnimal];
        
        // add the moon
        _btnMoon = [SKSpriteNode spriteNodeWithImageNamed:@"moon"];
        _btnMoon.position = CGPointMake(200.0f,630.0f);
        _btnMoon.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnMoon];
        
        // add home button
        _btnHome = [SKSpriteNode spriteNodeWithImageNamed:@"homebutton"];
        _btnHome.position = CGPointMake(930.0f,740.0f);
        _btnHome.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnHome];
        
        // add previous scene button
        _btnPrevScene = [SKSpriteNode spriteNodeWithImageNamed:@"previousscenetab"];
        _btnPrevScene.position = CGPointMake(35.0f,220.0f);
        _btnPrevScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnPrevScene];
        
        //add next scene button
        _btnNextScene = [SKSpriteNode spriteNodeWithImageNamed:@"nextscenetab"];
        _btnNextScene.position = CGPointMake(990.0f,220.0f);
        _btnNextScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnNextScene];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *moonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ukulele" ofType:@"wav"]];
        _moonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:moonURL error:nil];
        NSURL *yawnURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cow" ofType:@"wav"]];
        _yawnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:yawnURL error:nil];
        
        
    }
    return self;
}








- (void)sleepAnimal
{
    [_yawnSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"sleepcow"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"cow%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.2];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
    
    //add "good night, monkey" text
    SKSpriteNode *goodnightMonkey = [SKSpriteNode spriteNodeWithImageNamed:@"goodnight-cow"];
    goodnightMonkey.position = CGPointMake(780.0f, 50.0f);
    goodnightMonkey.zPosition = DrawingOrderOtherSprites;
    goodnightMonkey.alpha = 0.0;
    SKAction *fadeIn = [SKAction fadeAlphaTo:1.0 duration:2.0];
    [self addChild:goodnightMonkey];
    [goodnightMonkey runAction:fadeIn];
    
    
    
    
}


- (void)moonTouch
{
    [_moonSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"moon"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"moon%i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.15];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:6];
    [_btnMoon runAction:keepRepeatingAnimation];
    
}


- (void)changeToHome
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    MyScene *nextScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}


- (void)changeToNextScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene4 *nextScene = [Scene4 sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToPrevScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene2 *prevScene = [Scene2 sceneWithSize:self.size];
    [self.view presentScene:prevScene transition:[SKTransition fadeWithDuration:0.5]];
}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        
        if([_btnAnimal containsPoint:location])
        {
            NSLog(@"animal touch");
                [self sleepAnimal];

            
        }
        
        if([_btnHouse containsPoint:location]) {
            NSLog(@"house touch");
            if (_HouseLightsOn == YES) {
                [_btnHouse setTexture:[SKTexture textureWithImageNamed:@"houselightsoff"]];
                SKAction *playSFX = [SKAction playSoundFileNamed:@"lightswitch.wav" waitForCompletion:NO];
                [self runAction:playSFX];
                _HouseLightsOn = NO;
            }
            else {
                [_btnHouse setTexture:[SKTexture textureWithImageNamed:@"houselightson"]];
                SKAction *playSFX = [SKAction playSoundFileNamed:@"lightswitch.wav" waitForCompletion:NO];
                [self runAction:playSFX];
                _HouseLightsOn = YES;
            }

        }
        
        if([_btnHome containsPoint:location])
        {
            NSLog(@"home button touch");
            [self changeToHome];
            
        }
        
        if([_btnMoon containsPoint:location]) {
            NSLog(@"moon touch");
            [self moonTouch];
        }
        else {
            if([_btnNightSky containsPoint:location])
            {
                NSLog(@"sky touch");
                SKSpriteNode *nightstar = [SKSpriteNode spriteNodeWithImageNamed:@"star"];
                nightstar.position = location;
                nightstar.zPosition = DrawingOrderStars;
                [self addChild:nightstar];
                SKAction *playSFX = [SKAction playSoundFileNamed:@"ting.wav" waitForCompletion:NO];
                [self runAction:playSFX];
            }
            
        }
        
        
    }
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode:self];
        
        if([_btnNextScene containsPoint:location]) {
            NSLog(@"next scene touch ends");
            [self changeToNextScene];
        }
        if([_btnPrevScene containsPoint:location]) {
            NSLog(@"prev scene touch ends");
            [self changeToPrevScene];
        }
    }
}




-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
