unit UDialogo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ScrollBox, FMX.Memo;

type
  TFDialogo = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDialogo: TFDialogo;

implementation

{$R *.fmx}

uses UDataModule, UPrincipal;

procedure TFDialogo.Button1Click(Sender: TObject);
begin
  FPrincipal.BindSourceDB1.DataSource.DataSet.delete;
  FDialogo.Close;
end;

procedure TFDialogo.Button2Click(Sender: TObject);
begin
   FDialogo.Close;
end;

procedure TFDialogo.FormShow(Sender: TObject);
begin
  Label1.Text := '¿Está seguro que desea eliminar el código' + FPrincipal.EditCodigo.Text +'?';
end;

end.
