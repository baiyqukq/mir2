unit SelectChrScene

interface

uses
	Share

type
	TSelChar = record
		Valid: Boolean;
		UserChr: TUserCharacterInfo;
		Selected: Boolean;
		FreezeState: Boolean; //TRUE:倔篮惑怕 FALSE:踌篮惑怕
		Unfreezing: Boolean; //踌绊 乐绰 惑怕牢啊?
		Freezing: Boolean;  //倔绊 乐绰 惑怕?
		AniIndex: integer;  //踌绰(绢绰) 局聪皋捞记
		DarkLevel: integer;
		EffIndex: integer;  //瓤苞 局聪皋捞记
		StartTime: longword;
		moretime: longword;
		startefftime: longword;
	end;

	TSelectChrScene = class (TScene)
	private
		SoundTimer: TTimer;
		CreateChrMode: Boolean;
		EdChrName: TEdit;
		procedure SoundOnTimer (Sender: TObject);
		procedure MakeNewChar (index: integer);
		procedure EdChrnameKeyPress (Sender: TObject; var Key: Char);
   public
		NewIndex: integer;
		ChrArr: array[0..1] of TSelChar;
		constructor Create;
		destructor Destroy; override;
		procedure OpenScene; override;
		procedure CloseScene; override;
		procedure PlayScene (MSurface: TDirectDrawSurface); override;
		procedure SelChrSelect1Click;
		procedure SelChrSelect2Click;
		procedure SelChrStartClick;
		procedure SelChrNewChrClick;
		procedure SelChrEraseChrClick;
		procedure SelChrCreditsClick;
		procedure SelChrExitClick;
		procedure SelChrNewClose;
		procedure SelChrNewJob (job: integer);
		procedure SelChrNewm_btSex (sex: integer);
		procedure SelChrNewPrevHair;
		procedure SelChrNewNextHair;
		procedure SelChrNewOk;
		procedure ClearChrs;
		procedure AddChr (uname: string; job, hair, level, sex: integer);
		procedure SelectChr (index: integer);
	end;

implementation
{-------------------- TSelectChrScene ------------------------}
constructor TSelectChrScene.Create;
begin
   CreateChrMode := FALSE;
   FillChar (ChrArr, sizeof(TSelChar)*2, #0);
   ChrArr[0].FreezeState := TRUE; //扁夯捞 倔绢 乐绰 惑怕
   ChrArr[1].FreezeState := TRUE;
   NewIndex := 0;
   EdChrName := TEdit.Create (FrmMain.Owner);
   with EdChrName do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 137;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Color := clWhite;
      ImeMode := LocalLanguage;
      MaxLength := 14;
      Visible := FALSE;
      OnKeyPress := EdChrnameKeyPress;
   end;
   SoundTimer := TTimer.Create (FrmMain.Owner);
   with SoundTimer do begin
      OnTimer := SoundOnTimer;
      Interval := 1;
      Enabled := FALSE;
   end;
   inherited Create (stSelectChr);
end;

destructor TSelectChrScene.Destroy;
begin
   inherited Destroy;
end;

procedure TSelectChrScene.OpenScene;
begin
   FrmDlg.DSelectChr.Visible := TRUE;
   SoundTimer.Enabled := TRUE;
   SoundTimer.Interval := 1;
end;

procedure TSelectChrScene.CloseScene;
begin
   SilenceSound;
   FrmDlg.DSelectChr.Visible := FALSE;
   SoundTimer.Enabled := FALSE;
end;

procedure TSelectChrScene.SoundOnTimer (Sender: TObject);
begin
   PlayBGM (bmg_select);
   SoundTimer.Enabled := FALSE;
   //SoundTimer.Interval := 38 * 1000;
end;

procedure TSelectChrScene.SelChrSelect1Click;
begin
   if (not ChrArr[0].Selected) and (ChrArr[0].Valid) then begin
      FrmMain.SelectChr(ChrArr[0].UserChr.Name);//2004/05/17
      ChrArr[0].Selected := TRUE;
      ChrArr[1].Selected := FALSE;
      ChrArr[0].Unfreezing := TRUE;
      ChrArr[0].AniIndex := 0;
      ChrArr[0].DarkLevel := 0;
      ChrArr[0].EffIndex := 0;
      ChrArr[0].StartTime := GetTickCount;
      ChrArr[0].MoreTime := GetTickCount;
      ChrArr[0].StartEffTime := GetTickCount;
      PlaySound (s_meltstone);
   end;
end;

procedure TSelectChrScene.SelChrSelect2Click;
begin
   if (not ChrArr[1].Selected) and (ChrArr[1].Valid) then begin
      FrmMain.SelectChr(ChrArr[1].UserChr.Name);//2004/05/17
      ChrArr[1].Selected := TRUE;
      ChrArr[0].Selected := FALSE;
      ChrArr[1].Unfreezing := TRUE;
      ChrArr[1].AniIndex := 0;
      ChrArr[1].DarkLevel := 0;
      ChrArr[1].EffIndex := 0;
      ChrArr[1].StartTime := GetTickCount;
      ChrArr[1].MoreTime := GetTickCount;
      ChrArr[1].StartEffTime := GetTickCount;
      PlaySound (s_meltstone);
   end;
end;

procedure TSelectChrScene.SelChrStartClick;
var
   chrname: string;
begin
   chrname := '';
   if ChrArr[0].Valid and ChrArr[0].Selected then chrname := ChrArr[0].UserChr.Name;
   if ChrArr[1].Valid and ChrArr[1].Selected then chrname := ChrArr[1].UserChr.Name;
   if chrname <> '' then begin
      if not g_boDoFadeOut and not g_boDoFadeIn then begin
         g_boDoFastFadeOut := TRUE;
         g_nFadeIndex := 29;
      end;
      FrmMain.SendSelChr (chrname);
   end else
      FrmDlg.DMessageDlg ('At first you should make new character.\If you select <NEW CHARACTER> you can make a new character.', [mbOk]);
end;

procedure TSelectChrScene.SelChrNewChrClick;
begin
   if not ChrArr[0].Valid or not ChrArr[1].Valid then begin
      if not ChrArr[0].Valid then MakeNewChar (0)
      else MakeNewChar (1);
   end else
      FrmDlg.DMessageDlg ('You can have up to 2 characters per server for every single account.', [mbOk]);
end;

procedure TSelectChrScene.SelChrEraseChrClick;
var
   n: integer;
begin
   n := 0;
   if ChrArr[0].Valid and ChrArr[0].Selected then n := 0;
   if ChrArr[1].Valid and ChrArr[1].Selected then n := 1;
   if (ChrArr[n].Valid) and (not ChrArr[n].FreezeState) and (ChrArr[n].UserChr.Name <> '') then begin
      //版绊 皋技瘤甫 焊辰促.
      if mrYes = FrmDlg.DMessageDlg ('"' + ChrArr[n].UserChr.Name + '" Removed characters may not be restored.\' +
                                                                    'You will not be able to use the same charcter name for a while.\' +
                                                                    'Are you sure you want to delete character?', [mbYes, mbNo, mbCancel]) then
         FrmMain.SendDelChr (ChrArr[n].UserChr.Name);
   end;
end;

procedure TSelectChrScene.SelChrCreditsClick;
begin
end;

procedure TSelectChrScene.SelChrExitClick;
begin
   FrmMain.Close;
end;

procedure TSelectChrScene.ClearChrs;
begin
   FillChar (ChrArr, sizeof(TSelChar)*2, #0);
   ChrArr[0].FreezeState := FALSE;
   ChrArr[1].FreezeState := TRUE; //扁夯捞 倔绢 乐绰 惑怕
   ChrArr[0].Selected := TRUE;
   ChrArr[1].Selected := FALSE;
   ChrArr[0].UserChr.Name := '';
   ChrArr[1].UserChr.Name := '';
end;

procedure TSelectChrScene.AddChr (uname: string; job, hair, level, sex: integer);
var
   n: integer;
begin
   if not ChrArr[0].Valid then n := 0
   else if not ChrArr[1].Valid then n := 1
   else exit;
   ChrArr[n].UserChr.Name := uname;
   ChrArr[n].UserChr.Job := job;
   ChrArr[n].UserChr.Hair := hair;
   ChrArr[n].UserChr.Level := level;
   ChrArr[n].UserChr.Sex := sex;
   ChrArr[n].Valid := TRUE;
end;

procedure TSelectChrScene.MakeNewChar (index: integer);
begin
   CreateChrMode := TRUE;
   NewIndex := index;
   if index = 0 then begin
      FrmDlg.DCreateChr.Left := 415;
      FrmDlg.DCreateChr.Top := 15;
   end else begin
      FrmDlg.DCreateChr.Left := 75;
      FrmDlg.DCreateChr.Top := 15;
   end;
   FrmDlg.DCreateChr.Visible := TRUE;
   ChrArr[NewIndex].Valid := TRUE;
   ChrArr[NewIndex].FreezeState := FALSE;
   EdChrName.Left := FrmDlg.DCreateChr.Left + 71;
   EdChrName.Top  := FrmDlg.DCreateChr.Top + 107;
   EdChrName.Visible := TRUE;
   EdChrName.SetFocus;
   SelectChr (NewIndex);
   FillChar (ChrArr[NewIndex].UserChr, sizeof(TUserCharacterInfo), #0);
end;

procedure TSelectChrScene.EdChrnameKeyPress (Sender: TObject; var Key: Char);
begin

end;


procedure TSelectChrScene.SelectChr (index: integer);
begin
   ChrArr[index].Selected := TRUE;
   ChrArr[index].DarkLevel := 30;
   ChrArr[index].StartTime := GetTickCount;
   ChrArr[index].Moretime := GetTickCount;
   if index = 0 then ChrArr[1].Selected := FALSE
   else ChrArr[0].Selected := FALSE;
end;

procedure TSelectChrScene.SelChrNewClose;
begin
   ChrArr[NewIndex].Valid := FALSE;
   CreateChrMode := FALSE;
   FrmDlg.DCreateChr.Visible := FALSE;
   EdChrName.Visible := FALSE;
   if NewIndex = 1 then begin
      ChrArr[0].Selected := TRUE;
      ChrArr[0].FreezeState := FALSE;
   end;
end;

procedure TSelectChrScene.SelChrNewOk;
var
   chrname, shair, sjob, ssex: string;
begin
   chrname := Trim(EdChrName.Text);
   if chrname <> '' then begin
      ChrArr[NewIndex].Valid := FALSE;
      CreateChrMode := FALSE;
      FrmDlg.DCreateChr.Visible := FALSE;
      EdChrName.Visible := FALSE;
      if NewIndex = 1 then begin
         ChrArr[0].Selected := TRUE;
         ChrArr[0].FreezeState := FALSE;
      end;
      shair := IntToStr(1 + Random(5)); //////****IntToStr(ChrArr[NewIndex].UserChr.Hair);
      sjob  := IntToStr(ChrArr[NewIndex].UserChr.Job);
      ssex  := IntToStr(ChrArr[NewIndex].UserChr.Sex);
      FrmMain.SendNewChr (FrmMain.LoginId, chrname, shair, sjob, ssex); //货 某腐磐甫 父电促.
   end;
end;

procedure TSelectChrScene.SelChrNewJob (job: integer);
begin
   if (job in [0..2]) and (ChrArr[NewIndex].UserChr.Job <> job) then begin
      ChrArr[NewIndex].UserChr.Job := job;
      SelectChr (NewIndex);
   end;
end;

procedure TSelectChrScene.SelChrNewm_btSex (sex: integer);
begin
   if sex <> ChrArr[NewIndex].UserChr.Sex then begin
      ChrArr[NewIndex].UserChr.Sex := sex;
      SelectChr (NewIndex);
   end;
end;

procedure TSelectChrScene.SelChrNewPrevHair;
begin
end;

procedure TSelectChrScene.SelChrNewNextHair;
begin
end;

procedure TSelectChrScene.PlayScene (MSurface: TDirectDrawSurface);
var
   n, bx, by, fx, fy, img: integer;
   ex, ey:Integer;		// The position of effect light when a charactor is selected
   d, e, dd: TDirectDrawSurface;
   svname: string;
begin
{$IF SWH = SWH800}
   d := g_WMainImages.Images[65];
{$ELSEIF SWH = SWH1024}
//   d := g_WMainImages.Images[82];
   d := g_WMainImages.Images[65];
{$IFEND}
   // Show select charactor background image
   if d <> nil then begin
//      MSurface.Draw (0, 0, d.ClientRect, d, FALSE);
      MSurface.Draw ((SCREENWIDTH - d.Width) div 2,(SCREENHEIGHT - d.Height) div 2, d.ClientRect, d, FALSE);
   end;

   bx:=0;
   by:=0;
   fx:=0;
   fy:=0;//Jacky

   for n:=0 to 1 do begin
      if ChrArr[n].Valid then begin
		 // e: effect, b: back, f: front
         ex := (SCREENWIDTH - 800) div 2 + 90{90};
         ey := (SCREENHEIGHT - 600) div 2 + 60-2{60-2};

         case ChrArr[n].UserChr.Job of
            0: begin
               if ChrArr[n].UserChr.Sex = 0 then begin	// Male
                  bx := (SCREENWIDTH - 800) div 2 + 71{71};
                  by := (SCREENHEIGHT - 600) div 2 + 75-23{75-23}; 
                  fx := bx;
                  fy := by;
               end else begin	// Female
                  bx := (SCREENWIDTH - 800) div 2 + 65{65};
                  by := (SCREENHEIGHT - 600) div 2 + 75-2-18{75-2-18};  //Stone state
                  fx := bx-28+28;
                  fy := by-16+16;    // Move state
               end;
            end;
            1: begin
               if ChrArr[n].UserChr.Sex = 0 then begin
                  bx := (SCREENWIDTH - 800) div 2 + 77{77};
                  by := (SCREENHEIGHT - 600) div 2 + 75-29{75-29};
                  fx := bx;
                  fy := by;
               end else begin
                  bx := (SCREENWIDTH - 800) div 2 + 141+30{141+30};
                  by := (SCREENHEIGHT - 600) div 2 + 85+14-2{85+14-2};
                  fx := bx-30;
                  fy := by-14;
               end;
            end;
            2: begin
               if ChrArr[n].UserChr.Sex = 0 then begin
                  bx := (SCREENWIDTH - 800) div 2 + 85{85};
                  by := (SCREENHEIGHT - 600) div 2 + 75-12{75-12};
                  fx := bx;
                  fy := by;
               end else begin
                  bx := (SCREENWIDTH - 800) div 2 + 141+23{141+23};
                  by := (SCREENHEIGHT - 600) div 2 + 85+20-2{85+20-2};
                  fx := bx-23;
                  fy := by-20;
               end;
            end;
         end;

		 // Right
         if n = 1 then begin
            ex := (SCREENWIDTH - 800) div 2 + 430{430};
            ey := (SCREENHEIGHT - 600) div 2 + 60{60};
            bx := bx + 340;
            by := by + 2;
            fx := fx + 340;
            fy := fy + 2;
         end;
         
		 if ChrArr[n].Unfreezing then begin 
            img := 140 - 80 + ChrArr[n].UserChr.Job * 40 + ChrArr[n].UserChr.Sex * 120;
            d := g_WChrSelImages.Images[img + ChrArr[n].aniIndex];
            e := g_WChrSelImages.Images[4 + ChrArr[n].effIndex];
            if d <> nil then MSurface.Draw (bx, by, d.ClientRect, d, TRUE);
            if e <> nil then DrawBlend (MSurface, ex, ey, e, 1);

            if GetTickCount - ChrArr[n].StartTime > 50{120} then begin
               ChrArr[n].StartTime := GetTickCount;
               ChrArr[n].aniIndex := ChrArr[n].aniIndex + 1;
            end;

            if GetTickCount - ChrArr[n].startefftime >50{ 110} then begin
               ChrArr[n].startefftime := GetTickCount;
               ChrArr[n].effIndex := ChrArr[n].effIndex + 1;
               //if ChrArr[n].effIndex > EFFECTFRAME-1 then
               //   ChrArr[n].effIndex := EFFECTFRAME-1;
            end;

            if ChrArr[n].aniIndex > FREEZEFRAME-1 then begin
               ChrArr[n].Unfreezing := FALSE; 
               ChrArr[n].FreezeState := FALSE;
               ChrArr[n].aniIndex := 0;
            end;

         end else
            if not ChrArr[n].Selected and (not ChrArr[n].FreezeState and not ChrArr[n].Freezing) then begin //急琶登瘤 臼疽绰单 踌酒乐栏搁
               ChrArr[n].Freezing := TRUE;
               ChrArr[n].aniIndex := 0;
               ChrArr[n].StartTime := GetTickCount;
            end;

			if ChrArr[n].Freezing then begin 
			   img := 140 - 80 + ChrArr[n].UserChr.Job * 40 + ChrArr[n].UserChr.Sex * 120;
			   d := g_WChrSelImages.Images[img + FREEZEFRAME - ChrArr[n].aniIndex - 1];
			   if d <> nil then MSurface.Draw (bx, by, d.ClientRect, d, TRUE);

			   if GetTickCount - ChrArr[n].StartTime > 50 then begin
				  ChrArr[n].StartTime := GetTickCount;
				  ChrArr[n].aniIndex := ChrArr[n].aniIndex + 1;
			   end;

			   if ChrArr[n].aniIndex > FREEZEFRAME-1 then begin
				  ChrArr[n].Freezing := FALSE; 
				  ChrArr[n].FreezeState := TRUE;
				  ChrArr[n].aniIndex := 0;
			  end;
			end;

			if not ChrArr[n].Unfreezing and not ChrArr[n].Freezing then begin
			   if not ChrArr[n].FreezeState then begin  //踌酒乐绰惑怕
               img := 120 - 80 + ChrArr[n].UserChr.Job * 40 + ChrArr[n].aniIndex + ChrArr[n].UserChr.Sex * 120;
               d := g_WChrSelImages.Images[img];
               if d <> nil then begin
                  if ChrArr[n].DarkLevel > 0 then begin
                     dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
                     dd.SystemMemory := TRUE;
                     dd.SetSize (d.Width, d.Height);
                     dd.Draw (0, 0, d.ClientRect, d, FALSE);
                     MakeDark (dd, 30-ChrArr[n].DarkLevel);
                     MSurface.Draw (fx, fy, dd.ClientRect, dd, TRUE);
                     dd.Free;
                  end else
                     MSurface.Draw (fx, fy, d.ClientRect, d, TRUE);
               end;

            end else begin      // Freeze state
               img := 140 - 80 + ChrArr[n].UserChr.Job * 40 + ChrArr[n].UserChr.Sex * 120;
               d := g_WChrSelImages.Images[img];
               if d <> nil then
                  MSurface.Draw (bx, by, d.ClientRect, d, TRUE);
            end;

            if ChrArr[n].Selected then begin
               if GetTickCount - ChrArr[n].StartTime > 300 then begin
                  ChrArr[n].StartTime := GetTickCount;
                  ChrArr[n].aniIndex := ChrArr[n].aniIndex + 1;
                  if ChrArr[n].aniIndex > SELECTEDFRAME-1 then
                     ChrArr[n].aniIndex := 0;
               end;
               if GetTickCount - ChrArr[n].moretime > 25 then begin
                  ChrArr[n].moretime := GetTickCount;
                  if ChrArr[n].DarkLevel > 0 then
                     ChrArr[n].DarkLevel := ChrArr[n].DarkLevel - 1;
               end;
            end;
         end;

         // Show charactors' data
         if n = 0 then begin	// Left
            if ChrArr[n].UserChr.Name <> '' then begin
               with MSurface do begin
                  SetBkMode (Canvas.Handle, TRANSPARENT);
                  BoldTextOut (MSurface, (SCREENWIDTH - 800) div 2 + 117{117}, (SCREENHEIGHT - 600) div 2 + 492+2 {492+2}, clWhite, clBlack, ChrArr[n].UserChr.Name);
                  BoldTextOut (MSurface, (SCREENWIDTH - 800) div 2 + 117{117}, (SCREENHEIGHT - 600) div 2 + 523{523}, clWhite, clBlack, IntToStr(ChrArr[n].UserChr.Level));
                  BoldTextOut (MSurface, (SCREENWIDTH - 800) div 2 + 117{117}, (SCREENHEIGHT - 600) div 2 + 553{553}, clWhite, clBlack, GetJobName(ChrArr[n].UserChr.Job));
                  Canvas.Release;
               end;
            end;
         end else begin			// Right
            if ChrArr[n].UserChr.Name <> '' then begin
               with MSurface do begin
                  SetBkMode (Canvas.Handle, TRANSPARENT);
                  BoldTextOut (MSurface, (SCREENWIDTH - 800) div 2 + 671{671}, (SCREENHEIGHT - 600) div 2 + 492+2 {492+4}, clWhite, clBlack, ChrArr[n].UserChr.Name);
                  BoldTextOut (MSurface, (SCREENWIDTH - 800) div 2 + 671{671}, (SCREENHEIGHT - 600) div 2 + 525+2 {525}, clWhite, clBlack, IntToStr(ChrArr[n].UserChr.Level));
                  BoldTextOut (MSurface, (SCREENWIDTH - 800) div 2 + 671{671}, (SCREENHEIGHT - 600) div 2 + 555+2 {555}, clWhite, clBlack, GetJobName(ChrArr[n].UserChr.Job));
                  Canvas.Release;
               end;
            end;
         end;

		 // Show server's name
         with MSurface do begin
            SetBkMode (Canvas.Handle, TRANSPARENT);

            if BO_FOR_TEST then 
				svname := 'Debug Server'
            else
				svname := g_sServerName;

            BoldTextOut (MSurface, SCREENWIDTH div 2{400} - Canvas.TextWidth(svname) div 2, (SCREENHEIGHT - 600) div 2 + 8{8}, clWhite, clBlack, svname);
            Canvas.Release;
         end;
      end;
   end;
end;
