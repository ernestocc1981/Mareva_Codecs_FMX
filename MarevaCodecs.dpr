program MarevaCodecs;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  UEliminar in 'UEliminar.pas' {FEliminar};

//UHabanos in 'UHabanos.pas' {Form1}
 // UFShow in 'UFShow.pas' {FShow},
  //UEliminar in 'UEliminar.pas' {FEliminar};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFEliminar, FEliminar);
  Application.Run;

end.
