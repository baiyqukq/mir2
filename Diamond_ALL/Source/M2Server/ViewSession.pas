unit ViewSession;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,Grobal2;

type
  TfrmViewSession = class(TForm)
    ButtonRefGrid: TButton;
    PanelStatus: TPanel;
    GridSession: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure ButtonRefGridClick(Sender: TObject);
  private
    procedure RefGridSession();
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmViewSession: TfrmViewSession;

implementation

uses IdSrvClient, M2Share;

{$R *.dfm}

procedure TfrmViewSession.FormCreate(Sender: TObject);
begin
  GridSession.Cells[0,0]:='Idx';
  GridSession.Cells[1,0]:='User ID';
  GridSession.Cells[2,0]:='IP Address';
  GridSession.Cells[3,0]:='Session ID';
  GridSession.Cells[4,0]:='Payment';
  GridSession.Cells[5,0]:='Pay Mode';
end;

procedure TfrmViewSession.Open;
begin
  RefGridSession();
  ShowModal;
end;

procedure TfrmViewSession.RefGridSession;
var
  I: Integer;
  SessInfo:pTSessInfo;
begin
  PanelStatus.Caption:='Refreshing Grid...';
  GridSession.Visible:=False;
  GridSession.Cells[0,1]:='';
  GridSession.Cells[1,1]:='';
  GridSession.Cells[2,1]:='';
  GridSession.Cells[3,1]:='';
  GridSession.Cells[4,1]:='';
  GridSession.Cells[5,1]:='';
  FrmIDSoc.m_SessionList.Lock;
  try
    if FrmIDSoc.m_SessionList.Count <= 0 then begin
      GridSession.RowCount:=2;
      GridSession.FixedRows:=1;
    end else begin
      GridSession.RowCount:=FrmIDSoc.m_SessionList.Count + 1;
    end;
    for I := 0 to FrmIDSoc.m_SessionList.Count - 1 do begin
      SessInfo:=FrmIDSoc.m_SessionList.Items[I];
      GridSession.Cells[0,I + 1]:=IntToStr(I);
      GridSession.Cells[1,I + 1]:=SessInfo.sAccount;
      GridSession.Cells[2,I + 1]:=SessInfo.sIPaddr;
      GridSession.Cells[3,I + 1]:=IntToStr(SessInfo.nSessionID);
      GridSession.Cells[4,I + 1]:=IntToStr(SessInfo.nPayMent);
      GridSession.Cells[5,I + 1]:=IntToStr(SessInfo.nPayMode);
    end;
  finally
    FrmIDSoc.m_SessionList.UnLock;
  end;
  GridSession.Visible:=True;
end;

procedure TfrmViewSession.ButtonRefGridClick(Sender: TObject);
begin
  RefGridSession();
end;

end.
