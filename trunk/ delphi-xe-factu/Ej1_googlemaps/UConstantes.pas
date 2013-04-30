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
unit UConstantes;

interface

uses
  Messages;

// Errores
const
  EMAP_MSG_ERRORGETRES = 'Error no se encuentra el recurso.';


const
  CM_AFTERSHOW = WM_USER + 7841;

// varios
const
  FILENAME_LUGARES = 'Lugares.txt';

// constantes relacionadas con mapas HTML
const
  CHAR_SPACE = ' ';
  STR_EMPTY = '';
  CHAR_PLUS = '+';
  CHAR_CRLF = #13#10;
  RES_HTML_PAGEMAP  = 'RES_HTML_PAGEMAP';
  G_NORMAL_MAP      = 'G_NORMAL_MAP';
  G_SATELLITE_MAP   = 'G_SATELLITE_MAP';
  G_HYBRID_MAP      = 'G_HYBRID_MAP';

// elementos y controles del mapa
const
  MAP_LARGE_CONTROL = 'GLargeMapControl';
  MAP_SMALL_ZOOM    = 'GSmallZoomControl';
  MAP_TYPE_CONTROL  = 'GMapTypeControl';  

// Constantes para consultas
const
  G_GEO_SUCCESS             = 'G_GEO_SUCCESS';
  G_GEO_BAD_REQUEST         = 'G_GEO_BAD_REQUEST';
  G_GEO_SERVER_ERROR        = 'G_GEO_SERVER_ERROR';
  G_GEO_MISSING_QUERY       = 'G_GEO_MISSING_QUERY';
  G_GEO_MISSING_ADDRESS     = 'G_GEO_MISSING_ADDRESS';
  G_GEO_UNKNOWN_ADDRESS     = 'G_GEO_UNKNOWN_ADDRESS';
  G_GEO_UNAVAILABLE_ADDRESS = 'G_GEO_UNAVAILABLE_ADDRES';
  G_GEO_UNKNOWN_DIRECTIONS  = 'G_GEO_UNKNOWN_DIRECTIONS';
  G_GEO_BAD_KEY             = 'G_GEO_BAD_KEY';
  G_GEO_TOO_MANY_QUERIES    = 'G_GEO_TOO_MANY_QUERIES';
  G_GEO_UNKNOW_CODE         = 'unknow code';

// constantes de precision
const
  STR_PREC_0 = 'Ubicaci�n desconocida.';
  STR_PREC_1 = 'Precisi�n a nivel de pa�s.';
  STR_PREC_2 = 'Precisi�n a nivel de regi�n';
  STR_PREC_3 = 'Precisi�n a nivel de subregi�n';
  STR_PREC_4 = 'Precisi�n a nivel de ciudad o pueblo.';
  STR_PREC_5 = 'Precisi�n a nivel de c�digo postal.';
  STR_PREC_6 = 'Precisi�n a nivel de calle.';
  STR_PREC_7 = 'Precisi�n a nivel de intersecci�n.';
  STR_PREC_8 = 'Precisi�n a nivel de direcci�n.';
  STR_PREC_9 = 'Precisi�n a nivel de edificio.';
  G_PREC_UNKNOW_CODE = 'unknow code';

implementation

end.
