unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI,
  Data.Bind.Components, Data.Bind.DBScope;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQueryCrearBaseDatos: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQueryProductos: TFDQuery;
    FDQueryInsertar: TFDQuery;
    FDQueryProductosCODIGOS: TStringField;
    FDQueryProductosDESCRIPCION: TStringField;
    FDQueryProductosPRECIO: TFMTBCDField;
    FDQueryProductosOBSERVACIONES: TStringField;
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDQueryProductosUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InicializarDB;
    constructor create(Aowner: tcomponent); override;
    procedure CargarProductos;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}
{ TDataModule1 }

uses
  System.ioutils, UPrincipal;

procedure TDataModule1.CargarProductos;
begin
  self.FDQueryProductos.Active := true;
  self.FDQueryProductos.Open;
end;

constructor TDataModule1.create(Aowner: tcomponent);
begin
  inherited;
  InicializarDB;
end;

procedure TDataModule1.FDConnection1BeforeConnect(Sender: TObject);
begin
{$IF DEFINED (ANDROID)}
  FDConnection1.Params.Values['Database'] :=
    TPath.Combine(TPath.GetDocumentsPath, 'CodeDB.db');
{$ENDIF}
end;

procedure TDataModule1.FDQueryProductosUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  FPrincipal.TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);
end;

procedure TDataModule1.InicializarDB;
begin
  FDQueryCrearBaseDatos.ExecSQL;
end;

end.
