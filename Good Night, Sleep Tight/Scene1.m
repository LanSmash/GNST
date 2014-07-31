
//  Scene1.m
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



@implementation Scene1 {
    
    SKSpriteNode *_btnAnimal;
    SKSpriteNode *_btnNextScene;
    SKSpriteNode *_btnPrevScene;
    SKSpriteNode *_btnHome;
    SKSpriteNode *_btnMoon;
    SKSpriteNode *_btnLeaves1;
    SKSpriteNode *_btnLeaves2;
    SKSpriteNode *_btnLeaves3;
    SKSpriteNode *_btnNightSky;
    AVAudioPlayer *_moonSound;
    AVAudioPlayer *_yawnSound;
}





-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
       
        
        // add the night sky background
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s1nightsky"];
        _btnNightSky.position = CGPointMake(size.width/2, (size.height-320));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        // add the non-interactive foreground image asset
        SKSpriteNode *foreground = [SKSpriteNode spriteNodeWithImageNamed:@"s1foreground"];
        foreground.position = CGPointMake(size.width/2, size.height/2);
        foreground.zPosition = DrawingOrderForeground;
        [self addChild:foreground];
        
        // add the animal
        _btnAnimal = [SKSpriteNode spriteNodeWithImageNamed:@"monkey"];
        _btnAnimal.position = CGPointMake(240.0f,370.0f);
        _btnAnimal.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnAnimal];
        
        // add the moon
        _btnMoon = [SKSpriteNode spriteNodeWithImageNamed:@"moon"];
        _btnMoon.position = CGPointMake(800.0f,630.0f);
        _btnMoon.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnMoon];
        
        // add the first leaves
        _btnLeaves1 = [SKSpriteNode spriteNodeWithImageNamed:@"s1leaves1"];
        _btnLeaves1.position = CGPointMake(170.0f,660.0f);
        _btnLeaves1.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnLeaves1];
        
        // add the second leaves
        _btnLeaves2 = [SKSpriteNode spriteNodeWithImageNamed:@"s1leaves2"];
        _btnLeaves2.position = CGPointMake(100.0f,140.0f);
        _btnLeaves2.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnLeaves2];
        
        // add the third leaves
        _btnLeaves3 = [SKSpriteNode spriteNodeWithImageNamed:@"s1leaves3"];
        _btnLeaves3.position = CGPointMake(900.0f,140.0f);
        _btnLeaves3.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnLeaves3];

        // add home button
        _btnHome = [SKSpriteNode spriteNodeWithImageNamed:@"homebutton"];
        _btnHome.position = CGPointMake(930.0f,740.0f);
        _btnHome.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnHome];
        
        // add previous scene button
        //_btnPrevScene = [SKSpriteNode spriteNodeWithImageNamed:@"previousscenetab"];
        //_btnPrevScene.position = CGPointMake(35.0f,220.0f);
        //_btnPrevScene.zPosition = DrawingOrderOtherSprites;
        //[self addChild:_btnPrevScene];
        
        //add next scene button
        _btnNextScene = [SKSpriteNode spriteNodeWithImageNamed:@"nextscenetab"];
        _btnNextScene.position = CGPointMake(990.0f,380.0f);
        _btnNextScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnNextScene];
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *moonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ukulele" ofType:@"wav"]];
        _moonSound = [[AVAudioPlayer alloc] initWithContentsOfURL:moonURL error:nil];
        NSURL *yawnURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"monkey" ofType:@"wav"]];
        _yawnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:yawnURL error:nil];
        
        
    }
    return self;
}






- (void)sleepAnimal
{
    [_yawnSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"gigglemonkey"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"monkey%i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
    
    //add "good night, monkey" text
    SKSpriteNode *goodnightMonkey = [SKSpriteNode spriteNodeWithImageNamed:@"goodnightMonkeyText"];
    goodnightMonkey.position = CGPointMake(495.0f, 55.0f);
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




- (void)leaves1Touch
{
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"s1leaves1"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"s1leaves%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.15];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnLeaves1 runAction:keepRepeatingAnimation];
    SKAction *playSFX = [SKAction playSoundFileNamed:@"hisstemp.mp3" waitForCompletion:NO];
    [self runAction:playSFX];
    
}


- (void)leaves2Touch
{
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"s1leaves2"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"s1reefplants%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnLeaves2 runAction:keepRepeatingAnimation];
    SKAction *playSFX = [SKAction playSoundFileNamed:@"tingtemp.mp3" waitForCompletion:NO];
    [self runAction:playSFX];
    
}

- (void)leaves3Touch
{
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"s1leaves3"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"s1colourfulleaves%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:3];
    [_btnLeaves3 runAction:keepRepeatingAnimation];
    SKAction *playSFX = [SKAction playSoundFileNamed:@"butterflytemp.mp3" waitForCompletion:NO];
    [self runAction:playSFX];
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
    Scene2 *nextScene = [Scene2 sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToPrevScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    MyScene *prevScene = [MyScene sceneWithSize:self.size];
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
        
        else if([_btnHome containsPoint:location])
        {
            NSLog(@"home button touch");
            [self changeToHome];
            
        }
        
        else if([_btnLeaves1 containsPoint:location])
        {
            NSLog(@"leaves1 touch");
            [self leaves1Touch];
        }
        
        else if([_btnLeaves2 containsPoint:location])
        {
            NSLog(@"leaves2 touch");
            [self leaves2Touch];
        }
        
        else if([_btnLeaves3 containsPoint:location])
        {
            NSLog(@"leaves3 touch");
            [self leaves3Touch];
        }
        
        else if([_btnMoon containsPoint:location]) {
            NSLog(@"moon touch");
            [self moonTouch];
        }
        
        else if([_btnNextScene containsPoint:location]) {
            NSLog(@"next scene touch ends");
            [self changeToNextScene];
        }
        
        else if([_btnNightSky containsPoint:location]) {

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








-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
