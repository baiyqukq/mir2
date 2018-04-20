uses
	Actor;

type
	TNpcActor = class (TActor)
	private
		m_nEffX      :Integer; //0x240
		m_nEffY      :Integer; //0x244
		m_bo248      :Boolean; //0x248
		m_dwUseEffectTick    :LongWord; //0x24C
		m_EffSurface       :TDirectDrawSurface; //0x250
	public
		constructor Create; override;
		procedure  Run; override;
		procedure  CalcActorFrame; override;
		function   GetDefaultFrame (wmode: Boolean): integer; override;
		procedure  LoadSurface; override;
		procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
		procedure  DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
end;

implementation
{============================== NPCActor =============================}
procedure TNpcActor.CalcActorFrame;
var
  Pm:pTMonsterAction;
  HairCount:Integer;
begin
  m_boUseMagic    :=False;
  m_nCurrentFrame :=-1;
  m_nBodyOffset   :=GetNpcOffset(m_wAppearance);
   {
   if m_btRace = 50 then //NPC
      m_nBodyOffset := MERCHANTFRAME * m_wAppearance;
   }
  Pm:=GetRaceByPM(m_btRace,m_wAppearance);
  if pm = nil then exit;
  m_btDir := m_btDir mod 3;  //规氢篮 0, 1, 2 观俊 绝澜..
  case m_nCurrentAction of
    SM_TURN: begin
      m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
      m_dwFrameTime := pm.ActStand.ftime;
      m_dwStartTime := GetTickCount;
      m_nDefFrameCount := pm.ActStand.frame;
      Shift (m_btDir, 0, 0, 1);
      if ((m_wAppearance = 33) or (m_wAppearance = 34))and not m_boUseEffect then begin
        m_boUseEffect:=True;
        m_nEffectFrame:=m_nEffectStart;
        m_nEffectEnd:=m_nEffectStart + 9;
        m_dwEffectStartTime:=GetTickCount();
        m_dwEffectFrameTime:=300;
      end else begin
        if m_wAppearance in [42..47] then begin
          m_nStartFrame:=20;
          m_nEndFrame:=10;
          m_boUseEffect:=True;
          m_nEffectStart:=0;
          m_nEffectFrame:=0;
          m_nEffectEnd:=19;
          m_dwEffectStartTime:=GetTickCount();
          m_dwEffectFrameTime:=100;
        end else begin
          if m_wAppearance = 51 then begin
            m_boUseEffect:=True;
            m_nEffectStart:=60;
            m_nEffectFrame:=m_nEffectStart;
            m_nEffectEnd:=m_nEffectStart + 7;
            m_dwEffectStartTime:=GetTickCount();
            m_dwEffectFrameTime:=500;
          end;
        end;
      end;
    end;
    SM_HIT: begin
      case m_wAppearance of
        33,34,52: begin
          m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
          m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
          m_dwStartTime := GetTickCount;
          m_nDefFrameCount := pm.ActStand.frame;
        end;
        else begin
          m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
          m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
          m_dwFrameTime := pm.ActAttack.ftime;
          m_dwStartTime := GetTickCount;
          if m_wAppearance = 51 then begin
            m_boUseEffect:=True;
            m_nEffectStart:=60;
            m_nEffectFrame:=m_nEffectStart;
            m_nEffectEnd:=m_nEffectStart + 7;
            m_dwEffectStartTime:=GetTickCount();
            m_dwEffectFrameTime:=500;
          end;
        end;
      end;


    end;
    SM_DIGUP: begin
      
      if m_wAppearance = 52 then begin
        m_bo248:=True;
        m_dwUseEffectTick:=GetTickCount + 23000;
        Randomize;
        PlaySound(Random(7) + 146);
        m_boUseEffect:=True;
        m_nEffectStart:=60;
        m_nEffectFrame:=m_nEffectStart;
        m_nEffectEnd:=m_nEffectStart + 11;
        m_dwEffectStartTime:=GetTickCount();
        m_dwEffectFrameTime:=100;
      end;

    end;
  end;
end;

constructor TNpcActor.Create; //0x0047C42C
begin
  inherited;
  m_EffSurface:=nil;
  m_boHitEffect:=False;
  m_bo248:=False;
end;

procedure TNpcActor.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  m_btDir := m_btDir mod 3;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;
  ceff := GetDrawEffectValue;
  if m_BodySurface <> nil then begin
    if m_wAppearance = 51 then begin
      DrawEffSurface (dsurface,
                      m_BodySurface,
                      dx + m_nPx + m_nShiftX,
                      dy + m_nPy + m_nShiftY,
                      True,
                      ceff);
    end else begin
      DrawEffSurface (dsurface,
                      m_BodySurface,
                      dx + m_nPx + m_nShiftX,
                      dy + m_nPy + m_nShiftY,
                      blend,
                      ceff);
    end;
  end;
end;

procedure TNpcActor.DrawEff(dsurface: TDirectDrawSurface; dx, dy: integer);
begin
//  inherited;
  if m_boUseEffect and (m_EffSurface <> nil) then begin
    DrawBlend (dsurface,
               dx + m_nEffX + m_nShiftX,
               dy + m_nEffY + m_nShiftY,
               m_EffSurface,
               1);
  end;
end;

function  TNpcActor.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   Result:=0;//Jacky
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_btDir := m_btDir mod 3;  //规氢篮 0, 1, 2 观俊 绝澜..

   if m_nCurrentDefFrame < 0 then cf := 0
   else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
   else cf := m_nCurrentDefFrame;
   Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;
end;

procedure TNpcActor.LoadSurface;
var
  WMImage:TWMImages;
begin
{
  case m_btRace of
    50: begin //Npc
      m_BodySurface:=FrmMain.WNpcImg.GetCachedImage (m_nBodyOffset + m_nCurrentFrame, m_nPx, m_nPy);
      if m_nBodyOffset >= 1000 then begin
        if FrmMain.GetNpcImg(m_wAppearance,WMImage) then begin
          m_BodySurface:=WMImage.GetCachedImage (m_nCurrentFrame, m_nPx, m_nPy);
        end;
      end;
    end;
  end;
}
  if m_btRace = 50 then begin
    m_BodySurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nCurrentFrame, m_nPx, m_nPy);
  end;
  if m_wAppearance in [42..47] then
    m_BodySurface:=nil;
  if m_boUseEffect then begin
    if m_wAppearance in [33..34] then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
    end else if m_wAppearance = 42 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
      m_nEffX:=m_nEffX + 71;
      m_nEffY:=m_nEffY + 5;
    end else if m_wAppearance = 43 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
      m_nEffX:=m_nEffX + 71;
      m_nEffY:=m_nEffY + 37;
    end else if m_wAppearance = 44 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
      m_nEffX:=m_nEffX + 7;
      m_nEffY:=m_nEffY + 12;
    end else if m_wAppearance = 45 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
      m_nEffX:=m_nEffX + 6;
      m_nEffY:=m_nEffY + 12;
    end else if m_wAppearance = 46 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
      m_nEffX:=m_nEffX + 7;
      m_nEffY:=m_nEffY + 12;
    end else if m_wAppearance = 47 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
      m_nEffX:=m_nEffX + 8;
      m_nEffY:=m_nEffY + 12;
    end else if m_wAppearance = 51 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
    end else if m_wAppearance = 52 then begin
      m_EffSurface:=g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nEffectFrame, m_nEffX, m_nEffY);
    end;
  end;
    
end;

procedure TNpcActor.Run;
var
  nEffectFrame:Integer;
  dwEffectFrameTime:LongWord;
begin
  inherited Run;
  nEffectFrame:=m_nEffectFrame;
  if m_boUseEffect then begin
    if m_boUseMagic then begin
      dwEffectFrameTime:=Round(m_dwEffectFrameTime / 3);
    end else dwEffectFrameTime:=m_dwEffectFrameTime;

    if GetTickCount - m_dwEffectStartTime > dwEffectFrameTime then begin
      m_dwEffectStartTime:=GetTickCount();
      if m_nEffectFrame < m_nEffectEnd then begin
        Inc(m_nEffectFrame);
      end else begin
        if m_bo248 then begin
          if GetTickCount > m_dwUseEffectTick then begin
            m_boUseEffect:=False;
            m_bo248:=False;
            m_dwUseEffectTick:=GetTickCount();
          end;
          m_nEffectFrame:=m_nEffectStart;
        end else m_nEffectFrame:=m_nEffectStart;
        m_dwEffectStartTime:=GetTickCount();
      end;
    end;
  end;
  if nEffectFrame <> m_nEffectFrame then begin
    m_dwLoadSurfaceTime:=GetTickCount();
    LoadSurface();
  end;
end;

end.
