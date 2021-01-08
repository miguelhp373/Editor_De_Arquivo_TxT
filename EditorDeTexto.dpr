program EditorDeTexto;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FramePrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Editor de Texto';
  Application.CreateForm(TFramePrincipal, FramePrincipal);
  Application.Run;
end.
