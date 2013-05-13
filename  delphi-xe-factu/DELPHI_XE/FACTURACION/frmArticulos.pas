unit frmArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DBCtrls, IBQuery, DB, IBCustomDataSet, IBTable, StdCtrls,
  Mask, ExtCtrls, Grids, DBGrids, JvDBImage, ExtDlgs,
  jpeg, JvGIF, JvPCX, JvAni, JvExDBGrids, JvDBGrid, JvJVCLUtils,
  Buttons, DBClient, JvExExtCtrls, JvImage, DBGridEhGrouping, Provider, GridsEh,
  DBGridEh, DBCtrlsEh, DBLookupEh, IBStoredProc,pngimage, GIFImg;

type
  TfrmArticulosUt = class(TForm)
    pgcConsulta: TPageControl;
    tsDatos: TTabSheet;
    tsConsulta: TTabSheet;
    pnl1: TPanel;
    dbnvgr1: TDBNavigator;
    grp1: TGroupBox;
    dbedtCodArt: TDBEdit;
    dbedtNombreArt: TDBEdit;
    grp2: TGroupBox;
    dbedtPrecioCompra: TDBEdit;
    dbedtExistencia: TDBEdit;
    dbedtExistenciaMin: TDBEdit;
    dbchkPRECIO_MODIFICABLE: TDBCheckBox;
    dbchkAVISAR_EXIST_MIN: TDBCheckBox;
    dbmmoOBSERVACION: TDBMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    dsArticulo: TDataSource;
    qryUnidadMedida: TIBQuery;
    qryTipoIva: TIBQuery;
    qryRamo: TIBQuery;
    qryProveedor: TIBQuery;
    dsUM: TDataSource;
    dsIVA: TDataSource;
    dsPROVEE: TDataSource;
    dsRAMO: TDataSource;
    qryGrillaArticulos: TIBQuery;
    dsGrillaArt: TDataSource;
    qryAux: TIBQuery;
    SQLQRY: TIBQuery;
    DBGridEh1: TDBGridEh;
    qryArticulo: TIBQuery;
    dspvArticulo: TDataSetProvider;
    cdsArticulo: TClientDataSet;
    cbxUM: TDBLookupComboboxEh;
    cbxIVA: TDBLookupComboboxEh;
    cbxRAMO: TDBLookupComboboxEh;
    cbxPROVEEDOR: TDBLookupComboboxEh;
    OpenPictureDialog: TOpenPictureDialog;
    lbl11: TLabel;
    dbedtPRECIOVTA: TDBEdit;
    btnProveed: TButton;
    Image1: TImage;
    qryArticuloCODARTICULO: TLargeintField;
    tbArticuloAVISAR_EXIST_MIN: TIBStringField;
    cdsArticuloCODPROVEEDOR: TIntegerField;
    cdsArticuloCODRAMO: TIntegerField;
    cdsArticuloCODTIPOIVA: TIntegerField;
    cdsArticuloCODUNIDADMEDIDA: TIntegerField;
    tbArticuloDESCRIPCION: TIBStringField;
    cdsArticuloEXISTENCIA: TIntegerField;
    cdsArticuloEXISTENCIA_MIN: TIntegerField;
    tbArticuloIMG_EXT: TIBStringField;
    qryArticuloIMAGEN: TBlobField;
    tbArticuloNOM_IMG: TIBStringField;
    tbArticuloOBSERVACION: TIBStringField;
    tbArticuloPRECIO_MODIFICABLE: TIBStringField;
    qryArticuloPRECIOCOMPRA: TLargeintField;
    qryArticuloPRECIOVTA: TLargeintField;
    cdsArticuloCODARTICULO: TLargeintField;
    cdsArticuloAVISAR_EXIST_MIN: TWideStringField;
    cdsArticuloCODPROVEEDOR2: TIntegerField;
    cdsArticuloCODRAMO2: TIntegerField;
    cdsArticuloCODTIPOIVA2: TIntegerField;
    cdsArticuloCODUNIDADMEDIDA2: TIntegerField;
    cdsArticuloDESCRIPCION: TWideStringField;
    cdsArticuloEXISTENCIA2: TIntegerField;
    cdsArticuloEXISTENCIA_MIN2: TIntegerField;
    cdsArticuloIMG_EXT: TWideStringField;
    cdsArticuloIMAGEN: TBlobField;
    cdsArticuloNOM_IMG: TWideStringField;
    cdsArticuloOBSERVACION: TWideStringField;
    cdsArticuloPRECIO_MODIFICABLE: TWideStringField;
    cdsArticuloPRECIOCOMPRA: TLargeintField;
    cdsArticuloPRECIOVTA: TLargeintField;
    shp1: TShape;
    lbl12: TLabel;
    btn1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);

    procedure DBGridEh1DblClick(Sender: TObject);
    procedure btnProveedClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure dsArticuloDataChange(Sender: TObject; Field: TField);
    procedure btn1Click(Sender: TObject);
    {procedure btn2Click(Sender: TObject);}


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmArticulosUt: TfrmArticulosUt;
  CODIGOART: STRING;

implementation
 uses DataModule, Utilidades,frmProveedores;
{$R *.dfm}


procedure TfrmArticulosUt.btn1Click(Sender: TObject);
begin
       cdsArticulo.Close;
       qryArticulo.SQL.Clear;
       qryArticulo.SQL.Add('SELECT * FROM articulo');
       cdsArticulo.Open;
end;

procedure TfrmArticulosUt.btnProveedClick(Sender: TObject);
begin
      frmProveedoresUt:=TfrmProveedoresUt.Create(SELF);
      frmProveedoresUt.Show;
end;


procedure TfrmArticulosUt.DBGridEh1DblClick(Sender: TObject);
begin
       pgcConsulta.ActivePage:= tsDatos;
       cdsArticulo.Close;
       qryArticulo.SQL.Clear;
       qryArticulo.SQL.Add('SELECT * FROM articulo WHERE codarticulo=:COD');
       qryArticulo.ParamByName('COD').AsInteger:= StrToInt(Trim(DBGridEh1.Columns[0].Field.Text));
       cdsArticulo.Open;
       cdsArticulo.First;
end;

procedure TfrmArticulosUt.dbnvgr1Click(Sender: TObject; Button: TNavigateBtn);
begin
 case Button of
    nbEdit:
        begin

        end;
    nbPost:
        BEGIN
          cdsArticulo.ApplyUpdates(0);
        END;
    nbInsert:
        BEGIN
          qryAux.SQL.Clear;
          qryAux.SQL.Add('select MAX(CODARTICULO)+1 FROM ARTICULO');
          qryAux.Open;
          dbedtCodArt.Text:= trim(qryAux.Fields[0].AsString);
          qryAux.Close;
        END;
    nbCancel:
        BEGIN

        END;
    nbDelete:
        BEGIN
           if Utilidades.msSi('Esta Seguro Borrar el Articulo?','Borrar Articulo') = true then
            begin
              cdsArticulo.ApplyUpdates(0);
              cdsArticulo.Close;
               qryArticulo.SQL.Clear;
               qryArticulo.SQL.Add('SELECT * FROM ARTICULO ORDER BY 1');
              cdsArticulo.Open;
              pgcConsulta.ActivePage:= tsCONSULTA;
            end
        END;
   end;
   //eventos de la grilla
   qryGrillaArticulos.Close;
   qryGrillaArticulos.Open;
   DBGridEh1.Refresh;
end;

procedure TfrmArticulosUt.dsArticuloDataChange(Sender: TObject; Field: TField);
var
  m, f: TStream;
begin
  if cdsArticuloIMAGEN.IsNull then
    Image1.Picture:= nil
  else
  begin
    if cdsArticuloIMG_EXT.AsString = 'BMP' then
      Image1.Picture.Graphic:= TBitmap.Create
    else if cdsArticuloIMG_EXT.AsString = 'JPG' then
      Image1.Picture.Graphic:= TJpegImage.Create
    else if cdsArticuloIMG_EXT.AsString='GIF' then
      Image1.Picture.Graphic:= TGIFImage.Create
    else
      Exit;
    m:= cdsArticulo.CreateBlobStream(cdsArticuloIMAGEN, bmRead);
    Image1.Picture.Graphic.LoadFromStream(m);
    m.Free;
  end;
end;

procedure TfrmArticulosUt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cdsArticulo.Close;
  qryUnidadMedida.Active:=false;
  qryTipoIva.Active:=false;
  qryRamo.Active:=false;
  qryProveedor.Active:=false;
  qryGrillaArticulos.Active:=false;

end;

procedure TfrmArticulosUt.FormShow(Sender: TObject);
begin
  cdsArticulo.Open;
  qryUnidadMedida.Active:=true;
  qryTipoIva.Active:=true;
  qryRamo.Active:=true;
  qryProveedor.Active:=true;
  qryGrillaArticulos.Active:=true;
  pgcConsulta.ActivePage:= tsConsulta;


   {with SQLQRY do
   begin
        SQL.Clear;
        SQL.Add('SELECT DIR_IMAGENES FROM PARAMETROS');
        Open;
        try
         image.Picture.LoadFromFile(TRIM(FieldByName('DIR_IMAGENES').AsString)+TRIM(dbedtCodArt.Text)+'.JPG');
        except
         image.Picture.LoadFromFile(TRIM(FieldByName('DIR_IMAGENES').AsString)+TRIM(dbedtCodArt.Text)+'.JPG');
        Close;
        END
    END}

end;

procedure TfrmArticulosUt.Image1Click(Sender: TObject);
var
  m, f: TStream;
  mst: TMemoryStream;
  s: string;
begin
  if OpenPictureDialog.Execute then
  begin
    cdsArticulo.Edit; //tendria que dar error sin esto
    cdsArticuloIMAGEN.LoadFromFile(OpenPictureDialog.filename);
    s:= AnsiUpperCase(ExtractFileExt(OpenPictureDialog.FileName)); //Siempre en mayusculas
    if s='.JPEG' then s:= '.JPG'; //un caso especial
    cdsArticuloIMG_EXT.AsString:= Copy(s,2,3); //elimino el punto
    //cds1.Post;
  end;
 end;

end.

