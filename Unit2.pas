unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.ScrollBox, FMX.Memo,
  System.Rtti, FMX.Grid.Style, FMX.TabControl, FMX.Grid;

type
  TFShow = class(TForm)
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    Image1: TImage;
    Image2: TImage;
    Text1: TText;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Text2: TText;
    Memo1: TMemo;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FShow: TFShow;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

end.
