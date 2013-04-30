{ Ejemplo de utilizaci�n de Google Maps en Delphi.
  by  Neftal�  -Germ�n Est�vez-  2009
  http://neftali.clubdelphi.com

  NOTA: Este ejemplo y su c�digo es de libre distribuci�n. Si te es de utilidad,
  tienes sugerencias, comentarios o errores puedes escribirlos en mi web.
  Todos ellos ser�n bienvenidos.  ;-D
  http://neftali.clubdelphi.com

  NOTE: This sampole and its code is freely distributed. If you are useful,
   have suggestions, comments or errors can post it to my website.
   All of them are welcome. ;-D
   http://neftali.clubdelphi.com
}
program GMapDelphi;

uses
  ExceptionLog,
  Forms,
  UTGeoCode in 'UTGeoCode.pas',
  UConstantes in 'UConstantes.pas',
  FVerMapa in 'FVerMapa.pas' {FormVerMapa};

{$R MapaRes.res}

begin
  Application.Initialize;
  Application.Title := 'Test de Google Maps en Delphi';
  Application.CreateForm(TFormVerMapa, FormVerMapa);
  Application.Run;
end.
