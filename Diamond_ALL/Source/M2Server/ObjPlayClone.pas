unit ObjPlayClone;

interface

type
  TPlayCloneObject=class(TPlayObject)
  public
    m_dwRunTime         :LongWord;
    m_dwRunNextTick     :LongWord;

  public
    constructor Create(PlayObject:TPlayObject);
    destructor Destroy; override;

	  function  Operate(ProcessMsg:pTProcessMessage):Boolean;override;
  end;

implementation

uses ObjPlay


constructor TPlayCloneObject.Create(PlayObject:TPlayObject);
begin
  inherited Create;
  m_dwRunTime			  := GetTickCount();
	m_dwRunNextTick		:= 5000;

  m_sCharName       := 'Clone';

	m_nCurrX			    := PlayObject.m_nCurrX;
	m_nCurrY			    := PlayObject.m_nCurrY;
	m_btDirection		  := GetBackDir(PlayObject.m_btDirection);
	m_PEnvir			    := PlayObject.m_PEnvir;

  m_btGender        := PlayObject.m_btGender;
  m_btHair          := PlayObject.m_btHair;


  m_PEnvir.AddToMap(m_nCurrX, m_nCurrY, OS_MOVINGOBJECT, self);

  SendRefMsg(RM_TURN, m_btDirection, m_nCurrX, m_nCurrY, 0, m_sCharName);
end;
destructor TPlayCloneObject.Destroy;
begin

  inherited;
end;

function TPlayCloneObject.Operate(ProcessMsg:pTProcessMessage):Boolean;
begin
  Result:=inherited Operate(ProcessMsg);
end;


end.
