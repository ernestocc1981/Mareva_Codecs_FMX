unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Layouts,
  System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt,
  FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid, Data.Bind.Controls, FMX.Bind.Navigator, FMX.Memo, FMX.Edit,
  FMX.ExtCtrls, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.PhoneDialer.Actions, System.ImageList,
  FMX.ImgList, FMX.DialogService, Data.DB, FMX.MultiView, FMX.Header,
  FMX.ListBox, FMX.SearchBox, FMX.Ani, FMX.Media, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.TreeView, FMX.Gestures, FMX.MediaLibrary.Actions;

type
  TFPrincipal = class(TForm)
    TabControl1: TTabControl;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    Rectangle2: TRectangle;
    ActionList1: TActionList;
    Actualizar: TAction;
    PhoneCallErnesto: TPhoneCallAction;
    Cerrar: TWindowClose;
    PhoneCallYudeinis: TPhoneCallAction;
    Insertar: TAction;
    Siguiente: TAction;
    Anterior: TAction;
    Eliminar: TAction;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ImageList1: TImageList;
    Abrir: TAction;
    Ocultar: TAction;
    Layout2: TLayout;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    VertScrollBox2: TVertScrollBox;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    TextTotal: TText;
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    EditCodigo: TEdit;
    EditDescripcion: TEdit;
    EditPrecio: TEdit;
    EditObserv: TEdit;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkFillControlToField2: TLinkFillControlToField;
    Action1: TAction;
    TabItem3: TTabItem;
    TakePhotoFromLibraryAction1: TTakePhotoFromLibraryAction;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    MediaPlayerStart1: TMediaPlayerStart;
    SendSMS: TAction;
    MediaPlayerStop1: TMediaPlayerStop;
    MediaPlayerPlayPause1: TMediaPlayerPlayPause;
    LinkFillControlToField3: TLinkFillControlToField;
    ToolBar2: TToolBar;
    Text1: TText;
    Button6: TButton;
    StyleBook1: TStyleBook;
    Image1: TImage;
    Button8: TButton;
    Button9: TButton;
    GestureManager1: TGestureManager;
    Image2: TImage;
    Image3: TImage;
    Button7: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button3Tap(Sender: TObject; const Point: TPointF);
    procedure ActualizarExecute(Sender: TObject);
    procedure InsertarExecute(Sender: TObject);
    procedure SiguienteExecute(Sender: TObject);
    procedure AnteriorExecute(Sender: TObject);
    procedure EliminarExecute(Sender: TObject);
    procedure CerrarCanActionExec(Sender: TCustomAction; var CanExec: Boolean);
    procedure TabItem1Click(Sender: TObject);
    procedure ListBoxItem32Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button_Siguiente_HabanoClick(Sender: TObject);
    procedure Button_anterior_habanosClick(Sender: TObject);
    procedure Edit1ChangeTracking(Sender: TObject);
    procedure Edit2ChangeTracking(Sender: TObject);
    procedure Edit3ChangeTracking(Sender: TObject);
    procedure Edit4ChangeTracking(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

// {$R *.GGlass.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}

uses UDataModule, UDialogo, UHabanos, Unit2, UEliminar;

function GetDeleteConfirmation(AMessage: String): String;
var
  lResultStr: String;
begin
  lResultStr := '';
  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  TDialogService.MessageDialog(AMessage, TMsgDlgType.mtConfirmation,
    FMX.Dialogs.mbYesNo, TMsgDlgBtn.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYes:
          lResultStr := 'Y';
        mrNo:
          lResultStr := 'N';
      end;
    end);

  Result := lResultStr;
end;

procedure TFPrincipal.Action1Execute(Sender: TObject);
begin
  ShowMessage('Ejemplo');
end;

procedure TFPrincipal.ActualizarExecute(Sender: TObject);
begin

  BindSourceDB1.DataSource.DataSet.Refresh;
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  UDataModule.DataModule1.FDQueryProductos.SQL.Clear;
  UDataModule.DataModule1.FDQueryProductos.SQL.Text :=
    'SELECT * FROM PRODUCTOS ';
  UDataModule.DataModule1.FDQueryProductos.Open;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);

end;

procedure TFPrincipal.AnteriorExecute(Sender: TObject);
begin
  BindSourceDB1.DataSource.DataSet.Prior;
end;

procedure TFPrincipal.Button3Tap(Sender: TObject; const Point: TPointF);
begin
  BindSourceDB1.DataSource.DataSet.Last;
end;

procedure TFPrincipal.Button7Click(Sender: TObject);
begin

  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  TextTotal.Text := '';

  UDataModule.DataModule1.FDQueryProductos.SQL.Clear;

  UDataModule.DataModule1.FDQueryProductos.SQL.Text :=
    'SELECT * FROM PRODUCTOS ';

  UDataModule.DataModule1.FDQueryProductos.Open;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);

end;

procedure TFPrincipal.Button_anterior_habanosClick(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.Prior
end;

procedure TFPrincipal.Button_Siguiente_HabanoClick(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.Next
end;

procedure TFPrincipal.CerrarCanActionExec(Sender: TCustomAction;
var CanExec: Boolean);
begin
  Close;
end;

procedure TFPrincipal.CheckBox3Click(Sender: TObject);
begin
  FShow.show;
end;

procedure TFPrincipal.Edit1ChangeTracking(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.SQL.Clear;
  UDataModule.DataModule1.FDQueryProductos.SQL.Text :=
    'SELECT * FROM PRODUCTOS WHERE DESCRIPCION IN (SELECT DESCRIPCION FROM PRODUCTOS ';
  // WHERE CODIGOS LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  UDataModule.DataModule1.FDQueryProductos.SQL.Add(' WHERE CODIGOS LIKE ' +
    QuotedStr('%' + Edit1.Text + '%'));
  DataModule1.FDQueryProductos.SQL.Add(' )');
  UDataModule.DataModule1.FDQueryProductos.Open;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);
end;

procedure TFPrincipal.Edit2ChangeTracking(Sender: TObject);
var
  after: string;
begin
  // aqui sustituyo el espacio por %

  after := stringreplace(Edit2.Text, ' ', '%', [rfReplaceAll, rfIgnoreCase]);

  UDataModule.DataModule1.FDQueryProductos.SQL.Clear;
  UDataModule.DataModule1.FDQueryProductos.SQL.Text :=
    'SELECT * FROM PRODUCTOS ';
  UDataModule.DataModule1.FDQueryProductos.SQL.Add(' WHERE DESCRIPCION LIKE ' +
    QuotedStr('%' + after + '%'));
  UDataModule.DataModule1.FDQueryProductos.Open;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);
end;

procedure TFPrincipal.Edit3ChangeTracking(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.SQL.Clear;
  UDataModule.DataModule1.FDQueryProductos.SQL.Text :=
    'SELECT * FROM PRODUCTOS ';
  UDataModule.DataModule1.FDQueryProductos.SQL.Add(' WHERE PRECIO LIKE ' +
    QuotedStr('%' + Edit3.Text + '%'));
  UDataModule.DataModule1.FDQueryProductos.Open;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);
end;

procedure TFPrincipal.Edit4ChangeTracking(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.SQL.Clear;
  UDataModule.DataModule1.FDQueryProductos.SQL.Text :=
    'SELECT * FROM PRODUCTOS WHERE DESCRIPCION IN (SELECT DESCRIPCION FROM PRODUCTOS ';
  // WHERE CODIGOS LIKE ' + QuotedStr('%'+Edit1.Text+'%');
  // UDataModule.DataModule1.FDQueryProductos.SQL.Text := 'SELECT * FROM PRODUCTOS ';
  UDataModule.DataModule1.FDQueryProductos.SQL.Add(' WHERE OBSERVACIONES LIKE '
    + QuotedStr('%' + Edit4.Text + '%'));
  DataModule1.FDQueryProductos.SQL.Add(' )');
  UDataModule.DataModule1.FDQueryProductos.Open;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);
end;

procedure TFPrincipal.EliminarExecute(Sender: TObject);
begin

  with TFEliminar.Create(Self) do
    try
      begin
        UEliminar.FEliminar.Text1.Text :=
          ('¿Está seguro que desea eliminar el código ' +
          EditCodigo.Text + '?');
        FEliminar.show;
      end;
    finally
      Free
    end;

end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.Active := true;
  UDataModule.DataModule1.FDQueryProductos.Open;

  // TabControl1.ActiveTab := TabItem1;

  if UDataModule.DataModule1.FDQueryProductos.RecordCount = 0 then
  begin
    UDataModule.DataModule1.FDQueryInsertar.ExecSQL;
  end;
  TextTotal.Text :=
    IntToStr(UDataModule.DataModule1.FDQueryProductos.RecordCount);
end;

procedure TFPrincipal.InsertarExecute(Sender: TObject);
begin

  if (EditCodigo.Text <> '') or (EditDescripcion.Text <> '') then
  begin
    BindSourceDB1.DataSource.DataSet.Insert;
  end;

end;

procedure TFPrincipal.ListBoxItem32Click(Sender: TObject);
begin
  Form1.show;

end;

procedure TFPrincipal.SiguienteExecute(Sender: TObject);
begin
  BindSourceDB1.DataSource.DataSet.Next;
end;

procedure TFPrincipal.TabItem1Click(Sender: TObject);
begin
  UDataModule.DataModule1.FDQueryProductos.Close;
  UDataModule.DataModule1.FDQueryProductos.Open;
end;

end.
