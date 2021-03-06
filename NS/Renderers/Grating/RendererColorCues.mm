
//#include <iostream>
#include "RendererColorCues.hpp"
#include "Utils.hpp" 
#include "NSGLView.h"
#include "AppDelegate.h"
#include "GratingFunctions.hpp"
//#import <Carbon/Carbon.h> //needed for key event codes


//1 = 3 colors - task: pick a pulsing color
//2 = 2 colors, 1 texture - task: pick a moving texture
//3 = 1 color, 2 texture - task: pick a moving texture
//4 = 3 textures - task: pick a moving texture
//5 = 1 moving texture, 2 static textures - task: pick a moving texture
//6 = 2 moving texture, 1 static texture - task: pick a moving texture
//7 = 3 static textures - task: pick a static texture

int EXPERIMENT_NUMBER=4; //15;  
vec4 BACKGROUND_COLOR=vec4(100,255);
//vec4 BACKGROUND_COLOR=vec4(128,128,128,255);
//vec4 BACKGROUND_COLOR=vec4(255,255,255,255);

bool I_AM_READY  = false;

RendererColorCues::RendererColorCues() : Renderer() {
}

void RendererColorCues::InitializeImagesOnly() {
  ResourceHandler* rh = ResourceHandler::GetResourceHandler();
  Texture* circleMask = rh->CreateTextureFromImageFile("circle3.png");
  
  vec4 color = vec4(1.0,1.0,1.0,1.0);
  vec4 color2 = GratingFunctions::ChooseColor(4);
  vec4 colorDG = vec4(0.0, 1.0);
  
  //top row = change in phase
  /*
  RectGrating* r1 = new RectGrating(0, circleMask, color, colorDG, 4.0, 0.0, 0.0, 0.0 );
  r1->SetTranslate(vec3(-0.8, 0.2, 0.0));
  r1->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r1->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r1->Transform();       
  AddGeom(r1);
 
  RectGrating* r2 = new RectGrating(0, circleMask, color, colorDG, 4.0, M_PI/3.0, 0.0, 0.0 );
  r2->SetTranslate(vec3(-0.6, 0.2, 0.0));
  r2->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r2->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r2->Transform();       
  AddGeom(r2);
  
  RectGrating* r3 = new RectGrating(0, circleMask, color, colorDG, 4.0, (M_PI/3.0)*2.0, 0.0, 0.0 );
  r3->SetTranslate(vec3(-0.4, 0.2, 0.0));
  r3->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r3->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r3->Transform();       
  AddGeom(r3);
  
  RectGrating* r4 = new RectGrating(0, circleMask, color, colorDG, 4.0, M_PI, 0.0, 0.0 );
  r4->SetTranslate(vec3(-0.2, 0.2, 0.0));
  r4->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r4->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r4->Transform();       
  AddGeom(r4);
  
  //row 2  //change in angle
  RectGrating* r5 = new RectGrating(0, circleMask, color, colorDG, 6.0, 0.0, 0.0, 0.0 );
  r5->SetTranslate(vec3(-0.8, -0.1, 0.0));
  r5->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r5->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r5->Transform();       
  AddGeom(r5);
  
  RectGrating* r6 = new RectGrating(0, circleMask, color, colorDG, 6.0, M_PI/3.0, 20.0, 0.0 );
  r6->SetTranslate(vec3(-0.6, -0.1, 0.0));
  r6->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r6->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r6->Transform();       
  AddGeom(r6);
 
  RectGrating* r7 = new RectGrating(0, circleMask, color, colorDG, 6.0, (M_PI/3.0)*2.0, 40.0, 0.0 );
  r7->SetTranslate(vec3(-0.4, -0.1, 0.0));
  r7->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r7->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r7->Transform();       
  AddGeom(r7);
  
  RectGrating* r8 = new RectGrating(0, circleMask, color, colorDG, 6.0, M_PI, 60.0, 0.0 );
  r8->SetTranslate(vec3(-0.2, -0.1, 0.0));
  r8->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r8->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r8->Transform();       
  AddGeom(r8);
  
  
  //row 3  //change in freq
  RectGrating* r9 = new RectGrating(0, circleMask, color, colorDG, 4.0, (M_PI/3.0)*2.0, 45.0, 0.0 );
  r9->SetTranslate(vec3(-0.8, -0.4, 0.0));
  r9->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r9->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r9->Transform();       
  AddGeom(r9);
  
  RectGrating* r10 = new RectGrating(0, circleMask, color, colorDG, 6.0, M_PI/3.0, 45.0, 0.0 );
  r10->SetTranslate(vec3(-0.6, -0.4, 0.0));
  r10->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r10->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r10->Transform();       
  AddGeom(r10);
  
  RectGrating* r11 = new RectGrating(0, circleMask, color, colorDG, 8.0, (M_PI/3.0)*2.0, 45.0, 0.0 );
  r11->SetTranslate(vec3(-0.4, -0.4, 0.0));
  r11->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r11->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r11->Transform();       
  AddGeom(r11);
  
  RectGrating* r12 = new RectGrating(0, circleMask, color, colorDG, 10.0, M_PI, 45.0, 0.0 );
  r12->SetTranslate(vec3(-0.2, -0.4, 0.0));
  r12->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r12->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r12->Transform();       
  AddGeom(r12);
*/
  
  //row 4
  RectGrating* r13 = new RectGrating(0, circleMask, color2, colorDG, 8.0, 0.0, 60.0, 0.0 );
  r13->SetTranslate(vec3(-0.8, -0.7, 0.0));
  r13->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r13->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r13->Transform();       
  AddGeom(r13);
  
  RectGrating* r14 = new RectGrating(0, circleMask, color2, colorDG, 8.0, M_PI/3.0, 50.0, 0.0 );
  r14->SetTranslate(vec3(-0.6, -0.7, 0.0));
  r14->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r14->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r14->Transform();       
  AddGeom(r14);
  
  RectGrating* r15 = new RectGrating(0, circleMask, color2, colorDG, 8.0, 0.0, 20.0, 0.0 );
  r15->SetTranslate(vec3(-0.4, -0.7, 0.0));
  r15->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r15->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r15->Transform();       
  AddGeom(r15);
  
  RectGrating* r16 = new RectGrating(0, circleMask, color2, colorDG, 8.0, M_PI, 00.0, 0.0 );
  r16->SetTranslate(vec3(-0.2, -0.7, 0.0));
  r16->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  r16->SetScale(vec3(0.15, 0.15 * camera->aspect, 1.0));
  r16->Transform();       
  AddGeom(r16);
  
  
  
   I_AM_READY = true;
  //exit(0);
}

void RendererColorCues::Initialize() {
  SetCamera(new Camera(ivec4(0, 0, width, height)));
  CreateFullScreenRect();
  BindDefaultFrameBuffer();

  BACKGROUND_COLOR = BACKGROUND_COLOR/255.0;
  
  GetPrograms().insert(std::pair<string, Program*>("GratingPatch", new Program("GratingPatch")));
  GetPrograms().insert(std::pair<string, Program*>("OutputTexture", new Program("OutputTexture")));
  //GetPrograms().insert(std::pair<string, Program*>("SingleTexture", new Program("SingleTexture")));
  
  if (EXPERIMENT_NUMBER == 99) {
    InitializeImagesOnly();
    return;
  }
  
  
  vec4 colorLG = vec4(1.0, 1.0);
  vec4 colorDG = vec4(0.0, 1.0);
  vec4 colorMG = vec4(0.5, 1.0);
  
    
  ResourceHandler* rh = ResourceHandler::GetResourceHandler();
  Texture* circleMask = rh->CreateTextureFromImageFile("circle4.png");
  
  instructionsTex = rh->CreateTextureFromImageFile("instructions.png"); 
  textRect = new Rectangle(vec3(-1.0, 0.4, 0.0), 0.5, 0.15);
  textRect->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  textRect->Transform();        
  
  vec4 rcolor1;
  vec4 rcolor2;
  vec4 rcolor3;
  vec4 rcolor4;
  vec4 rcolor5;
  vec4 rcolor6;
  vec4 rcolor7;
  vec4 rcolor8;
  
  float ang1;
  float ang2;
  float ang3;
  float ang4;
  
  switch(Utils::randomIntBetween(0,2)) {
    case 0:
      ang1 = 0.0;
      ang2 = 45.0;
      ang3 = 90.0;
      ang4 = 135.0;
      
      break;
    case 1:
      ang2 = 0.0;
      ang3 = 45.0;
      ang4 = 90.0;
      ang1 = 135.0;
      
      break;
    case 2:
      ang3 = 0.0;
      ang4 = 45.0;
      ang1 = 90.0;
      ang2 = 135.0;
      break;
  }
  
  switch(Utils::randomIntBetween(0,2)) {
    case 0:
      rcolor1 = GratingFunctions::ChooseColor(0);
      rcolor2 = GratingFunctions::ChooseColor(1);
      rcolor3 = GratingFunctions::ChooseColor(4);
      rcolor4 = GratingFunctions::ChooseColor(3);
      rcolor5 = GratingFunctions::ChooseColor(2);
      rcolor6 = GratingFunctions::ChooseColor(5);
      rcolor7 = GratingFunctions::ChooseColor(7);
      rcolor8 = GratingFunctions::ChooseColor(8);
      
      break;
    case 1:
      rcolor1 = GratingFunctions::ChooseColor(5);
      rcolor2 = GratingFunctions::ChooseColor(4);
      rcolor3 = GratingFunctions::ChooseColor(3);
      rcolor4 = GratingFunctions::ChooseColor(2);
      rcolor5 = GratingFunctions::ChooseColor(1);
      rcolor6 = GratingFunctions::ChooseColor(0);
      rcolor7 = GratingFunctions::ChooseColor(8);
      rcolor8 = GratingFunctions::ChooseColor(7);
      
      break;
    case 2:
      rcolor1 = GratingFunctions::ChooseColor(4);
      rcolor2 = GratingFunctions::ChooseColor(3);
      rcolor3 = GratingFunctions::ChooseColor(2);
      rcolor4 = GratingFunctions::ChooseColor(5);
      rcolor5 = GratingFunctions::ChooseColor(8);
      rcolor6 = GratingFunctions::ChooseColor(1);
      rcolor7 = GratingFunctions::ChooseColor(7);
      rcolor8 = GratingFunctions::ChooseColor(0);
      
    break;
  }
  
  RectGrating* r1s[200];
  
  for (int i = 0; i < 200; i++) {
    
    float ux = Utils::randomFloatBetween(-0.8 - 0.5, 0.8 - 0.5);
    float uy = Utils::randomFloatBetween(-0.8 - 0.5, 0.7 - 0.5);
    
    bool passed = true;
    
    //naive check
    for (int ii = 0; ii < i; ii++) {
      float dist = vec3::Distance(r1s[ii]->GetTranslate(), vec3(ux, uy, 0.0));
      //printf("dist = %f\n", dist);
      if (dist < 0.08) {
        passed = false;
        break;
      }
    }
    
    if (passed == false) {
      printf("too close!\n");
      i--;
      continue;
    }
    
    
    int which;
    
    /*
    if ( i < 5 ) {
      which = 10;
    } else if ( i < 10 ) {
      which = 11;
    } else if ( i < 15 ) {
      which = 12;
    } else if ( i < 20 ) {
      which = 13;
    } else if ( i < 25 ) {
      which = 14;
    } else if ( i < 30 ) {
      which = 15;
    } else if ( i < 35 ) {
      which = 16;
    } else if ( i < 40 ){
      which = 17;
    } else if ( i < 45 ){
      which = 18;
    } else if ( i < 50 ){
      which = 19;
    } else if ( i < 70){
      which = 20;

    } else {
      which = 0;
    }
     */
   
    
    switch (EXPERIMENT_NUMBER) {
      case 0:
        //EXPERIMENT 1 : 3 pulsing colors
        
        if ( i < 12 ) {
          which = 10;
        } else if ( i < 24 ) {
          which = 11;
        } else if ( i < 36 ) {
          which = 12;
        } else if ( i < 50 ) {
          which = 13;
        } else if ( i < 62 ) {
          which = 14;
        } else if ( i < 74 ) {
          which = 15;
        } else if ( i < 86 ) {
          which = 16;
        } else {
          which = 17;
        }
        break;
        
      case 1:
        //EXPERIMENT 1 : 3 pulsing colors
        
        if ( i < 5 ) {
          which = 1;
        } else if ( i < 10 ) {
          which = 2;
        } else if ( i < 17 ) {
          which = 3;
        } else {
          which = 0;
        }
        break;
        
      case 2:
        
        //EXPERIMENT 2 : 2 pulsing colors, 1 moving texture
        
        if ( i < 5 ) {
          which = 1;
        } else if ( i < 10 ) {
          which = 4;
        } else if ( i < 16 ) {
          which = 3;
        } else {
          which = 0;
        }
        break;
      case 3:
      
        
        //EXPERIMENT 3 : 1 pulsing color, 2 moving textures
        if ( i < 5 ) {
          which = 1;
        } else if ( i < 11 ) {
          which = 4;
        } else if ( i < 16 ) {
          which = 5;
        } else {
          which = 0;
        }
        break;
        
        
      case 4:
        
        //EXPERIMENT 4 : 3 moving textures
        if ( i < 5 ) {
          which = 6;
        } else if ( i < 8 ) {
          which = 4;
        } else if ( i < 11 ) {
          which = 5;
        } else {
          which = 0;
        }
        break;
        
        
      case 5:
        
        //EXPERIMENT 5 : 1 moving textures, 2 static textures
       
       if ( i < 5 ) {
          which = 4; //choose
        } else if ( i < 12 ) {
          which = 7;
        } else if ( i < 24 ) {
          which = 8;
        
          
        } else {
          which = 0;
        }
        break;

      case 6:
        
        //EXPERIMENT 5 : 2 moving textures, 1 static texture
        if ( i < 5 ) {
          which = 4; //choose
        } else if ( i < 12 ) {
          which = 5;
        } else if ( i < 19 ) {
          which = 7;
        } else {
          which = 0;
        }
        break;
        

      case 7:
        
        //EXPERIMENT 7 : 3 static textures
       
        if ( i < 5 ) {
          which = 7; //choose
        } else if ( i < 15 ) {
          which = 8;
        } else if ( i < 21 ) {
          which = 9;
          
        } else {
          which = 0;
        }
        break;

      default:
        printf("ERROR, experiment number not defined\n");
        exit(0);
    }
    
    
    
    
    RectGrating* r;
    vec4 rcolor = GratingFunctions::ChooseColor(Utils::randomIntBetween(9,19));
    
    switch(which) {
        
      case 10: //not pulsing A
        r = new RectGrating(99, circleMask, rcolor1, rcolor1, 0.01, 0.5, 0.0,  0.0 );
        if (EXPERIMENT_NUMBER == 10) {
          r->choose = true;
        } 
        break;
      case 11: //not pulsing B
        r = new RectGrating(99, circleMask, rcolor2, rcolor2, 0.01, 0.5, 0.0,  0.0 );
        if (EXPERIMENT_NUMBER == 11) {
          r->choose = true;
        } 
        
        break;
      case 12: //pulsing A
        r = new RectGrating(99, circleMask, rcolor3, rcolor3, 0.0, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
        if (EXPERIMENT_NUMBER == 12) {
          r->choose = true;
        } 
        
        break;
      case 13: //pulsing B
        r = new RectGrating(99, circleMask, rcolor4, rcolor4, 0.5, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
        if (EXPERIMENT_NUMBER == 13) {
          r->choose = true;
        } 
        
        break; 
      case 14: //moving A
        r = new RectGrating(0, circleMask, rcolor5, colorDG, 6.0, 0.0, ang1, 0.15 );
        if (EXPERIMENT_NUMBER == 14) {
          r->choose = true;
        } 
        
        break;
      case 15: //moving B
        r = new RectGrating(0, circleMask, rcolor6, colorDG, 6.0, 0.0, ang2, 0.15 );
        if (EXPERIMENT_NUMBER == 15) {
          r->choose = true;
        } 
        
        break;
      case 16: //static grating A
        r = new RectGrating(50, circleMask, rcolor7, colorDG, 4.0, 0.5, ang3, 0.0 );
        if (EXPERIMENT_NUMBER == 16) {
          r->choose = true;
        } 
        
        break;
      case 17: //static grating B
        r = new RectGrating(50, circleMask, rcolor8, colorDG, 4.0, 0.5, ang4, 0.0 );
        if (EXPERIMENT_NUMBER == 17) {
          r->choose = true;
        } 
        
        break;
      case 18: //pulsing C
        r = new RectGrating(99, circleMask, rcolor, rcolor, 0.5, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
        
        break; 
      case 19: //moving C
        r = new RectGrating(0, circleMask, rcolor, colorDG, 6.0, 0.0, Utils::randomFloatBetween(0.0,179.0), 0.15 );
        break;
        
      case 20: //static grating C
        r = new RectGrating(50, circleMask, rcolor, colorDG, Utils::randomFloatBetween(4.0,7.0), 0.5, Utils::randomFloatBetween(0.0,179.0), 0.0 );
        break;
        
      case 0: //not pulsing
        r = new RectGrating(99, circleMask, rcolor, rcolor, 0.01, 0.5, 0.0,  0.0 );
        break;
        
      case 1: //pulsing A
        r = new RectGrating(99, circleMask, rcolor2, rcolor2, 0.0, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
        if (EXPERIMENT_NUMBER == 1) {
          r->choose = true;
        } 
        
        break;
      case 2: //pulsing B
        r = new RectGrating(99, circleMask, rcolor1, rcolor1, 0.75, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
        break;
      case 3: //pulsing C
        r = new RectGrating(99, circleMask, rcolor3, rcolor3, 1.5, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
        break;
      case 4: //moving 1
        r = new RectGrating(0, circleMask, rcolor4, colorDG, 5.0, 0.0, ang1, 0.2 );
        if (EXPERIMENT_NUMBER == 2) {
          r->choose = true;
        } 
        if (EXPERIMENT_NUMBER == 5) {
          r->choose = true;
        } 
        if (EXPERIMENT_NUMBER == 6) {
          r->choose = true;
        } 
       
        
        break;
      case 5: //moving 2
        r = new RectGrating(0, circleMask, rcolor5, colorDG, 6.0, 0.0, ang2, 0.15 );
        if (EXPERIMENT_NUMBER == 3) {
          r->choose = true;
        } 
        break;
      case 6: //moving 3
        r = new RectGrating(0, circleMask, rcolor6, colorDG, 4.0, 0.0, ang3, 0.3 );
        if (EXPERIMENT_NUMBER == 4) {
          r->choose = true;
        } 
        break;
      case 7: //static grating
        r = new RectGrating(50, circleMask, rcolor1, colorDG, 4.0, 0.5, ang3, 0.0 );
        if (EXPERIMENT_NUMBER == 7) {
          r->choose = true;
        } 
        break;
      case 8: //static grating
        r = new RectGrating(50, circleMask, rcolor, colorDG, 4.0, 0.5, ang2, 0.0 );
        break;
      case 9: //static grating
        r = new RectGrating(50, circleMask, rcolor, colorDG, 4.0, 0.5, ang1, 0.0 );
        break;

        
      default: //moving
        r = new RectGrating(0, circleMask, rcolor, colorDG, 5.0, 0.0, 0.0, 0.5 );
        break;
        
        
        
    }
    
    r->SetTranslate(vec3(ux, uy, 0.0));
    r->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
    r->SetScale(vec3(0.05, 0.05 * camera->aspect, 1.0));
    
    AddGeom(r);
    r->Transform();
    r1s[i] = r;
  }
  
  
  
  switch(EXPERIMENT_NUMBER) {
      
    case 10:
      selectRect = new RectGrating(99, circleMask, rcolor1, rcolor1, 0.01, 0.5, 0.0,  0.0 );
      break;
    case 11:
      selectRect = new RectGrating(99, circleMask, rcolor2, rcolor2, 0.01, 0.5, 0.0,  0.0 );
      break;
    case 12:
      selectRect = new RectGrating(99, circleMask, rcolor3, rcolor3, 0.0, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
      break;
    case 13:
      selectRect = new RectGrating(99, circleMask, rcolor4, rcolor4, 0.5, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
      break;
    case 14:
      selectRect = new RectGrating(0, circleMask, rcolor5, colorDG, 6.0, 0.0, ang1, 0.15 );
      
      break;
    case 15:
      selectRect = new RectGrating(0, circleMask, rcolor6, colorDG, 6.0, 0.0, ang2, 0.15 );
      
      break;
    case 16:
      selectRect = new RectGrating(50, circleMask, rcolor7, colorDG, 4.0, 0.5, ang3, 0.0 );
      
      break;
    case 17:
      selectRect = new RectGrating(50, circleMask, rcolor8, colorDG, 4.0, 0.5, ang4, 0.0 );
      
      break;
      
      
      
    case 0:
      selectRect = new RectGrating(99, circleMask, rcolor2, rcolor2, 0.0, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
      break;
      
    case 1:
      selectRect = new RectGrating(99, circleMask, rcolor2, rcolor2, 0.0, 0.0, 0.0, Utils::randomFloatBetween(0.05, 0.05) );
      break;
    case 2:
      selectRect = new RectGrating(0, circleMask, rcolor4, colorDG, 5.0, 0.0, ang1, 0.2 );
      break;
    case 3:
      selectRect = new RectGrating(0, circleMask, rcolor5, colorDG, 6.0, 0.0, ang2, 0.15 );
      break;
    case 4: 
      selectRect = new RectGrating(0, circleMask, rcolor6, colorDG, 4.0, 0.0, ang3, 0.3 );
      break;
    case 5:
    case 6:
      selectRect = new RectGrating(0, circleMask, rcolor4, colorDG, 5.0, 0.0, ang1, 0.2 );
      break;
    case 7:
      selectRect = new RectGrating(50, circleMask, rcolor1, colorDG, 4.0, 0.5, ang3, 0.0 );
      break;
      
  }
  
  selectRect->SetTranslate(vec3(-0.7, 0.4, 0.0));
  selectRect->SetScaleAnchor(vec3(0.5, 0.5, 0.0));
  selectRect->SetScale(vec3(0.07, 0.07 * camera->aspect, 1.0));
  selectRect->Transform();
  
  I_AM_READY = true;
  
}



void RendererColorCues::Render() { 
  
  if (!I_AM_READY) { printf("not ready!\n"); return; }
  
  
  bool cameraMoved = false;
  if (camera->IsTransformed()) {
    camera->Transform();
    cameraMoved = true;
  }
  
  BindDefaultFrameBuffer();
  
  Program* program = GetPrograms()["GratingPatch"]; 
  
  glClearColor(BACKGROUND_COLOR.x, BACKGROUND_COLOR.y, BACKGROUND_COLOR.z, BACKGROUND_COLOR.w);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
  //glBlendFunc(GL_ONE,GL_ONE);
  
  
  int i;
  set<Geom*>::iterator it;
  for (it=GetGeoms().begin(), i = 0; it!=GetGeoms().end(); it++, i++) {
    
    RectGrating* g = (RectGrating*) *it;
    g->phase += g->phaseSpeed;
    GratingFunctions::DrawGrating(NULL, program, g);
  }
  
  
  if (EXPERIMENT_NUMBER != 99) {
    
  // BindDefaultFrameBuffer();
  //textRect->Transform();
  Program* p1 = GetPrograms()["SingleTexture"]; 
  if (p1 == NULL) {
    printf("WHA???\n");
    exit(0);
  }
  p1->Bind(); {
    //printf("the modelview!\n");
    //textRect->GetModelView().Print();
      glUniformMatrix4fv(p1->Uniform("Modelview"), 1, 0, textRect->GetModelView().Pointer());
      glUniformMatrix4fv(p1->Uniform("Projection"), 1, 0, mat4::Identity().Pointer());
      
      instructionsTex->Bind(GL_TEXTURE0); {
        glUniform1i(p1->Uniform("s_tex"), 0);
        
        textRect->PassVertices(p1, GL_TRIANGLES);
        
      } instructionsTex->Unbind(GL_TEXTURE0);
    
  } p1->Unbind();
  
  
  selectRect->phase += selectRect->phaseSpeed;
  GratingFunctions::DrawGrating(NULL, program, selectRect);
  }
}

bool RendererColorCues::CheckIfAnyLeftOfKind(int kind) {
  
  RectGrating* rg = NULL;
  int howMany = 0;
  set<Geom*>::iterator it;
  for (it=GetGeoms().begin(); it!=GetGeoms().end(); it++) {
    RectGrating* g = (RectGrating*) *it;
    
    if (g->choose == true) {
      return true;
      
    }
  }
  
  
      return false;
  
}

void RendererColorCues::HandleTouchBegan(ivec2 mouse) {
  
  Geom* pg;
  bool isHit = false;
  
  int i;
  set<Geom*>::iterator it;
  for (it=GetGeoms().begin(), i = 0; it!=GetGeoms().end(); it++, i++) {
    RectGrating* g = (RectGrating*) *it;
    
    if (g->choose == true) {
      vec3 LL = mat4::Project(vec3(0.0,0.0,0.0), g->modelview, camera->projection, camera->viewport);
      vec3 UR = mat4::Project(vec3(1.0,1.0,0.0), g->modelview, camera->projection, camera->viewport);
      
      if (mouse.x > LL.x && mouse.x < UR.x && mouse.y > LL.y && mouse.y < UR.y) {
        //mouse.Print();
        //printf("hit!\n");
        isHit = true;
        pg = g;
        break;
      }
    }
  }
  
  if (isHit == true) {
    ((RectGrating*)(pg))->isSelected = true;
    ((RectGrating*)(pg))->choose = false;
    //RemoveGeom(pg);
  }
  if (!CheckIfAnyLeftOfKind(0)) {
    
    printf("total time : %f\n", ResourceHandler::GetResourceHandler()->GetElapsedTime());
    
    exit(0);
  }
  
}

