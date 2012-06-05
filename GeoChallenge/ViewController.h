//
//  ViewController.h
//  GeoChallenge
//
//  Created by johanmazeyrat on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer1;
    int compteur;
    int temps;
    int aTouche;
    int points;
    int total;
    int distance;
    int x, y;
    int etat;
}
@property (weak, nonatomic) IBOutlet UILabel *decompte;
@property (weak, nonatomic) IBOutlet UILabel *score;

@end
