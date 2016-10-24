unit CastleManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin;

type
  TfrmCastleManage = class(TForm)
    GroupBox1: TGroupBox;
    ListViewCastle: TListView;
    GroupBox2: TGroupBox;
    PageControlCastle: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    EditOwenGuildName: TEdit;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    EditTotalGold: TSpinEdit;
    EditTodayIncome: TSpinEdit;
    Label7: TLabel;
    EditTechLevel: TSpinEdit;
    Label8: TLabel;
    EditPower: TSpinEdit;
    TabSheet3: TTabSheet;
    GroupBox5: TGroupBox;
    ListViewGuard: TListView;
    ButtonRefresh: TButton;
    procedure ListViewCastleClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
  private
    procedure RefCastleList;
    procedure RefCastleInfo;
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmCastleManage: TfrmCastleManage;

implementation

uses Castle, M2Share;

{$R *.dfm}
var
  CurCastle:TUserCastle;
  boRefing:Boolean;
{ TfrmCastleManage }

procedure TfrmCastleManage.Open;
begin
  RefCastleList();
  ShowModal;
end;

procedure TfrmCastleManage.RefCastleInfo;
var
  I,II: Integer;
  ListItem:TListItem;
  ObjUnit:pTObjUnit;
begin
  if CurCastle = nil then exit;
  boRefing:=True;
  if CurCastle.m_MasterGuild = nil then EditOwenGuildName.Text:=''
  else EditOwenGuildName.Text:=CurCastle.m_MasterGuild.sGuildName;
  EditTotalGold.Value    :=CurCastle.m_nTotalGold;
  EditTodayIncome.Value  :=CurCastle.m_nTodayIncome;
  EditTechLevel.Value    :=CurCastle.m_nTechLevel;
  EditPower.Value        :=CurCastle.m_nPower;
  ListViewGuard.Clear;
  ListItem:=ListViewGuard.Items.Add;
  ListItem.Caption:='0';
  if CurCastle.m_MainDoor.BaseObject <> nil then begin
    ListItem.SubItems.Add(CurCastle.m_MainDoor.BaseObject.m_sCharName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_MainDoor.BaseObject.m_nCurrX,CurCastle.m_MainDoor.BaseObject.m_nCurrY]));
    ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_MainDoor.BaseObject.m_WAbil.HP,CurCastle.m_MainDoor.BaseObject.m_WAbil.MaxHP]));
    if CurCastle.m_MainDoor.BaseObject.m_boDeath then begin
      ListItem.SubItems.Add('Ëð»µ');
    end else
    if (CurCastle.m_DoorStatus <> nil) and CurCastle.m_DoorStatus.boOpened then begin
      ListItem.SubItems.Add('¿ªÆô');
    end else begin
      ListItem.SubItems.Add('¹Ø±Õ');
    end;
  end else begin
    ListItem.SubItems.Add(CurCastle.m_MainDoor.sName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_MainDoor.nX,CurCastle.m_MainDoor.nY]));
    ListItem.SubItems.Add(format('%d/%d',[0,0]));
  end;

  ListItem:=ListViewGuard.Items.Add;
  ListItem.Caption:='1';
  if CurCastle.m_LeftWall.BaseObject <> nil then begin
    ListItem.SubItems.Add(CurCastle.m_LeftWall.BaseObject.m_sCharName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_LeftWall.BaseObject.m_nCurrX,CurCastle.m_LeftWall.BaseObject.m_nCurrY]));
    ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_LeftWall.BaseObject.m_WAbil.HP,CurCastle.m_LeftWall.BaseObject.m_WAbil.MaxHP]));
  end else begin
    ListItem.SubItems.Add(CurCastle.m_LeftWall.sName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_LeftWall.nX,CurCastle.m_LeftWall.nY]));
    ListItem.SubItems.Add(format('%d/%d',[0,0]));
  end;

  ListItem:=ListViewGuard.Items.Add;
  ListItem.Caption:='2';
  if CurCastle.m_CenterWall.BaseObject <> nil then begin
    ListItem.SubItems.Add(CurCastle.m_CenterWall.BaseObject.m_sCharName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_CenterWall.BaseObject.m_nCurrX,CurCastle.m_CenterWall.BaseObject.m_nCurrY]));
    ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_CenterWall.BaseObject.m_WAbil.HP,CurCastle.m_CenterWall.BaseObject.m_WAbil.MaxHP]));
  end else begin
    ListItem.SubItems.Add(CurCastle.m_CenterWall.sName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_CenterWall.nX,CurCastle.m_CenterWall.nY]));
    ListItem.SubItems.Add(format('%d/%d',[0,0]));
  end;

  ListItem:=ListViewGuard.Items.Add;
  ListItem.Caption:='3';
  if CurCastle.m_RightWall.BaseObject <> nil then begin
    ListItem.SubItems.Add(CurCastle.m_RightWall.BaseObject.m_sCharName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_RightWall.BaseObject.m_nCurrX,CurCastle.m_RightWall.BaseObject.m_nCurrY]));
    ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_RightWall.BaseObject.m_WAbil.HP,CurCastle.m_RightWall.BaseObject.m_WAbil.MaxHP]));
  end else begin
    ListItem.SubItems.Add(CurCastle.m_RightWall.sName);
    ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_RightWall.nX,CurCastle.m_RightWall.nY]));
    ListItem.SubItems.Add(format('%d/%d',[0,0]));
  end;
  for I := Low(CurCastle.m_Archer) to High(CurCastle.m_Archer) do begin
    ObjUnit:=@CurCastle.m_Archer[I];
    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:=IntToStr(I + 4);
    if ObjUnit.BaseObject <> nil then begin
      ListItem.SubItems.Add(ObjUnit.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[ObjUnit.BaseObject.m_nCurrX,ObjUnit.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[ObjUnit.BaseObject.m_WAbil.HP,ObjUnit.BaseObject.m_WAbil.MaxHP]));
    end else begin
      ListItem.SubItems.Add(ObjUnit.sName);
      ListItem.SubItems.Add(format('%d:%d',[ObjUnit.nX,ObjUnit.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;
  end;
  for II := Low(CurCastle.m_Guard) to High(CurCastle.m_Guard) do begin
    ObjUnit:=@CurCastle.m_Guard[II];
    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:=IntToStr(I + 4);
    if ObjUnit.BaseObject <> nil then begin
      ListItem.SubItems.Add(ObjUnit.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[ObjUnit.BaseObject.m_nCurrX,ObjUnit.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[ObjUnit.BaseObject.m_WAbil.HP,ObjUnit.BaseObject.m_WAbil.MaxHP]));
    end else begin
      ListItem.SubItems.Add(ObjUnit.sName);
      ListItem.SubItems.Add(format('%d:%d',[ObjUnit.nX,ObjUnit.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;
  end;
  boRefing:=False;
end;

procedure TfrmCastleManage.RefCastleList;
var
  I: Integer;
  UserCastle:TUserCastle;
  ListItem:TListItem;
begin
  g_CastleManager.Lock;
  try
    for I := 0 to g_CastleManager.m_CastleList.Count - 1 do begin
      UserCastle:=TUserCastle(g_CastleManager.m_CastleList.Items[I]);
      ListItem:=ListViewCastle.Items.Add;
      ListItem.Caption:=IntToStr(I);
      ListItem.SubItems.AddObject(UserCastle.m_sConfigDir,UserCastle);
      ListItem.SubItems.Add(UserCastle.m_sName)
    end;
  finally
    g_CastleManager.UnLock;
  end;
end;

procedure TfrmCastleManage.ListViewCastleClick(Sender: TObject);
var
  ListItem:TListItem;
begin
  ListItem:=ListViewCastle.Selected;
  if ListItem = nil then exit;
  CurCastle:=TUserCastle(ListItem.SubItems.Objects[0]);
  RefCastleInfo();
end;

procedure TfrmCastleManage.ButtonRefreshClick(Sender: TObject);
begin
  RefCastleInfo();
end;

end.
