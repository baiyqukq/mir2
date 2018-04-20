{
 \file IntroScn.pas
}

unit IntroScn;

interface

uses
  windows, messages, sysutils, classes, graphics, stdctrls, controls, forms, dialogs,
  extctrls, dxdraws, dxclass, fstate, grobal2, cliutil, clfunc, soundutil,
  dxsounds, hutil32, scene;


const
   SELECTEDFRAME = 16;
   FREEZEFRAME = 13;
   EFFECTFRAME = 14;

type
   TIntroScene = class (TScene)
   private
   public
      constructor Create;
      destructor Destroy; override;
      procedure OpenScene; override;
      procedure CloseScene; override;
      procedure PlayScene (MSurface: TDirectDrawSurface); override;
   end;

   TLoginNotice = class (TScene)
   private
   public
      constructor Create;
      destructor Destroy; override;
   end;


implementation

uses
   ClMain, MShare, Share;


{------------------- TIntroScene ----------------------}


constructor TIntroScene.Create;
begin
   inherited Create (stIntro);
end;

destructor TIntroScene.Destroy;
begin
   inherited Destroy;
end;

procedure TIntroScene.OpenScene;
begin
end;

procedure TIntroScene.CloseScene;
begin
end;

procedure TIntroScene.PlayScene (MSurface: TDirectDrawSurface);
begin
end;

{--------------------------- TLoginNotice ----------------------------}

constructor TLoginNotice.Create;
begin
   inherited Create (stLoginNotice);
end;

destructor TLoginNotice.Destroy;
begin
   inherited Destroy;
end;

end.
