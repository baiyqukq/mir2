type
   TLoginState = (lsLogin, lsNewid, lsNewidRetry, lsChgpw, lsCloseAll);

   TLoginScene = class (TScene)
   private
     m_EdId           :TEdit;
     m_EdPasswd       :TEdit;
     m_EdNewId        :TEdit;
     m_EdNewPasswd    :TEdit;
     m_EdConfirm      :TEdit;
     m_EdYourName     :TEdit;
     m_EdSSNo         :TEdit;
     m_EdBirthDay     :TEdit;
     m_EdQuiz1        :TEdit;
     m_EdAnswer1      :TEdit;
     m_EdQuiz2        :TEdit;
     m_EdAnswer2      :TEdit;
     m_EdPhone        :TEdit;
     m_EdMobPhone     :TEdit;
     m_EdEMail        :TEdit;
     m_EdChgId        :TEdit;
     m_EdChgCurrentpw :TEdit;
     m_EdChgNewPw     :TEdit;
     m_EdChgRepeat    :TEdit;
     m_nCurFrame      :Integer;
     m_nMaxFrame      :Integer;
     m_dwStartTime    :LongWord;  //茄 橇贰烙寸 矫埃
     m_boNowOpening   :Boolean;
     m_boOpenFirst    :Boolean;
     m_NewIdRetryUE   :TUserEntry;
     m_NewIdRetryAdd  :TUserEntryAdd;
     procedure EdLoginIdKeyPress (Sender: TObject; var Key: Char);
     procedure EdLoginPasswdKeyPress (Sender: TObject; var Key: Char);
     procedure EdNewIdKeyPress (Sender: TObject; var Key: Char);
     procedure EdNewOnEnter (Sender: TObject);
     function  CheckUserEntrys: Boolean;
     function  NewIdCheckNewId: Boolean;
     function  NewIdCheckSSno: Boolean;
     function  NewIdCheckBirthDay: Boolean;
   public
     m_sLoginId            :String;
     m_sLoginPasswd        :String;
     m_boUpdateAccountMode :Boolean;
     constructor Create;
      destructor Destroy; override;
      procedure OpenScene; override;
      procedure CloseScene; override;
      procedure PlayScene (MSurface: TDirectDrawSurface); override;
      procedure ChangeLoginState (state: TLoginState);
      procedure NewClick;
      procedure NewIdRetry (boupdate: Boolean);
      procedure UpdateAccountInfos (ue: TUserEntry);
      procedure OkClick;
      procedure ChgPwClick;
      procedure NewAccountOk;
      procedure NewAccountClose;
      procedure ChgpwOk;
      procedure ChgpwCancel;
      procedure HideLoginBox;
      procedure OpenLoginDoor;
      procedure PassWdFail;
   end;

implementation
{--------------------- implementation ----------------------}
constructor TLoginScene.Create;
var
   nx, ny: integer;
begin
   inherited Create (stLogin);


   m_EdId := TEdit.Create (FrmMain.Owner);
   with m_EdId do begin
      Parent := FrmMain;
      Color  := clBlack;
      Font.Color := clWhite;
      Font.Size := 10;
      MaxLength := 10;
      BorderStyle := bsNone;
      OnKeyPress := EdLoginIdKeyPress;
      Visible := FALSE;
      Tag := 10;
   end;

   m_EdPasswd := TEdit.Create (FrmMain.Owner);
   with m_EdPasswd do begin
      Parent := FrmMain; Color  := clBlack; Font.Size := 10; MaxLength := 10; Font.Color := clWhite;
      BorderStyle := bsNone; PasswordChar := '*';
      OnKeyPress := EdLoginPasswdKeyPress; Visible := FALSE;
      Tag := 10;
   end;

   nx := SCREENWIDTH div 2 - 320 {192}{79};
   ny := SCREENHEIGHT div 2 - 238{146}{64};
   
   m_EdNewId := TEdit.Create (FrmMain.Owner);
   with m_EdNewId do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 116;
      Left := nx + 161;
      Top  := ny + 116;
      BorderStyle := bsNone; Color := clBlack; Font.Color := clWhite; MaxLength := 10;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;


   m_EdNewPasswd := TEdit.Create (FrmMain.Owner);
   with m_EdNewPasswd do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 116;
      Left := nx + 161;
      Top  := ny + 137;
      BorderStyle := bsNone; Color := clBlack; Font.Color := clWhite; MaxLength := 10;
      PasswordChar := '*'; Visible := FALSE;  OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdConfirm := TEdit.Create (FrmMain.Owner);
   with m_EdConfirm do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 116;
      Left := nx + 161;
      Top  := ny + 158;
      BorderStyle := bsNone; Color := clBlack; Font.Color := clWhite; MaxLength := 10;
      PasswordChar := '*';  Visible := FALSE;  OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdYourName := TEdit.Create (FrmMain.Owner);
   with m_EdYourName do begin
      Parent := FrmMain; Height := 16; Width  := 116; Left := nx + 161; Top  := ny + 187;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 20;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdSSNo := TEdit.Create (FrmMain.Owner);
   with m_EdSSNo do begin
      Parent := FrmMain; Height := 16; Width  := 116; Left := nx + 161; Top  := ny + 207;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 14;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdBirthDay := TEdit.Create (FrmMain.Owner);
   with m_EdBirthDay do begin
      Parent := FrmMain; Height := 16; Width  := 116; Left := nx + 161; Top  := ny + 227;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 10;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdQuiz1 := TEdit.Create (FrmMain.Owner);
   with m_EdQuiz1 do begin
      Parent := FrmMain;  Height := 16; Width  := 163; Left := nx + 161; Top  := ny + 256;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 20;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdAnswer1 := TEdit.Create (FrmMain.Owner);
   with m_EdAnswer1 do begin
      Parent := FrmMain;  Height := 16; Width  := 163; Left := nx + 161; Top  := ny + 276;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 12;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdQuiz2 := TEdit.Create (FrmMain.Owner);
   with m_EdQuiz2 do begin
      Parent := FrmMain;  Height := 16; Width  := 163; Left := nx + 161; Top  := ny + 297;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 20;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdAnswer2 := TEdit.Create (FrmMain.Owner);
   with m_EdAnswer2 do begin
      Parent := FrmMain;  Height := 16; Width  := 163; Left := nx + 161; Top  := ny + 317;
      BorderStyle := bsNone; Color  := clBlack; Font.Color := clWhite; MaxLength := 12;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdPhone := TEdit.Create (FrmMain.Owner);
   with m_EdPhone do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 116;
      Left := nx + 161;
      Top  := ny + 347;
      BorderStyle := bsNone;
      Color  := clBlack;
      Font.Color := clWhite;
      MaxLength := 14;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdMobPhone := TEdit.Create (FrmMain.Owner);
   with m_EdMobPhone do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 116;
      Left := nx + 161;
      Top  := ny + 368;
      BorderStyle := bsNone;
      Color  := clBlack;
      Font.Color := clWhite;
      MaxLength := 13;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdEMail := TEdit.Create (FrmMain.Owner);
   with m_EdEMail do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 116;
      Left := nx + 161;
      Top  := ny + 388;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Color := clWhite;
      MaxLength := 40;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 11;
   end;

   nx := SCREENWIDTH div 2 - 210 {192}{192};
   ny := SCREENHEIGHT div 2 - 150{146}{150};
   m_EdChgId := TEdit.Create (FrmMain.Owner);
   with m_EdChgId do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 137;
      Left := nx+239;
      Top  := ny+117;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Color := clWhite;
      MaxLength := 10;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
   m_EdChgCurrentpw := TEdit.Create (FrmMain.Owner);
   with m_EdChgCurrentpw do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 137;
      Left := nx+239;
      Top  := ny+149;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*';
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
   m_EdChgNewPw := TEdit.Create (FrmMain.Owner);
   with m_EdChgNewPw do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 137;
      Left := nx+239;
      Top  := ny+176;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*';
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
   m_EdChgRepeat := TEdit.Create (FrmMain.Owner);
   with m_EdChgRepeat do begin
      Parent := FrmMain;
      Height := 16;
      Width  := 137;
      Left := nx+239;
      Top  := ny+208;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*';
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
end;

destructor TLoginScene.Destroy;
begin
   inherited Destroy;
end;

procedure TLoginScene.OpenScene;
var
   i: integer;
   d: TDirectDrawSurface;
begin
   
   m_nCurFrame := 0;
   m_nMaxFrame := 10;
   m_sLoginId := '';
   m_sLoginPasswd := '';

   with m_EdId do begin
      Left   := SCREENWIDTH div 2 - 68 + 18{350};
      Top    := SCREENHEIGHT div 2  - 8 - 34 {259};
      Height := 16;
      Width  := 137;
      Visible := FALSE;
   end;
   with m_EdPasswd do begin
      Left   := SCREENWIDTH div 2 - 68 + 18{350};
      Top    := SCREENHEIGHT div 2  - 8 - 2 {291};
      Height := 16;
      Width  := 137;
      Visible := FALSE;
   end;
   m_boOpenFirst := TRUE;

   FrmDlg.DLogin.Visible := TRUE;
   FrmDlg.DNewAccount.Visible := FALSE;
   m_boNowOpening := FALSE;
   PlayBGM (bmg_intro);

end;

procedure TLoginScene.CloseScene;
begin
   m_EdId.Visible := FALSE;
   m_EdPasswd.Visible := FALSE;
   FrmDlg.DLogin.Visible := FALSE;
   SilenceSound;
end;

procedure TLoginScene.EdLoginIdKeyPress (Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      Key := #0;
      m_sLoginId := LowerCase(m_EdId.Text);
      if m_sLoginId <> '' then begin
         m_EdPasswd.SetFocus;
      end;
   end;
end;

procedure TLoginScene.EdLoginPasswdKeyPress (Sender: TObject; var Key: Char);
begin
   if (Key = '~') or (Key = '''') then Key := '_';
   if Key = #13 then begin
      Key := #0;
      m_sLoginId := LowerCase(m_EdId.Text);
      m_sLoginPasswd := m_EdPasswd.Text;
      if (m_sLoginId <> '') and (m_sLoginPasswd <> '') then begin
         //拌沥栏肺 肺弊牢 茄促.
         FrmMain.SendLogin (m_sLoginId, m_sLoginPasswd);
         m_EdId.Text := '';
         m_EdPasswd.Text := '';
         m_EdId.Visible := FALSE;
         m_EdPasswd.Visible := FALSE;
      end else
         if (m_EdId.Visible) and (m_EdId.Text = '') then m_EdId.SetFocus;
   end;
end;

procedure TLoginScene.PassWdFail;
begin

   m_EdId.Visible := TRUE;
   m_EdPasswd.Visible := TRUE;
   m_EdId.SetFocus;
end;


function  TLoginScene.NewIdCheckNewId: Boolean;
begin
   Result := TRUE;
   m_EdNewId.Text := Trim(m_EdNewId.Text);
   if Length(m_EdNewId.Text) < 3 then begin
      FrmDlg.DMessageDlg ('登录帐号的长度必须大于3位.', [mbOk]);
      Beep;
      m_EdNewId.SetFocus;
      Result := FALSE;
   end;
end;

function  TLoginScene.NewIdCheckSSno: Boolean;
var
   str, t1, t2, t3, syear, smon, sday: string;
   ayear, amon, aday, sex: integer;
   flag: Boolean;
begin
   Result := TRUE;
   str := m_EdSSNo.Text;
   str := GetValidStr3 (str, t1, ['-']);
   GetValidStr3 (str, t2, ['-']);
   flag := TRUE;
   if (Length(t1) = 6) and (Length(t2) = 7) then begin
      smon := Copy(t1, 3, 2);
      sday := Copy(t1, 5, 2);
      amon := Str_ToInt (smon, 0);
      aday := Str_ToInt (sday, 0);
      if (amon <= 0) or (amon > 12) then flag := FALSE;
      if (aday <= 0) or (aday > 31) then flag := FALSE;
      sex := Str_ToInt (Copy(t2, 1, 1), 0);
      if (sex <= 0) or (sex > 2) then flag := FALSE;
   end else flag := FALSE;
   if not flag then begin
      Beep;
      m_EdSSNo.SetFocus;
      Result := FALSE;
   end;
end;

function  TLoginScene.NewIdCheckBirthDay: Boolean;
var
   str, t1, t2, t3, syear, smon, sday: string;
   ayear, amon, aday, sex: integer;
   flag: Boolean;
begin
   Result := TRUE;
   flag := TRUE;
   str := m_EdBirthDay.Text;
   str := GetValidStr3 (str, syear, ['/']);
   str := GetValidStr3 (str, smon, ['/']);
   str := GetValidStr3 (str, sday, ['/']);
   ayear := Str_ToInt(syear, 0);
   amon := Str_ToInt(smon, 0);
   aday := Str_ToInt(sday, 0);
   if (ayear <= 1890) or (ayear > 2101) then flag := FALSE;
   if (amon <= 0) or (amon > 12) then flag := FALSE;
   if (aday <= 0) or (aday > 31) then flag := FALSE;
   if not flag then begin
      Beep;
      m_EdBirthDay.SetFocus;
      Result := FALSE;
   end;
end;

procedure TLoginScene.EdNewIdKeyPress (Sender: TObject; var Key: Char);
var
   str, t1, t2, t3, syear, smon, sday: string;
   ayear, amon, aday, sex: integer;
   flag: Boolean;
begin
   if (Sender = m_EdNewPasswd) or (Sender = m_EdChgNewPw) or (Sender = m_EdChgRepeat) then
      if (Key = '~') or (Key = '''') or (Key = ' ') then Key := #0;
   if Key = #13 then begin
      Key := #0;
      if Sender = m_EdNewId then begin
         if not NewIdCheckNewId then
            exit;
      end;
      if Sender = m_EdNewPasswd then begin
         if Length(m_EdNewPasswd.Text) < 4 then begin
            FrmDlg.DMessageDlg ('密码长度必须大于 4位.', [mbOk]);
            Beep;
            m_EdNewPasswd.SetFocus;
            exit;
         end;
      end;
      if Sender = m_EdConfirm then begin
         if m_EdNewPasswd.Text <> m_EdConfirm.Text then begin
            FrmDlg.DMessageDlg ('二次输入的密码不一至！！！', [mbOk]);
            Beep;
            m_EdConfirm.SetFocus;
            exit;
         end;
      end;
      if (Sender = m_EdYourName) or (Sender = m_EdQuiz1) or (Sender = m_EdAnswer1) or
         (Sender = m_EdQuiz2) or (Sender = m_EdAnswer2) or (Sender = m_EdPhone) or
         (Sender = m_EdMobPhone) or (Sender = m_EdEMail)
      then begin
         TEdit(Sender).Text := Trim(TEdit(Sender).Text);
         if TEdit(Sender).Text = '' then begin
            Beep;
            TEdit(Sender).SetFocus;
            exit;
         end;
      end;
      if (Sender = m_EdSSNo) and (not EnglishVersion) then begin  //茄惫牢 版快.. 林刮殿废锅龋 埃帆 盲农
         if not NewIdCheckSSno then
            exit;
      end;
      if Sender = m_EdBirthDay then begin
         if not NewIdCheckBirthDay then
            exit;
      end;
      if TEdit(Sender).Text <> '' then begin
         if Sender = m_EdNewId then m_EdNewPasswd.SetFocus;
         if Sender = m_EdNewPasswd then m_EdConfirm.SetFocus;
         if Sender = m_EdConfirm then m_EdYourName.SetFocus;
         if Sender = m_EdYourName then m_EdSSNo.SetFocus;
         if Sender = m_EdSSNo then m_EdBirthDay.SetFocus;
         if Sender = m_EdBirthDay then m_EdQuiz1.SetFocus;
         if Sender = m_EdQuiz1 then m_EdAnswer1.SetFocus;
         if Sender = m_EdAnswer1 then m_EdQuiz2.SetFocus;
         if Sender = m_EdQuiz2 then m_EdAnswer2.SetFocus;
         if Sender = m_EdAnswer2 then m_EdPhone.SetFocus;
         if Sender = m_EdPhone then m_EdMobPhone.SetFocus;
         if Sender = m_EdMobPhone then m_EdEMail.SetFocus;
         if Sender = m_EdEMail then begin
            if m_EdNewId.Enabled then m_EdNewId.SetFocus
            else if m_EdNewPasswd.Enabled then m_EdNewPasswd.SetFocus;
         end;

         if Sender = m_EdChgId then m_EdChgCurrentpw.SetFocus;
         if Sender = m_EdChgCurrentpw then m_EdChgNewPw.SetFocus;
         if Sender = m_EdChgNewPw then m_EdChgRepeat.SetFocus;
         if Sender = m_EdChgRepeat then m_EdChgId.SetFocus;
      end;
   end;
end;

procedure TLoginScene.EdNewOnEnter (Sender: TObject);
var
   hx, hy: integer;
begin
   //腮飘
   FrmDlg.NAHelps.Clear;
   hx := TEdit(Sender).Left + TEdit(Sender).Width + 10;
   hy := TEdit(Sender).Top + TEdit(Sender).Height - 18;
   if Sender = m_EdNewId then begin
      FrmDlg.NAHelps.Add ('Your ID can be a combination of');
      FrmDlg.NAHelps.Add ('characters and numbers and');
      FrmDlg.NAHelps.Add ('it must be a minimum of 4 letters.');
      FrmDlg.NAHelps.Add ('Your ID is not your character');
      FrmDlg.NAHelps.Add ('name in the game, Choose your ID');
      FrmDlg.NAHelps.Add ('carefully, because it is essential');
      FrmDlg.NAHelps.Add ('to use all our services.');
      FrmDlg.NAHelps.Add ('');
      FrmDlg.NAHelps.Add ('We suggest you use a different');
      FrmDlg.NAHelps.Add ('name from the one you would like');
      FrmDlg.NAHelps.Add ('to use for your character.');
   end;
   if Sender = m_EdNewPasswd then begin
      FrmDlg.NAHelps.Add ('Your password can be a');
      FrmDlg.NAHelps.Add ('combination of characters');
      FrmDlg.NAHelps.Add ('and numbers and it must be a');
      FrmDlg.NAHelps.Add ('minimum of 4 letters.');
      FrmDlg.NAHelps.Add ('');
      FrmDlg.NAHelps.Add ('Remember that your password is');
      FrmDlg.NAHelps.Add ('essential to play our game,');
      FrmDlg.NAHelps.Add ('so be sure to make a note of it.');
      FrmDlg.NAHelps.Add ('');
      FrmDlg.NAHelps.Add ('We advise you to not use');
      FrmDlg.NAHelps.Add ('a simple password');
      FrmDlg.NAHelps.Add ('to avoid the risk');
      FrmDlg.NAHelps.Add ('of account hacking.');
   end;
   if Sender = m_EdConfirm then begin
      FrmDlg.NAHelps.Add ('Type password again');
      FrmDlg.NAHelps.Add ('for confirmation.');
      FrmDlg.NAHelps.Add ('');
   end;
   if Sender = m_EdYourName then begin
      FrmDlg.NAHelps.Add ('Type your full name.');
      FrmDlg.NAHelps.Add ('');
   end;
   if Sender = m_EdSSNo then begin
      FrmDlg.NAHelps.Add ('Not used');
      FrmDlg.NAHelps.Add ('at this time.');
      FrmDlg.NAHelps.Add ('');
   end;
   if Sender = m_EdBirthDay then begin
      FrmDlg.NAHelps.Add ('Please type your birth date, month,');
      FrmDlg.NAHelps.Add ('years. ex)1975/08/21)');
      FrmDlg.NAHelps.Add ('');
   end;
   if (Sender = m_EdQuiz1) or (Sender = m_EdQuiz2) then begin
      FrmDlg.NAHelps.Add ('Please type a question only');
      FrmDlg.NAHelps.Add ('you know the answer to.');
      FrmDlg.NAHelps.Add ('');
   end;
   if (Sender = m_EdAnswer1) or (Sender = m_EdAnswer2) then begin
      FrmDlg.NAHelps.Add ('please type an answer to the');
      FrmDlg.NAHelps.Add ('above question.');
      FrmDlg.NAHelps.Add ('');
   end;
   if (Sender=m_EdYourName) or (Sender=m_EdSSNo) or (Sender=m_EdQuiz1) or (Sender=m_EdQuiz2) or (Sender=m_EdAnswer1) or (Sender=m_EdAnswer2) then begin
      FrmDlg.NAHelps.Add ('You are solely responsible');
      FrmDlg.NAHelps.Add ('for the information you give us');
      FrmDlg.NAHelps.Add ('if you use false information,');
      FrmDlg.NAHelps.Add ('You will not be able to use');
      FrmDlg.NAHelps.Add ('all our services.');
      FrmDlg.NAHelps.Add ('Your account may be removed');
      FrmDlg.NAHelps.Add ('if you provide');
      FrmDlg.NAHelps.Add ('false information.');
      FrmDlg.NAHelps.Add ('');
   end;

   if Sender = m_EdPhone then begin
      FrmDlg.NAHelps.Add ('Please type in your telephone');
      FrmDlg.NAHelps.Add ('number(compulsory).');
      FrmDlg.NAHelps.Add ('');
   end;
   if Sender = m_EdMobPhone then begin
      FrmDlg.NAHelps.Add ('Your mobile telephone number');
      FrmDlg.NAHelps.Add ('');
   end;
   if Sender = m_EdEMail then begin
      FrmDlg.NAHelps.Add ('Please type your E-mail address.');
      FrmDlg.NAHelps.Add ('Your E-mail will be used to access');
      FrmDlg.NAHelps.Add ('some of our services. You can');
      FrmDlg.NAHelps.Add ('receive latest update information.');
      FrmDlg.NAHelps.Add ('');
   end;
end;

procedure TLoginScene.HideLoginBox;
begin
   //EdId.Visible := FALSE;
   //EdPasswd.Visible := FALSE;
   //FrmDlg.DLogin.Visible := FALSE;
   ChangeLoginState (lsCloseAll);
end;

procedure TLoginScene.OpenLoginDoor;
begin
   m_boNowOpening := TRUE;
   m_dwStartTime := GetTickCount;
   HideLoginBox;
   PlaySound (s_rock_door_open);
end;

procedure TLoginScene.PlayScene (MSurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   if m_boOpenFirst then begin
      m_boOpenFirst := FALSE;
      m_EdId.Visible := TRUE;
      m_EdPasswd.Visible := TRUE;
      m_EdId.SetFocus;
   end;
{$IF CUSTOMLIBFILE = 1}
   d := g_WMainImages.Images[83{102-80}];
{$ELSE}
   d := g_WChrSelImages.Images[102-80];
{$IFEND}
   if d <> nil then begin
      MSurface.Draw ((SCREENWIDTH - 800) div 2, (SCREENHEIGHT - 600) div 2, d.ClientRect, d, FALSE);
   end;
   if m_boNowOpening then begin
//      if GetTickCount - StartTime > 230 then begin
//开门速度
      if GetTickCount - m_dwStartTime > 50 then begin
         m_dwStartTime := GetTickCount;
         Inc (m_nCurFrame);
      end;
      if m_nCurFrame >= m_nMaxFrame-1 then begin
         m_nCurFrame := m_nMaxFrame-1;
         if not g_boDoFadeOut and not g_boDoFadeIn then begin
            g_boDoFadeOut := TRUE;
            g_boDoFadeIn := TRUE;
            g_nFadeIndex := 29;
         end;
      end;
{$IF CUSTOMLIBFILE = 1}
      d := g_WMainImages.Images[m_nCurFrame+84{103 + CurFrame-80}];
{$ELSE}
      d := g_WChrSelImages.Images[103 + m_nCurFrame-80];
{$IFEND}

      if d <> nil then
         MSurface.Draw ((SCREENWIDTH - 800) div 2 + 152{152}, (SCREENHEIGHT - 600) div 2 + 96{96}, d.ClientRect, d, TRUE);

      if g_boDoFadeOut then begin
         if g_nFadeIndex <= 1 then begin
            g_WMainImages.ClearCache;
            g_WChrSelImages.ClearCache;
            DScreen.ChangeScene (stSelectChr); //
         end;
      end;
   end; 
end;

procedure TLoginScene.ChangeLoginState (state: TLoginState);
var
   i, focus: integer;
   c: TControl;
begin
   focus := -1;
   case state of
      lsLogin: focus := 10;
      lsNewIdRetry, lsNewId: focus := 11;
      lsChgpw: focus := 12;
      lsCloseAll: focus := -1;
   end;
   with FrmMain do begin  //login
      for i:=0 to ControlCount-1 do begin
         c := Controls[i];
         if c is TEdit then begin
            if c.Tag in [10..12] then begin
               if c.Tag = focus then begin
                  c.Visible := TRUE;
                  TEdit(c).Text := '';
               end else begin
                  c.Visible := FALSE;
                  TEdit(c).Text := '';
               end;
            end;
         end;
      end;
      if EnglishVersion then  //康巩滚傈篮 林刮殿废锅龋 涝仿阑 救茄促.
         m_EdSSNo.Visible := FALSE;

      case state of
         lsLogin:
            begin
               FrmDlg.DNewAccount.Visible := FALSE;
               FrmDlg.DChgPw.Visible := FALSE;
               FrmDlg.DLogin.Visible := TRUE;              
               if m_EdId.Visible then m_EdId.SetFocus;
            end;
         lsNewIdRetry,
         lsNewId:
            begin
               if m_boUpdateAccountMode then
                  m_EdNewId.Enabled := FALSE
               else
                  m_EdNewId.Enabled := TRUE;
               FrmDlg.DNewAccount.Visible := TRUE;
               FrmDlg.DChgPw.Visible := FALSE;
               FrmDlg.DLogin.Visible := FALSE;
               if m_EdNewId.Visible and m_EdNewId.Enabled then begin
                  m_EdNewId.SetFocus;
               end else begin
                  if m_EdConfirm.Visible and m_EdConfirm.Enabled then
                     m_EdConfirm.SetFocus;
               end;
            end;
         lsChgpw:
            begin
               FrmDlg.DNewAccount.Visible := FALSE;
               FrmDlg.DChgPw.Visible := TRUE;
               FrmDlg.DLogin.Visible := FALSE;
               if m_EdChgId.Visible then m_EdChgId.SetFocus;
            end;
         lsCloseAll:
            begin
               FrmDlg.DNewAccount.Visible := FALSE;
               FrmDlg.DChgPw.Visible := FALSE;
               FrmDlg.DLogin.Visible := FALSE;
            end;
      end;
   end;
end;

procedure TLoginScene.NewClick;
begin
   m_boUpdateAccountMode := FALSE;
   FrmDlg.NewAccountTitle := '';
   ChangeLoginState (lsNewId);
end;

procedure TLoginScene.NewIdRetry (boupdate: Boolean);
begin
   m_boUpdateAccountMode := boupdate;
   ChangeLoginState (lsNewidRetry);
   m_EdNewId.Text     := m_NewIdRetryUE.sAccount;
   m_EdNewPasswd.Text := m_NewIdRetryUE.sPassword;
   m_EdYourName.Text  := m_NewIdRetryUE.sUserName;
   m_EdSSNo.Text      := m_NewIdRetryUE.sSSNo;
   m_EdQuiz1.Text     := m_NewIdRetryUE.sQuiz;
   m_EdAnswer1.Text   := m_NewIdRetryUE.sAnswer;
   m_EdPhone.Text     := m_NewIdRetryUE.sPhone;
   m_EdEMail.Text     := m_NewIdRetryUE.sEMail;
   m_EdQuiz2.Text     := m_NewIdRetryAdd.sQuiz2;
   m_EdAnswer2.Text   := m_NewIdRetryAdd.sAnswer2;
   m_EdMobPhone.Text  := m_NewIdRetryAdd.sMobilePhone;
   m_EdBirthDay.Text  := m_NewIdRetryAdd.sBirthDay;
end;

procedure TLoginScene.UpdateAccountInfos (ue: TUserEntry);
begin
   m_NewIdRetryUE := ue;
   FillChar (m_NewIdRetryAdd, sizeof(TUserEntryAdd), #0);
   m_boUpdateAccountMode := TRUE; //扁粮俊 乐绰 沥焊甫 犁涝仿窍绰 版快
   NewIdRetry (TRUE);
   FrmDlg.NewAccountTitle := '(Please complete all the required fields of the account information)';
end;

procedure TLoginScene.OkClick;
var
   key: char;
begin
   key := #13;
   EdLoginPasswdKeyPress (self, key);
end;

procedure TLoginScene.ChgPwClick;
begin
   ChangeLoginState (lsChgPw);
end;

function  TLoginScene.CheckUserEntrys: Boolean;
begin
   Result := FALSE;
   m_EdNewId.Text := Trim(m_EdNewId.Text);
   m_EdQuiz1.Text := Trim(m_EdQuiz1.Text);
   m_EdYourName.Text := Trim(m_EdYourName.Text);
   if not NewIdCheckNewId then exit;

   if not EnglishVersion then begin //康巩 滚傈俊辑绰 眉农救窃
      if not NewIdCheckSSNo then
         exit;
   end;

   if not NewIdCheckBirthday then exit;
   if Length(m_EdNewId.Text) < 3 then begin
      m_EdNewId.SetFocus;
      exit;
   end;
   if Length(m_EdNewPasswd.Text) < 3 then begin
      m_EdNewPasswd.SetFocus;
      exit;
   end;
   if m_EdNewPasswd.Text <> m_EdConfirm.Text then begin
      m_EdConfirm.SetFocus;
      exit;
   end;
   if Length(m_EdQuiz1.Text) < 1 then begin
      m_EdQuiz1.SetFocus;
      exit;
   end;
   if Length(m_EdAnswer1.Text) < 1 then begin
      m_EdAnswer1.SetFocus;
      exit;
   end;
   if Length(m_EdQuiz2.Text) < 1 then begin
      m_EdQuiz2.SetFocus;
      exit;
   end;
   if Length(m_EdAnswer2.Text) < 1 then begin
      m_EdAnswer2.SetFocus;
      exit;
   end;
   if Length(m_EdYourName.Text) < 1 then begin
      m_EdYourName.SetFocus;
      exit;
   end;
   if not EnglishVersion then begin //康巩 滚傈俊辑绰 眉农救窃
      if Length(m_EdSSNo.Text) < 1 then begin
         m_EdSSNo.SetFocus;
         exit;
      end;
   end;
   Result := TRUE;
end;

procedure TLoginScene.NewAccountOk;
var
   ue: TUserEntry;
   ua: TUserEntryAdd;
begin
   if CheckUserEntrys then begin
      FillChar (ue, sizeof(TUserEntry), #0);
      FillChar (ua, sizeof(TUserEntryAdd), #0);
      ue.sAccount := LowerCase(m_EdNewId.Text);
      ue.sPassword := m_EdNewPasswd.Text;
      ue.sUserName := m_EdYourName.Text;
      //
      if not EnglishVersion then
         ue.sSSNo := m_EdSSNo.Text
      else
          ue.sSSNo := '650101-1455111';

      ue.sQuiz := m_EdQuiz1.Text;
      ue.sAnswer := Trim(m_EdAnswer1.Text);
      ue.sPhone := m_EdPhone.Text;
      ue.sEMail := Trim(m_EdEMail.Text);

      ua.sQuiz2 := m_EdQuiz2.Text;
      ua.sAnswer2 := Trim(m_EdAnswer2.Text);
      ua.sBirthday := m_EdBirthDay.Text;
      ua.sMobilePhone := m_EdMobPhone.Text;

      m_NewIdRetryUE := ue;    //犁矫档锭 荤侩
      m_NewIdRetryUE.sAccount := '';
      m_NewIdRetryUE.sPassword := '';
      m_NewIdRetryAdd := ua;

      if not m_boUpdateAccountMode then
         FrmMain.SendNewAccount (ue, ua)
      else
         FrmMain.SendUpdateAccount (ue, ua);
      m_boUpdateAccountMode := FALSE;
      NewAccountClose;
   end;
end;

procedure TLoginScene.NewAccountClose;
begin
   if not m_boUpdateAccountMode then
      ChangeLoginState (lsLogin);
end;

procedure TLoginScene.ChgpwOk;
var
   uid, passwd, newpasswd: string;
begin
   if m_EdChgNewPw.Text = m_EdChgRepeat.Text then begin
      uid := m_EdChgId.Text;
      passwd := m_EdChgCurrentpw.Text;
      newpasswd := m_EdChgNewPw.Text;
      FrmMain.SendChgPw (uid, passwd, newpasswd);
      ChgpwCancel;
   end else begin
      FrmDlg.DMessageDlg ('Password confirmation is not correct.', [mbOk]);
      m_EdChgNewPw.SetFocus;
   end;
end;

procedure TLoginScene.ChgpwCancel;
begin
   ChangeLoginState (lsLogin);
end;
