	TAnimalObject =class(TBaseObject)
		m_nNotProcessCount            :Integer;    //未被处理次数，用于怪物处理循环
		m_nTargetX                    :Integer;    //0x538
		m_nTargetY                    :Integer;    //0x53C
		m_boRunAwayMode               :Boolean;    //0x540
		m_dwRunAwayStart              :LongWord;   //0x544
		m_dwRunAwayTime               :LongWord;    //0x548
	private

	public
		constructor Create();override;

		{ Find the nearest target object and attack it }
		procedure SearchTarget();
		procedure sub_4C959C;
		function  Operate(ProcessMsg:pTProcessMessage):Boolean;override; //FFFC
		procedure Run;override;  //FFFB
		procedure DelTargetCreat();override;//FFF1
		procedure SetTargetXY(nX,nY:Integer);virtual; //FFF0
		procedure GotoTargetXY(); virtual; //0FFEF
		procedure Wondering(); virtual; //0FFEE
		procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);virtual; //0FFED
		procedure Struck(Hiter: TBaseObject);virtual; //FFEC

		procedure HitMagAttackTarget(TargeTBaseObject: TBaseObject; nHitPower: Integer;nMagPower:integer;boFlag:Boolean);
	end;


implementation

uses ObjBase

procedure TAnimalObject.Attack(TargeTBaseObject: TBaseObject; nDir: Integer); //004C9380
begin
  inherited AttackDir(TargeTBaseObject,0,nDir);
end;

constructor TAnimalObject.Create;//004C9190
begin
  inherited;
  m_nNotProcessCount:=0;
  m_nTargetX:= -1;
  dwTick3F0:=Random(4) * 500 + 1000;
  dwTick3F4:=GetTickCount();
  m_btRaceServer:=RC_ANIMAL;
  m_dwHitTick:=GetTickCount - LongWord(Random(3000));
  m_dwWalkTick:=GetTickCount - LongWord(Random(3000));
  m_dwSearchEnemyTick:=GetTickCount();
  m_boRunAwayMode:=False;
  m_dwRunAwayStart:=GetTickCount();
  m_dwRunAwayTime:=0;
end;
procedure TAnimalObject.GotoTargetXY; //004C9694
var
  I     :Integer;
  nDir  :Integer;
  n10   :Integer;
  n14   :Integer;
  n20   :Integer;
  nOldX :Integer;
  nOldY :Integer;
begin
  if ((m_nCurrX <> m_nTargetX) or (m_nCurrY <> m_nTargetY)) then begin
    n10:=m_nTargetX;
    n14:=m_nTargetY;
    dwTick3F4:=GetTickCount();
    nDir:=DR_DOWN;
    if n10 > m_nCurrX then begin
      nDir:=DR_RIGHT;
      if n14 > m_nCurrY then nDir:=DR_DOWNRIGHT;
      if n14 < m_nCurrY then nDir:=DR_UPRIGHT;
    end else begin //004C9728
      if n10 < m_nCurrX then begin
        nDir:=DR_LEFT;
        if n14 > m_nCurrY then nDir:=DR_DOWNLEFT;
        if n14 < m_nCurrY then nDir:=DR_UPLEFT;
      end else begin //004C9760
        if n14 > m_nCurrY then nDir:=DR_DOWN
        else if n14 < m_nCurrY then nDir:=DR_UP;
      end;
   end;
    nOldX:=m_nCurrX;
    nOldY:=m_nCurrY;
    WalkTo(nDir,False);
    n20:=Random(3);
    for I := DR_UP to DR_UPLEFT do begin
      if (nOldX = m_nCurrX) and (nOldY = m_nCurrY) then begin
        if n20 <> 0 then Inc(nDir)
        else if nDir > 0 then Dec(nDir)
        else nDir:=DR_UPLEFT;
        if (nDir > DR_UPLEFT) then nDir:=DR_UP;
        WalkTo(nDir,False);
      end;
    end;
  end; //004C980B
end;

function TAnimalObject.Operate(ProcessMsg:pTProcessMessage):Boolean; //004C9280
begin
//  Result:=False;
  if ProcessMsg.wIdent = RM_STRUCK then begin
    if (ProcessMsg.BaseObject = Self) and (TBaseObject(ProcessMsg.nParam3{AttackBaseObject}) <> nil) then begin
      SetLastHiter(TBaseObject(ProcessMsg.nParam3{AttackBaseObject}));
      Struck(TBaseObject(ProcessMsg.nParam3{AttackBaseObject}));{0FFEC}
      BreakHolySeizeMode();
      if (m_Master <> nil) and
         (TBaseObject(ProcessMsg.nParam3) <> m_Master) and
         (TBaseObject(ProcessMsg.nParam3).m_btRaceServer = RC_PLAYOBJECT) then begin

        m_Master.SetPKFlag(TBaseObject(ProcessMsg.nParam3));
      end;
      if g_Config.boMonSayMsg then MonsterSayMsg(TBaseObject(ProcessMsg.nParam3),s_UnderFire);
    end;
    Result:=True;
  end else begin //004C932C
    Result:=inherited Operate(ProcessMsg);
  end;
end;


procedure TAnimalObject.Run;//004C936C
begin
  inherited;

end;

procedure TAnimalObject.Struck (Hiter: TBaseObject);//004C93A8
var
  btDir:Byte;
begin
  m_dwStruckTick := GetTickCount;
  if Hiter <> nil then begin
    if (m_TargetCret = nil) or GetAttackDir(m_TargetCret,btDir) or (Random(6) = 0) then begin
      if IsProperTarget (Hiter) then
        SetTargetCreat (Hiter);
    end;
  end; //004C941D
  if m_boAnimal then begin
     m_nMeatQuality := m_nMeatQuality - Random (300);
     if m_nMeatQuality < 0 then m_nMeatQuality := 0;
  end;
  //if m_Abil.Level < 50 then
     m_dwHitTick  := m_dwHitTick + LongWord(150 - _MIN(130, m_Abil.Level * 4));
  //WalkTime := WalkTime + (300 - _MIN(200, (Abil.Level div 5) * 20));
end;

procedure TAnimalObject.HitMagAttackTarget(TargeTBaseObject: TBaseObject; nHitPower,
  nMagPower: integer; boFlag: Boolean); //004C2E40
var
  I: Integer;
  nDamage:Integer;
  BaseObjectList:TList;
  BaseObject:TBaseObject;
begin
  m_btDirection:=GetNextDirection(m_nCurrx,m_nCurrY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
  BaseObjectList:=TList.Create;
  m_PEnvir.GeTBaseObjects(TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,False,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[I]);
    if IsProperTarget(BaseObject) then begin
      nDamage:=0;
      Inc(nDamage,BaseObject.GetHitStruckDamage(Self,nHitPower));
      Inc(nDamage,BaseObject.GetMagStruckDamage(Self,nMagPower));
      if nDamage > 0 then begin
        BaseObject.StruckDamage(nDamage);
        BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,nDamage,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',200);
      end;
    end;
  end;
  BaseObjectList.Free;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TAnimalObject.DelTargetCreat;
begin
  inherited;
  m_nTargetX:=-1;
  m_nTargetY:=-1;
end;

procedure TAnimalObject.SearchTarget; //004C94B4
var
	BaseObject,BaseObject18:TBaseObject;
	i,nC,n10:integer;
begin
	BaseObject18:=nil;
	n10:=999;

	for i:=0 to m_VisibleActors.Count -1 do begin
		BaseObject:=pTVisibleBaseObject(m_VisibleActors.Items[i]).BaseObject;
		if not BaseObject.m_boDeath then begin
			if IsProperTarget(BaseObject) and
			(not BaseObject.m_boHideMode or m_boCoolEye) then begin
				nC:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
				if nC < n10 then begin
					n10:=nC;
					BaseObject18:=BaseObject;
				end;
			end;
		end;      
	end;

	if BaseObject18 <> nil then SetTargetCreat{FFF2}(BaseObject18);
end;

procedure TAnimalObject.sub_4C959C;//004C959C
var
  I,nC,n10:integer;
  Creat,BaseObject:TBaseObject;
begin
  Creat:=nil;
  n10:=999;
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject;
    if BaseObject.m_boDeath then Continue;
    if IsProperTarget(BaseObject) then begin
      nC:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
      if nC < n10 then begin
        n10:=nC;
        Creat:=BaseObject;
      end;
    end;
  end;    // for
  if Creat <> nil then
    SetTargetCreat(Creat);
end
procedure TAnimalObject.SetTargetXY(nX, nY: Integer);//004C9668
begin
  m_nTargetX:= nX;
  m_nTargetY:= nY;
end;

{ Fuck! Korean rubbish english, Here is Wander }
procedure TAnimalObject.Wondering; //004C9810
begin
	if (Random(20)= 0) then begin
		if (Random(4) = 1) then begin
			TurnTo(Random(8))
		end else begin
			WalkTo(m_btDirection,False);
		end;
	end;
end;



end.
