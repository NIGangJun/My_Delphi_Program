unit BARCODELib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2012-9-26 15:29:22 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files\Microsoft Office\Office12\2052\MSBCODE9.OCX (1)
// LIBID: {D9347025-9612-11D1-9D75-00C04FCC8CDC}
// LCID: 0
// Helpfile: 
// HelpString: Microsoft Access BarCode Control 9.0
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, DBOleCtl, Graphics, OleCtrls, OleServer, StdVCL, 
Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  BARCODELibMajorVersion = 1;
  BARCODELibMinorVersion = 0;

  LIBID_BARCODELib: TGUID = '{D9347025-9612-11D1-9D75-00C04FCC8CDC}';

  DIID__BarCodeEvents: TGUID = '{9E07D2A0-D504-11D1-9DA3-00C04FCC8CDC}';
  IID_IBarCodeCtrl: TGUID = '{D9347032-9612-11D1-9D75-00C04FCC8CDC}';
  CLASS_BarCodeCtrl: TGUID = '{D9347033-9612-11D1-9D75-00C04FCC8CDC}';
  CLASS_BarCodePropPage: TGUID = '{D9347034-9612-11D1-9D75-00C04FCC8CDC}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _BarCodeEvents = dispinterface;
  IBarCodeCtrl = interface;
  IBarCodeCtrlDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  BarCodeCtrl = IBarCodeCtrl;
  BarCodePropPage = IUnknown;


// *********************************************************************//
// DispIntf:  _BarCodeEvents
// Flags:     (4096) Dispatchable
// GUID:      {9E07D2A0-D504-11D1-9DA3-00C04FCC8CDC}
// *********************************************************************//
  _BarCodeEvents = dispinterface
    ['{9E07D2A0-D504-11D1-9DA3-00C04FCC8CDC}']
  end;

// *********************************************************************//
// Interface: IBarCodeCtrl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D9347032-9612-11D1-9D75-00C04FCC8CDC}
// *********************************************************************//
  IBarCodeCtrl = interface(IDispatch)
    ['{D9347032-9612-11D1-9D75-00C04FCC8CDC}']
    procedure Set_BackColor(pclr: OLE_COLOR); safecall;
    function Get_BackColor: OLE_COLOR; safecall;
    procedure Set_ForeColor(pclr: OLE_COLOR); safecall;
    function Get_ForeColor: OLE_COLOR; safecall;
    function Get_Style: Smallint; safecall;
    procedure Set_Style(pVal: Smallint); safecall;
    function Get_SubStyle: Smallint; safecall;
    procedure Set_SubStyle(pVal: Smallint); safecall;
    function Get_Validation: Smallint; safecall;
    procedure Set_Validation(pVal: Smallint); safecall;
    function Get_LineWeight: Smallint; safecall;
    procedure Set_LineWeight(pVal: Smallint); safecall;
    function Get_Direction: Smallint; safecall;
    procedure Set_Direction(pVal: Smallint); safecall;
    function Get_ShowData: Integer; safecall;
    procedure Set_ShowData(pVal: Integer); safecall;
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(pVal: OleVariant); safecall;
    procedure AboutBox; safecall;
    procedure Refresh; safecall;
    property BackColor: OLE_COLOR read Get_BackColor write Set_BackColor;
    property ForeColor: OLE_COLOR read Get_ForeColor write Set_ForeColor;
    property Style: Smallint read Get_Style write Set_Style;
    property SubStyle: Smallint read Get_SubStyle write Set_SubStyle;
    property Validation: Smallint read Get_Validation write Set_Validation;
    property LineWeight: Smallint read Get_LineWeight write Set_LineWeight;
    property Direction: Smallint read Get_Direction write Set_Direction;
    property ShowData: Integer read Get_ShowData write Set_ShowData;
    property Value: OleVariant read Get_Value write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  IBarCodeCtrlDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D9347032-9612-11D1-9D75-00C04FCC8CDC}
// *********************************************************************//
  IBarCodeCtrlDisp = dispinterface
    ['{D9347032-9612-11D1-9D75-00C04FCC8CDC}']
    property BackColor: OLE_COLOR dispid -501;
    property ForeColor: OLE_COLOR dispid -513;
    property Style: Smallint dispid 1;
    property SubStyle: Smallint dispid 2;
    property Validation: Smallint dispid 3;
    property LineWeight: Smallint dispid 4;
    property Direction: Smallint dispid 5;
    property ShowData: Integer dispid 6;
    property Value: OleVariant dispid 7;
    procedure AboutBox; dispid -552;
    procedure Refresh; dispid -550;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TBarCodeCtrl
// Help String      : BarCodeCtrl Class
// Default Interface: IBarCodeCtrl
// Def. Intf. DISP? : No
// Event   Interface: _BarCodeEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
  TBarCodeCtrl = class(TDBOleControl)
  private
    FIntf: IBarCodeCtrl;
    function  GetControlInterface: IBarCodeCtrl;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
    function Get_Value: OleVariant;
    procedure Set_Value(pVal: OleVariant);
  public
    procedure AboutBox;
    procedure Refresh;
    property  ControlInterface: IBarCodeCtrl read GetControlInterface;
    property  DefaultInterface: IBarCodeCtrl read GetControlInterface;
    property Value: OleVariant index 7 read GetOleVariantProp write SetOleVariantProp;
  published
    property Anchors;
    property  ParentColor;
    property  ParentFont;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property BackColor: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property ForeColor: TColor index -513 read GetTColorProp write SetTColorProp stored False;
    property Style: Smallint index 1 read GetSmallintProp write SetSmallintProp stored False;
    property SubStyle: Smallint index 2 read GetSmallintProp write SetSmallintProp stored False;
    property Validation: Smallint index 3 read GetSmallintProp write SetSmallintProp stored False;
    property LineWeight: Smallint index 4 read GetSmallintProp write SetSmallintProp stored False;
    property Direction: Smallint index 5 read GetSmallintProp write SetSmallintProp stored False;
    property ShowData: Integer index 6 read GetIntegerProp write SetIntegerProp stored False;
  end;

// *********************************************************************//
// The Class CoBarCodePropPage provides a Create and CreateRemote method to          
// create instances of the default interface IUnknown exposed by              
// the CoClass BarCodePropPage. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBarCodePropPage = class
    class function Create: IUnknown;
    class function CreateRemote(const MachineName: string): IUnknown;
  end;

procedure Register;

resourcestring
  dtlServerPage = '(none)';

  dtlOcxPage = '(none)';

implementation

uses ComObj;

procedure TBarCodeCtrl.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{D9347033-9612-11D1-9D75-00C04FCC8CDC}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000003;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TBarCodeCtrl.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IBarCodeCtrl;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TBarCodeCtrl.GetControlInterface: IBarCodeCtrl;
begin
  CreateControl;
  Result := FIntf;
end;

function TBarCodeCtrl.Get_Value: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Value;
end;

procedure TBarCodeCtrl.Set_Value(pVal: OleVariant);
begin
  DefaultInterface.Set_Value(pVal);
end;

procedure TBarCodeCtrl.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

procedure TBarCodeCtrl.Refresh;
begin
  DefaultInterface.Refresh;
end;

class function CoBarCodePropPage.Create: IUnknown;
begin
  Result := CreateComObject(CLASS_BarCodePropPage) as IUnknown;
end;

class function CoBarCodePropPage.CreateRemote(const MachineName: string): IUnknown;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BarCodePropPage) as IUnknown;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TBarCodeCtrl]);
end;

end.
