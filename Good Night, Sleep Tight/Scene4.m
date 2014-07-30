
//  Scene4.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 29/07/2014.
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



@implementation Scene4 {
    
    SKSpriteNode *_btnAnimal;
    SKSpriteNode *_btnEel;
    SKSpriteNode *_btnCrab;
    SKSpriteNode *_btnNextScene;
    SKSpriteNode *_btnPrevScene;
    SKSpriteNode *_btnHome;
    SKSpriteNode *_btnNightSky;
    SKSpriteNode *_btnBubble;
    AVAudioPlayer *_yawnSound;
}





-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        
        
        // add the night sky background
        _btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s4nightsky"];
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2));
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        
        // add the animal
        _btnAnimal = [SKSpriteNode spriteNodeWithImageNamed:@"fish"];
        _btnAnimal.position = CGPointMake(670.0f,330.0f);
        _btnAnimal.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnAnimal];
        
        // add the eel
        _btnEel = [SKSpriteNode spriteNodeWithImageNamed:@"eel"];
        _btnEel.position = CGPointMake(110.0f,50.0f);
        _btnEel.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnEel];
        
        // add the crab
        _btnCrab = [SKSpriteNode spriteNodeWithImageNamed:@"crab"];
        _btnCrab.position = CGPointMake(810.0f,180.0f);
        _btnCrab.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnCrab];
        
        
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
        _btnNextScene.position = CGPointMake(990.0f,280.0f);
        _btnNextScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnNextScene];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *yawnURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"cow" ofType:@"wav"]];
        _yawnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:yawnURL error:nil];
  
        self.physicsWorld.gravity = CGVectorMake( 0, +0.2 );
        


    }
    return self;
}








- (void)sleepAnimal
{
    [_yawnSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"sleepfish"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"fish%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
    
    //add "good night, monkey" text
    SKSpriteNode *goodnightMonkey = [SKSpriteNode spriteNodeWithImageNamed:@"goodnight-fish"];
    goodnightMonkey.position = CGPointMake(780.0f, 50.0f);
    goodnightMonkey.zPosition = DrawingOrderOtherSprites;
    goodnightMonkey.alpha = 0.0;
    SKAction *fadeIn = [SKAction fadeAlphaTo:1.0 duration:2.0];
    [self addChild:goodnightMonkey];
    [goodnightMonkey runAction:fadeIn];
    
}



- (void)eelTouch
{
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"eel"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"eel%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnEel runAction:keepRepeatingAnimation];
    
}


- (void)crabTouch
{
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"crab"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"crab%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnCrab runAction:keepRepeatingAnimation];
    
}


- (void)addBubbles:(CGPoint)location  {
    _btnBubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble"];
    _btnBubble.zPosition = DrawingOrderStars;
    _btnBubble.position = location;
    _btnBubble.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_btnBubble.frame.size.width/2];


    [self addChild:_btnBubble];
    //sound
    SKAction *playSFX = [SKAction playSoundFileNamed:@"ting.wav" waitForCompletion:NO];
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
    EndScene *nextScene = [EndScene sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToPrevScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene3 *prevScene = [Scene3 sceneWithSize:self.size];
    [self.view presentScene:prevScene transition:[SKTransition fadeWithDuration:0.5]];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        

        
        if([_btnAnimal containsPoint:location])
        {
            NSLog(@"animal touch");
            [self sleepAnimal];
        
        }
        
        else if ([_btnEel containsPoint:location]) {
            NSLog(@"eel touch");
            [self eelTouch];
        }
        
        else if ([_btnCrab containsPoint:location]) {
            NSLog(@"crab touch");
            [self crabTouch];
        }
        
        else if ([_btnBubble containsPoint:location]) {
            [_btnBubble setTexture:[SKTexture textureWithImageNamed:@"bubblepop"]];
            NSLog(@"bubble touch");
            //[self removeFromParent];
        }
        
        else if([_btnNextScene containsPoint:location]) {
            NSLog(@"next scene touch");
            [self changeToNextScene];
        }
        
        else if([_btnHome containsPoint:location]) {
            NSLog(@"home touch");
            [self changeToHome];
        }
        
        else if ([_btnNightSky containsPoint:location]) {
          NSLog(@"sky touch");
          [self addBubbles:location];
        }       
    }
}







//- (void)popBubbles {
//    _btnBubble setTexture:[SKTexture textureWithImageNamed:@"bubblepop"];
//}










-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
