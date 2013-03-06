unit DataModule;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, DBXFirebird,
  SqlExpr,IniFiles,Forms;


type
  TDataModule1 = class(TDataModule)
    DMBaseDatos: TIBDatabase;
    dsDMDataSourse: TDataSource;
    DMQuery: TIBQuery;
    DMTransaction: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;




implementation

{$R *.dfm}



procedure TDataModule1.DataModuleCreate(Sender: TObject);
Var
 Ini: TiniFile;
 MyIniFile : TIniFile;
 BBDDName : String;
 Usuario : String;
 Password : String;


begin
    {//crear por 1era vez
    ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) +'\ServerXE.ini');
    ini.WriteString('Configuración', 'BD', '');
    ini.WriteString('Configuración', 'USER', '');
    ini.WriteString('Configuración', 'PASS', '');
    ini.free;
    }

    MyIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) +'\ServerXE.ini');
    Try
      BBDDName:=MyIniFile.ReadString('Configuración','BD','');
     // Usuario:=MyIniFile.ReadString('Configuración','USER','');
     // Password:=MyIniFile.ReadString('Configuración','PASS','');
    Finally
    MyIniFile.Free;
    End;

    DMBaseDatos.DatabaseName:= BBDDName;
    //Para que no aparezca el dialogo de conexion.
    DMBaseDatos.LoginPrompt := false;
   // DMBaseDatos.Params.Add('USER NAME=' + Usuario);
   // DMBaseDatos.Params.Add('PASSWORD=' + Password);

 END;
end.
