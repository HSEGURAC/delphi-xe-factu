unit DataModule;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, DBXFirebird,
  SqlExpr,IniFiles,Forms, ImgList, Controls;


type
  TDataModule1 = class(TDataModule)
    DMBaseDatos: TIBDatabase;
    dsDMDataSourse: TDataSource;
    DMQuery: TIBQuery;
    DMTransaction: TIBTransaction;
    ilImageList: TImageList;
    conDMBaseDatos: TSQLConnection;
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
    ini.WriteString('Configuraci�n', 'BD', '');
    ini.WriteString('Configuraci�n', 'USER', '');
    ini.WriteString('Configuraci�n', 'PASS', '');
    ini.free;
    }

    MyIniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) +'\ServerXE.ini');
    Try
      BBDDName:=MyIniFile.ReadString('Configuraci�n','BD','');
     // Usuario:=MyIniFile.ReadString('Configuraci�n','USER','');
     // Password:=MyIniFile.ReadString('Configuraci�n','PASS','');
    Finally
    MyIniFile.Free;
    End;

    DMBaseDatos.DatabaseName:= BBDDName;
    conDMBaseDatos.Params.Values['Database']:=BBDDName;
    //Para que no aparezca el dialogo de conexion.
    DMBaseDatos.LoginPrompt := false;
   // DMBaseDatos.Params.Add('USER NAME=' + Usuario);
   // DMBaseDatos.Params.Add('PASSWORD=' + Password);
 end;
 initialization
  sysutils.Decimalseparator := ',';
  sysutils.ThousandSeparator := '.';
end.
