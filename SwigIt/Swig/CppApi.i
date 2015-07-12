////////////////////////////////////////////////////////////////////////////////////
// The module definition. "directors" (= two-way wrapper classes) are allowed and the overall module name is CppApi
%module (directors="1") CppApi


////////////////////////////////////////////////////////////////////////////////////
// This code gets verbatim copied into the generated C++ bridge file (CppApiWrapper.cpp). Header files included here
// with the "normal" #include are not wrapped (yet), although most of them will appear in some later %include; section.
%{
/* Includes the header in the wrapper code */
#include "CppApi.h"

%}

%include <windows.i>


// Map Vector_POD   TO   Fusee.Math.float3
%typemap(cstype, out="Fusee.Math.float3 /* Vector_POD_cstype_out */") Vector_POD "Fusee.Math.float3 /* Vector_POD_cstype */"
%typemap(csout, excode=SWIGEXCODE) Vector_POD 
%{ {  /* <Vector_POD_csout> */
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <Vector_POD_csout> */ %}
%typemap(imtype, out="Fusee.Math.float3 /* Vector_POD_imtype_out */") Vector_POD "Fusee.Math.float3 /* Vector_POD_imtype */"
%typemap(ctype, out="Vector_POD /* Vector_POD_ctype_out */") Vector_POD "Vector_POD /* Vector_POD_ctype */"
%typemap(directorout) Vector_POD
%{ /* <Vector_POD_directorout> */
   $result = *((Vector_POD *)&($input)); 
   /* </Vector_POD_directorout> */
 %}
%typemap(directorin) Vector_POD 
%{ /* <Vector_POD_directorin> */
   $input = *((Vector_POD *)&($1)); 
   /* </Vector_POD_directorin> */ 
%}
%typemap(out) Vector_POD 
%{
	/* <Vector_POD_out> */
	$result = *((Vector_POD *)&($1));
	/* </Vector_POD_out> */
%}
%typemap(in) Vector_POD 
%{
	/* <Vector_POD_in> */
	$1 = *((Vector_POD *)&($input));
	/* </Vector_POD_in> */
%}
%typemap(csin) Vector_POD "$csinput /* Vector_POD_csin */"
%typemap(csdirectorin, 
   pre="/* NOP Vector_POD_csdirectorin_pre */"
  ) Vector_POD
  "$iminput /* Vector_POD_csdirectorin */"
%typemap(csdirectorout) Vector_POD "$cscall /* Vector_POD_csdirectorout */"
%typemap(csvarin) Vector_POD %{
    /* <Vector_POD_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </Vector_POD_csvarin> */  %}
%typemap(csvarout) Vector_POD %{ 
   /* <Vector_POD_csvarout> */
   get
   {  
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <Vector_POD_csvarout> */ %}



%include "CppApi.h";


