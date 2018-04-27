uses
	Actor;

type
	THumActor = class (TActor)//Size: 0x27C Address: 0x00475BB8
	private
		m_HairSurface         :TDirectDrawSurface; //0x250  //0x240
		m_WeaponSurface       :TDirectDrawSurface; //0x254  //0x244
		m_HumWinSurface       :TDirectDrawSurface; //0x258  //0x248
		m_boWeaponEffect      :Boolean;            //0x25C  //0x24C
		m_nCurWeaponEffect    :Integer;            //0x260  //0x250
		m_nCurBubbleStruck    :Integer;            //0x264  //0x254
		m_dwWeaponpEffectTime :LongWord;           //0x268
		m_boHideWeapon        :Boolean;            //0x26C
		m_nFrame              :Integer;
		m_dwFrameTick         :LongWord;
		m_dwFrameTime         :LongWord;
		m_bo2D0               :Boolean;
	protected
		procedure CalcActorFrame; override;
		procedure DefaultMotion; override;
		function  GetDefaultFrame (wmode: Boolean): integer; override;
	public
		constructor Create; override;
		destructor Destroy; override;
		procedure  Run; override;
		procedure  RunFrameAction (frame: integer); override;
		function   Light: integer; override;
		procedure  LoadSurface; override;
		procedure  DoWeaponBreakEffect;
		procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
	end;

implementation
{============================== HUMActor =============================}

//            荤恩

{-------------------------------}

constructor THumActor.Create;
begin
   inherited Create;
   m_HairSurface := nil;
   m_WeaponSurface := nil;
   m_HumWinSurface:=nil;
   m_boWeaponEffect := FALSE;
   m_dwFrameTime:=150;
   m_dwFrameTick:=GetTickCount();
   m_nFrame:=0;
   m_nHumWinOffset:=0;
end;

destructor THumActor.Destroy;
begin
  inherited Destroy;
end;

procedure THumActor.CalcActorFrame;
var
  haircount: integer;
begin
  m_boUseMagic := FALSE;
  m_boHitEffect := FALSE;
  m_nCurrentFrame := -1;
   //human
  m_btHair   := HAIRfeature (m_nFeature);         //函版等促.
  m_btDress  := DRESSfeature (m_nFeature);
  m_btWeapon := WEAPONfeature (m_nFeature);
  m_btHorse  :=Horsefeature(m_nFeatureEx);
  m_btEffect :=Effectfeature(m_nFeatureEx);
  m_nBodyOffset := HUMANFRAME * (m_btDress); //m_btSex; //巢磊0, 咯磊1

  haircount := g_WHairImgImages.ImageCount div HUMANFRAME div 2;
  if m_btHair > haircount-1 then m_btHair := haircount-1;
  m_btHair := m_btHair * 2;
  if m_btHair > 1 then
    m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex)
  else m_nHairOffset := -1;
  m_nWeaponOffset := HUMANFRAME * m_btWeapon; //(weapon*2 + m_btSex);
//   if Dress in [1..4] then begin
//   if Dress in [18..21] then begin
//     HumWinOffset:=(Dress - 18)* HUMANFRAME;
//   end;
  if (m_btEffect = 50) then begin
    m_nHumWinOffset:=352;
  end else
  if m_btEffect <> 0 then
     m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
   case m_nCurrentAction of
      SM_TURN:
         begin
            m_nStartFrame := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
            m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
            m_dwFrameTime := HA.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := HA.ActStand.frame;
            Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_WALK,
      SM_BACKSTEP:
         begin
            m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
            m_dwFrameTime := HA.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMaxTick := HA.ActWalk.UseTick;
            m_nCurTick := 0;
            //WarMode := FALSE;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_BACKSTEP then
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_RUSH:
         begin
            if m_nRushDir = 0 then begin
               m_nRushDir := 1;
               m_nStartFrame := HA.ActRushLeft.start + m_btDir * (HA.ActRushLeft.frame + HA.ActRushLeft.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushLeft.frame - 1;
               m_dwFrameTime := HA.ActRushLeft.ftime;
               m_dwStartTime := GetTickCount;
               m_nMaxTick := HA.ActRushLeft.UseTick;
               m_nCurTick := 0;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
            end else begin
               m_nRushDir := 0;
               m_nStartFrame := HA.ActRushRight.start + m_btDir * (HA.ActRushRight.frame + HA.ActRushRight.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushRight.frame - 1;
               m_dwFrameTime := HA.ActRushRight.ftime;
               m_dwStartTime := GetTickCount;
               m_nMaxTick := HA.ActRushRight.UseTick;
               m_nCurTick := 0;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
            end;
         end;
      SM_RUSHKUNG:
         begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            m_nMaxTick := HA.ActRun.UseTick;
            m_nCurTick := 0;
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      {SM_BACKSTEP:
         begin
            startframe := pm.ActWalk.start + (pm.ActWalk.frame - 1) + Dir * (pm.ActWalk.frame + pm.ActWalk.skip);
            m_nEndFrame := startframe - (pm.ActWalk.frame - 1);
            m_dwFrameTime := pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMaxTick := pm.ActWalk.UseTick;
            m_nCurTick := 0;
            m_nMoveStep := 1;
            Shift (GetBack(Dir), m_nMoveStep, 0, m_nEndFrame-startframe+1);
         end;  }
      SM_SITDOWN:
         begin
            m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
            m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame - 1;
            m_dwFrameTime := HA.ActSitdown.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_RUN:
         begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            m_nMaxTick := HA.ActRun.UseTick;
            m_nCurTick := 0;
            //WarMode := FALSE;
            if m_nCurrentAction = SM_RUN then m_nMoveStep := 2
            else m_nMoveStep := 1;

            //m_nMoveStep := 2;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_HORSERUN: begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            m_nMaxTick := HA.ActRun.UseTick;
            m_nCurTick := 0;
            //WarMode := FALSE;
            if m_nCurrentAction = SM_HORSERUN then m_nMoveStep := 3
            else m_nMoveStep := 1;

            //m_nMoveStep := 2;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
      end;
      SM_THROW:
         begin
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := HA.ActHit.ftime;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boThrow := TRUE;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_HIT, SM_POWERHIT, SM_LONGHIT, SM_WIDEHIT, SM_FIREHIT, SM_CRSHIT, SM_TWINHIT:
         begin
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := HA.ActHit.ftime;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            if (m_nCurrentAction = SM_POWERHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 1;
            end;
            if (m_nCurrentAction = SM_LONGHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 2;
            end;
            if (m_nCurrentAction = SM_WIDEHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 3;
            end;
            if (m_nCurrentAction = SM_FIREHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 4;
            end;
            if (m_nCurrentAction = SM_CRSHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 6;
            end;
            if (m_nCurrentAction = SM_TWINHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 7;
            end;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_HEAVYHIT:
         begin
            m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
            m_dwFrameTime := HA.ActHeavyHit.ftime;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_BIGHIT:
         begin
            m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
            m_dwFrameTime := HA.ActBigHit.ftime;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_SPELL:
         begin
            m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
            m_nEndFrame := m_nStartFrame + HA.ActSpell.frame - 1;
            m_dwFrameTime := HA.ActSpell.ftime;
            m_dwStartTime := GetTickCount;
            m_nCurEffFrame := 0;
            m_boUseMagic := TRUE;
            case m_CurMagic.EffectNumber of
               22: begin //火墙
                     m_nMagLight := 4;  //汾汲拳
                     m_nSpellFrame := 10; //汾汲拳绰 10 橇贰烙栏肺 函版
                  end;
               26: begin //心灵启示
                     m_nMagLight := 2;
                     m_nSpellFrame := 20;
                     m_dwFrameTime := m_dwFrameTime div 2;
                  end;
               35: begin //
                     m_nMagLight := 2;
                     m_nSpellFrame := 15;
               end;
               43: begin //狮子吼
                     m_nMagLight := 2;
                     m_nSpellFrame := 20;
                  end;
               else begin //.....  措雀汗贱, 荤磊辣雀, 葫汲浅
                  m_nMagLight := 2;
                  m_nSpellFrame := DEFSPELLFRAME;
               end;
            end;
            m_dwWaitMagicRequest := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      (*SM_READYFIREHIT:
         begin
            startframe := HA.ActFireHitReady.start + Dir * (HA.ActFireHitReady.frame + HA.ActFireHitReady.skip);
            m_nEndFrame := startframe + HA.ActFireHitReady.frame - 1;
            m_dwFrameTime := HA.ActFireHitReady.ftime;
            m_dwStartTime := GetTickCount;

            BoHitEffect := TRUE;
            HitEffectNumber := 4;
            MagLight := 2;

            CurGlimmer := 0;
            MaxGlimmer := 6;

            WarMode := TRUE;
            WarModeTime := GetTickCount;
            Shift (Dir, 0, 0, 1);
         end; *)
      SM_STRUCK:
         begin
            m_nStartFrame := HA.ActStruck.start + m_btDir * (HA.ActStruck.frame + HA.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + HA.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime; //HA.ActStruck.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);

            m_dwGenAnicountTime := GetTickCount;
            m_nCurBubbleStruck := 0;
         end;
      SM_NOWDEATH:
         begin
            m_nStartFrame := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDie.frame - 1;
            m_dwFrameTime := HA.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
   end;
end;

procedure THumActor.DefaultMotion;
begin
   inherited DefaultMotion;
   if (m_btEffect = 50) then begin
     if (m_nCurrentFrame <= 536) then begin
       if (GetTickCount - m_dwFrameTick) > 100 then begin
         if m_nFrame < 19 then Inc(m_nFrame)
         else begin
           if not m_bo2D0 then m_bo2D0:=True
           else m_bo2D0:=False;
           m_nFrame:=0;
         end;
         m_dwFrameTick:=GetTickCount();
       end;
       m_HumWinSurface:=FrmMain.WEffectImg.GetCachedImage (m_nHumWinOffset + m_nFrame, m_nSpx, m_nSpy);
     end;
   end else
   if (m_btEffect <> 0) then begin
   if m_nCurrentFrame < 64 then begin
     if (GetTickCount - m_dwFrameTick) > m_dwFrameTime then begin
       if m_nFrame < 7 then Inc(m_nFrame)
       else m_nFrame:=0;
       m_dwFrameTick:=GetTickCount();
     end;
     m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
   end else begin
     m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
   end;
   end;
end;

function  THumActor.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   //GlimmingMode := FALSE;
   //dr := Dress div 2;            //HUMANFRAME * (dr)
   if m_boDeath then
      Result := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip) + (HA.ActDie.frame - 1)
   else
   if wmode then begin
      //GlimmingMode := TRUE;
      Result := HA.ActWarMode.start + m_btDir * (HA.ActWarMode.frame + HA.ActWarMode.skip);
   end else begin
      m_nDefFrameCount := HA.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= HA.ActStand.frame then cf := 0 //HA.ActStand.frame-1
      else cf := m_nCurrentDefFrame;
      Result := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip) + cf;
   end;
end;

procedure  THumActor.RunFrameAction (frame: integer);
var
   meff: TMapEffect;
   event: TClEvent;
   mfly: TFlyingAxe;
begin
   m_boHideWeapon := FALSE;
   if m_nCurrentAction = SM_HEAVYHIT then begin
      if (frame = 5) and (m_boDigFragment) then begin
         m_boDigFragment := FALSE;
         meff := TMapEffect.Create (8 * m_btDir, 3, m_nCurrX, m_nCurrY);
         meff.ImgLib := FrmMain.WEffectImg;
         meff.NextFrameTime := 80;
         PlaySound (s_strike_stone);
         //PlaySound (s_drop_stonepiece);
         PlayScene.m_EffectList.Add (meff);
         event := EventMan.GetEvent (m_nCurrX, m_nCurrY, ET_PILESTONES);
         if event <> nil then
            event.m_nEventParam := event.m_nEventParam + 1;
      end;
   end;
   if m_nCurrentAction = SM_THROW then begin
      if (frame = 3) and (m_boThrow) then begin
         m_boThrow := FALSE;
         mfly := TFlyingAxe (PlayScene.NewFlyObject (self,
                          m_nCurrX,
                          m_nCurrY,
                          m_nTargetX,
                          m_nTargetY,
                          m_nTargetRecog,
                          mtFlyAxe));
         if mfly <> nil then begin
            TFlyingAxe(mfly).ReadyFrame := 40;
            mfly.ImgLib := FrmMain.WMon3Img;
            mfly.FlyImageBase := FLYOMAAXEBASE;
         end;

      end;
      if frame >= 3 then
         m_boHideWeapon := TRUE;
   end;
end;

procedure  THumActor.DoWeaponBreakEffect;
begin
   m_boWeaponEffect := TRUE;
   m_nCurWeaponEffect := 0;
end;

procedure  THumActor.Run;
   function MagicTimeOut: Boolean;
   begin
      if self = g_MySelf then begin
         Result := GetTickCount - m_dwWaitMagicRequest > 3000;
      end else
         Result := GetTickCount - m_dwWaitMagicRequest > 2000;
      if Result then
         m_CurMagic.ServerMagicCode := 0;
   end;
var
   prv: integer;
   m_dwFrameTimetime: longword;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin //林贱狼阜 殿... 局聪皋捞记 瓤苞
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
      Inc (m_nCurBubbleStruck);
   end;
   if m_boWeaponEffect then begin  //公扁 氢惑/何辑咙 瓤苞
      if GetTickCount - m_dwWeaponpEffectTime > 120 then begin
         m_dwWeaponpEffectTime := GetTickCount;
         Inc (m_nCurWeaponEffect);
         if m_nCurWeaponEffect >= MAXWPEFFECTFRAME then
            m_boWeaponEffect := FALSE;
      end;
   end;

   if (m_nCurrentAction = SM_WALK) or
      (m_nCurrentAction = SM_BACKSTEP) or
      (m_nCurrentAction = SM_RUN) or
      (m_nCurrentAction = SM_HORSERUN) or
      (m_nCurrentAction = SM_RUSH) or
      (m_nCurrentAction = SM_RUSHKUNG)
   then exit;

   m_boMsgMuch := FALSE;
   if self <> g_MySelf then begin
      if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   end;

   //荤款靛 瓤苞
   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if (self <> g_MySelf) and (m_boUseMagic) then begin
         m_dwFrameTimetime := Round(m_dwFrameTime / 1.8);
      end else begin
         if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
         else m_dwFrameTimetime := m_dwFrameTime;
      end;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin

            //付过牢 版快 辑滚狼 脚龋甫 罐酒, 己傍/角菩甫 犬牢茄饶
            //付瘤阜悼累阑 场辰促.
            if m_boUseMagic then begin
               if (m_nCurEffFrame = m_nSpellFrame-2) or (MagicTimeOut) then begin //扁促覆 场
                  if (m_CurMagic.ServerMagicCode >= 0) or (MagicTimeOut) then begin //辑滚肺 何磐 罐篮 搬苞. 酒流 救吭栏搁 扁促覆
                     Inc (m_nCurrentFrame);
                     Inc(m_nCurEffFrame);
                     m_dwStartTime := GetTickCount;
                  end;
               end else begin
                  if m_nCurrentFrame < m_nEndFrame - 1 then Inc (m_nCurrentFrame);
                  Inc (m_nCurEffFrame);
                  m_dwStartTime := GetTickCount;
               end;
            end else begin
               Inc (m_nCurrentFrame);
               m_dwStartTime := GetTickCount;
            end;

         end else begin
            if self = g_MySelf then begin
               if FrmMain.ServerAcceptNextAction then begin
                  m_nCurrentAction := 0;
                  m_boUseMagic := FALSE;
               end;
            end else begin
               m_nCurrentAction := 0; //悼累 肯丰
               m_boUseMagic := FALSE;
            end;
            m_boHitEffect := FALSE;
         end;
         if m_boUseMagic then begin
            if m_nCurEffFrame = m_nSpellFrame - 1 then begin //付过 惯荤 矫痢
               //付过 惯荤
               if m_CurMagic.ServerMagicCode > 0 then begin
                  with m_CurMagic do
                     PlayScene.NewMagic (self,
                                      ServerMagicCode,
                                      EffectNumber,
                                      m_nCurrX,
                                      m_nCurrY,
                                      TargX,
                                      TargY,
                                      Target,
                                      EffectType,
                                      Recusion,
                                      AniTime,
                                      bofly);
                  if bofly then
                     PlaySound (m_nMagicFireSound)
                  else
                     PlaySound (m_nMagicExplosionSound);
               end;
               if self = g_MySelf then
                  g_dwLatestSpellTick := GetTickCount;
               m_CurMagic.ServerMagicCode := 0;
            end;
         end;

      end;
      if m_btRace = 0 then m_nCurrentDefFrame := 0
      else m_nCurrentDefFrame := -10;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;

function   THumActor.Light: integer;
var
   l: integer;
begin
   l := m_nChrLight;
   if l < m_nMagLight then begin
      if m_boUseMagic or m_boHitEffect then
         l := m_nMagLight;
   end;
   Result := l;
end;

procedure  THumActor.LoadSurface;
begin
   {
   BodySurface := FrmMain.WHumImg.GetCachedImage (BodyOffset + m_nCurrentFrame, px, py);
   if HairOffset >= 0 then
      HairSurface := FrmMain.WHairImg.GetCachedImage (HairOffset + m_nCurrentFrame, hpx, hpy)
   else HairSurface := nil;
   WeaponSurface := FrmMain.WWeapon.GetCachedImage (WeaponOffset + m_nCurrentFrame, wpx, wpy);
   }

   //BodySurface := FrmMain.WHumImg.GetCachedImage (BodyOffset + m_nCurrentFrame, px, py);
   m_BodySurface := FrmMain.GetWHumImg(m_btDress,m_btSex ,m_nCurrentFrame, m_nPx, m_nPy);
   if m_BodySurface = nil then
     m_BodySurface := FrmMain.GetWHumImg(0,m_btSex ,m_nCurrentFrame, m_nPx, m_nPy);
     

   if m_nHairOffset >= 0 then
      m_HairSurface := g_WHairImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
   else m_HairSurface := nil;
   if (m_btEffect = 50) then begin
     if (m_nCurrentFrame <= 536) then begin
       if (GetTickCount - m_dwFrameTick) > 100 then begin
         if m_nFrame < 19 then Inc(m_nFrame)
         else begin
           if not m_bo2D0 then m_bo2D0:=True
           else m_bo2D0:=False;
           m_nFrame:=0;
         end;
         m_dwFrameTick:=GetTickCount();
       end;
       m_HumWinSurface:=FrmMain.WEffectImg.GetCachedImage (m_nHumWinOffset + m_nFrame, m_nSpx, m_nSpy);
     end;
   end else
   if (m_btEffect <> 0) then begin
   if m_nCurrentFrame < 64 then begin
     if (GetTickCount - m_dwFrameTick) > m_dwFrameTime then begin
       if m_nFrame < 7 then Inc(m_nFrame)
       else m_nFrame:=0;
       m_dwFrameTick:=GetTickCount();
     end;
     m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
   end else begin
     m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
   end;
   end;

   //WeaponSurface:=FrmMain.WWeapon.GetCachedImage(WeaponOffset + m_nCurrentFrame, wpx, wpy);
   m_WeaponSurface:=FrmMain.GetWWeaponImg(m_btWeapon,m_btSex,m_nCurrentFrame, m_nWpx, m_nWpy);
   if m_WeaponSurface = nil then
     m_WeaponSurface:=FrmMain.GetWWeaponImg(0,m_btSex,m_nCurrentFrame, m_nWpx, m_nWpy);
end;

procedure  THumActor.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
   ceff: TColorEffect;
   wimg: TWMImages;
begin
   d:=nil;//Jacky
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

   ceff := GetDrawEffectValue;


   if m_btRace = 0 then begin
      if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
         m_nWpord := WORDER[m_btSex, m_nCurrentFrame];

//      if Dress in [1..4] then begin
//      if Dress in [18..21] then begin
      if m_btEffect <> 0 then begin
        if g_MySelf = Self then begin
          if blend then begin
            if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
               (m_HumWinSurface <> nil) and not boFlag then begin
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end else begin//0x0047CED1
              if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
                 (m_HumWinSurface <> nil) and boFlag then begin
                 DrawBlend (dsurface,
                           dx + m_nSpx + m_nShiftX,
                           dy + m_nSpy + m_nShiftY,
                           m_HumWinSurface,
                           1);
              end;
            end;
          end;//0x0047D03F
        end else begin;//0x0047CF4D
          if ((g_FocusCret <> nil) or (g_MagicTarget <> nil)) and
             blend and ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
             (m_HumWinSurface <> nil) and not boFlag then begin
             DrawBlend (dsurface,
                        dx + m_nSpx + m_nShiftX,
                        dy + m_nSpy + m_nShiftY,
                        m_HumWinSurface,
                        1);
          end else begin;//0x0047CFD4
            if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
               (m_HumWinSurface <> nil) and boFlag then begin
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end;//0x0047D03F
          end;
        end;
      end;//0x0047D03F

      if (m_nWpord = 0) and (not blend) and (m_btWeapon >= 2) and (m_WeaponSurface <> nil) and (not m_boHideWeapon) then begin
         DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceNone);  //漠篮 祸捞 救函窃
         DrawWeaponGlimmer (dsurface, dx + m_nShiftX, dy + m_nShiftY);
         //dsurface.Draw (dx + wpx + ShiftX, dy + wpy + ShiftY, WeaponSurface.ClientRect, WeaponSurface, TRUE);
      end;
      //个烹 弊府绊
      if m_BodySurface <> nil then
         DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
      if m_HairSurface <> nil then
         DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);

      //
      if (m_nWpord = 1) and {(not blend) and} (m_btWeapon >= 2) and (m_WeaponSurface <> nil) and (not m_boHideWeapon) then begin
         DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceNone);
         DrawWeaponGlimmer (dsurface, dx + m_nShiftX, dy + m_nShiftY);
         //dsurface.Draw (dx + wpx + ShiftX, dy + wpy + ShiftY, WeaponSurface.ClientRect, WeaponSurface, TRUE);
      end;

//      if Dress in [1..4] then begin
//      if Dress in [18..21] then begin
      if (m_btEffect = 50) then begin
        if (m_HumWinSurface <> nil) then
          DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
      end else
      if m_btEffect <> 0 then begin
        if g_MySelf = Self then begin
          if blend then begin
            if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
               (m_HumWinSurface <> nil) and not boFlag then begin
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end else begin//0x0047D27F
              if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
                 (m_HumWinSurface <> nil) and boFlag then begin
                DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
             end;
            end;
          end;// gogo 0x0047D41D
        end else begin;//0x0047D30D
          if ((g_FocusCret <> nil) or (g_MagicTarget <> nil)) and
             ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
             (m_HumWinSurface <> nil) and not boFlag then begin
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
          end else begin;//0x0047D3A0
            if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
               (m_HumWinSurface <> nil) and boFlag then begin
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end;//0x0047D41D
          end;
        end;
      end;//0x0047D41D


      //显示魔法盾时效果
      if m_nState and $00100000{STATE_BUBBLEDEFENCEUP} <> 0 then begin  //林贱狼阜
         if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck < 3) then
            idx := MAGBUBBLESTRUCKBASE + m_nCurBubbleStruck
         else
            idx := MAGBUBBLEBASE + (m_nGenAniCount mod 3);
         d := g_WMagicImages.GetCachedImage (idx, ax, ay);
         if d <> nil then
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
   end;

   //显示魔法效果
   if m_boUseMagic {and (EffDir[Dir] = 1)} and (m_CurMagic.EffectNumber > 0) then begin
      if m_nCurEffFrame in [0..m_nSpellFrame-1] then begin
         GetEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx);
         idx := idx + m_nCurEffFrame;
         if wimg <> nil then
            d := wimg.GetCachedImage (idx, ax, ay);
         if d <> nil then
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
   end;

   //显示攻击效果
   if m_boHitEffect and (m_nHitEffectNumber > 0) then begin
      GetEffectBase (m_nHitEffectNumber - 1, 1, wimg, idx);
      idx := idx + m_btDir*10 + (m_nCurrentFrame-m_nStartFrame);
      if wimg <> nil then
         d := wimg.GetCachedImage (idx, ax, ay);
      if d <> nil then
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end;

   //显示武器破碎效果
   if m_boWeaponEffect then begin
      idx := WPEFFECTBASE + m_btDir * 10 + m_nCurWeaponEffect;
      d := g_WMagicImages.GetCachedImage (idx, ax, ay);
      if d <> nil then
         DrawBlend (dsurface,
                     dx + ax + m_nShiftX,
                     dy + ay + m_nShiftY,
                     d, 1);
   end;

end;

end.
