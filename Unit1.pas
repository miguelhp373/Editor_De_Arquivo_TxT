unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ExtCtrls;

type
  TFramePrincipal = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    XPManifest1: TXPManifest;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FramePrincipal: TFramePrincipal;

implementation

{$R *.dfm}

procedure TFramePrincipal.Button1Click(Sender: TObject);
var
  FileNameSelectManipulation:TextFile;
  FileLinesManipulation:String;
begin
  Edit1.Clear;
  Memo1.clear;

   if(OpenDialog1.Execute)then
    if(Trim(OpenDialog1.FileName) <> '')then
      begin
        Button2.Enabled:= true;
        Edit1.Text:=OpenDialog1.FileName;
        AssignFile(FileNameSelectManipulation,OpenDialog1.FileName);
        Reset(FileNameSelectManipulation);
        while not (eof(FileNameSelectManipulation))do
        begin
          Readln(FileNameSelectManipulation,FileLinesManipulation);
          Memo1.Lines.Add(FileLinesManipulation)
        end;
        CloseFile(FileNameSelectManipulation);
    end;
end;

procedure TFramePrincipal.Button2Click(Sender: TObject);
var
  FileNameManipulation:TextFile;
  I:Integer;
begin
  I:=0;
    If(SaveDialog1.Execute)Then
      If(Trim(SaveDialog1.FileName) <> '') Then
        begin
            if(FileExists(SaveDialog1.FileName))then
              AssignFile(FileNameManipulation, savedialog1.filename)
             else
              AssignFile(FileNameManipulation, savedialog1.filename + '.txt');

              Rewrite(FileNameManipulation);

                while not(I = Memo1.Lines.Count)do
                  begin
                    Writeln(FileNameManipulation,Memo1.Lines.Strings[I]);
                    Inc(I);//incrementa mais 1 na variavel I
                end;//end loop

                closeFile(FileNameManipulation);
                ShowMessage('Arquivo Salvo Com Sucesso');
                Button2.Enabled:=false;
                Memo1.Clear;
                Edit1.Text:='Nenhum Arquivo Selecionado' ;

           end;//end if
      end;



end.
