{
	@file Scene.pas
	Define abstract scene class
}

unit Scene

uses
	windows, messages, sysutils, classes, graphics, stdctrls, controls, forms, dialogs,
	extctrls, dxdraws, dxclass, fstate, grobal2, cliutil, clfunc, soundutil,
	dxsounds, hutil32, scene;

type
	TSceneType = (stIntro, stLogin, stSelectCountry, stSelectChr, stNewChr, stLoading,
                   stLoginNotice, stPlayGame);

	TScene = class
	public
		SceneType: TSceneType;
	public
		constructor Create (scenetype: TSceneType);
		procedure Initialize; dynamic;
		procedure Finalize; dynamic;
		procedure OpenScene; dynamic;
		procedure CloseScene; dynamic;
		procedure OpeningScene; dynamic;
		procedure KeyPress (var Key: Char); dynamic;
		procedure KeyDown (var Key: Word; Shift: TShiftState); dynamic;
		procedure MouseMove (Shift: TShiftState; X, Y: Integer); dynamic;
		procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
		procedure PlayScene (MSurface: TDirectDrawSurface); dynamic;
   end;

implementation

uses
	ClMain, MShare, Share;

	constructor TScene.Create (scenetype: TSceneType);
begin
	SceneType := scenetype;
end;

procedure TScene.Initialize;
begin
end;

procedure TScene.Finalize;
begin
end;

procedure TScene.OpenScene;
begin
end;

procedure TScene.CloseScene;
begin
end;

procedure TScene.OpeningScene;
begin
end;

procedure TScene.KeyPress (var Key: Char);
begin
end;

procedure TScene.KeyDown (var Key: Word; Shift: TShiftState);
begin
end;

procedure TScene.MouseMove (Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TScene.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TScene.PlayScene (MSurface: TDirectDrawSurface);
begin
end;
