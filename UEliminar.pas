unit UEliminar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TFEliminar = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Text1: TText;
    Image1: TImage;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEliminar: TFEliminar;

implementation

{$R *.fmx}

uses UPrincipal;

procedure TFEliminar.Button1Click(Sender: TObject);
begin
  FEliminar.Close;
end;

procedure TFEliminar.Button2Click(Sender: TObject);
begin
 FPrincipal.BindSourceDB1.DataSource.DataSet.Delete;
  FEliminar.Close;
end;

end.
