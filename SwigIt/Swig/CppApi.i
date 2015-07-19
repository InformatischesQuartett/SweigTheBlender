////////////////////////////////////////////////////////////////////////////////////
// The module definition. "directors" (= two-way wrapper classes) are allowed and the overall module name is CppApi
%module (directors="1") CppApi


////////////////////////////////////////////////////////////////////////////////////
// This code gets verbatim copied into the generated C++ bridge file (CppApiWrapper.cpp). Header files included here
// with the "normal" #include are not wrapped (yet), although most of them will appear in some later %include; section.
%{
/* Includes the header in the wrapper code */
#include "CppApi.h"
//#include "uniplug_blender_api.h"

%}
%include <windows.i>
/* converting std::string */
%include "std_string.i"


//Ignore
// string_to_* or *_to_string 

//%rename("%(regex:/(\\w+)_(.*)/\\u\\3/)")"";

%rename("%(regex:/^(.*)((to_test()))/\\2/)s") $ignore;
//%ignore to_test;



/*renaming everthing that ends with to_string*/
//%rename("%(regex:/^(.*)((to_string()))/\3/)s") "";

/*ignoring everthing that starts with string_to*/
//%rename("%(regex:/^((string_to)(.*))/\/)s") "";

/*ignoring everthing that starts with string_to*/
//%rename("%(regex:/^((.*)(string_to)(.*))/\/)s")"";

//%rename("%(regex:/^(.*)((string_to).*)/\\2/)s\S\*") "";
//%rename("%(regex:/^(.*)((string_to).*)/\\2/)s") "";

//%rename("%(regex:/^.(string_to).*)/\\3/)s") "";
//%rename("%(regex:/(\\w+)_(.*)/\\u\\2/)") "bla";
//%rename("%(regex:/pre(?!EVT)(.*)/\\1/)s") "";

//%ignore  wegdamit:




//This converts std::Vector<int> in to a class called IntVector
// IntVector implemnts IEnumerable<> and IList<>#
// It would be nice if it was possible to use directly List<int> on the C# side instead of IntVector 
%include "std_vector.i"
%template(IntVector) std::vector<int>;
%template(FloatVector) std::vector<float>;
%template(DoubleVector) std::vector<double>;




//This converts std::map<string, int> in to a class called String_Int_Map
// "The C# wrapper is made to look and feel like a C# System.Collections.Generic.IDictionary<>." [ref: std_map.i]
// TODO: std::map<std::string, Foo> / TODO: std::map<std::string, T> | T can be any self defined class i.e. Foo
%include "std_map.i"
%template(String_Int_Map) std::map<std::string, int>;
%template(Int_String_Map) std::map<int, std::string>;


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



   // Map VFloat3   TO   Fusee.Math.float3
%typemap(cstype, out="Fusee.Math.float3 /* VFloat3_cstype_out */") VFloat3 "Fusee.Math.float3 /* VFloat3_cstype */"
%typemap(csout, excode=SWIGEXCODE) VFloat3 
%{ {  /* <VFloat3_csout> */
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <VFloat3_csout> */ %}
%typemap(imtype, out="Fusee.Math.float3 /* VFloat3_imtype_out */") VFloat3 "Fusee.Math.float3 /* VFloat3_imtype */"
%typemap(ctype, out="VFloat3 /* VFloat3_ctype_out */") VFloat3 "VFloat3 /* VFloat3_ctype */"
%typemap(directorout) VFloat3
%{ /* <VFloat3_directorout> */
   $result = *((VFloat3 *)&($input)); 
   /* </VFloat3_directorout> */
 %}
%typemap(directorin) VFloat3 
%{ /* <VFloat3_directorin> */
   $input = *((VFloat3 *)&($1)); 
   /* </VFloat3_directorin> */ 
%}
%typemap(out, null="VFloat3()")    VFloat3
%{ 
	/* VFloat3 out*/
	$result = $1;
	/* VFloat3 out*/
%}
%typemap(in) VFloat3 
%{
	/* <VFloat3_in> */
	$1 = *((VFloat3 *)&($input));
	/* </VFloat3_in> */
%}
%typemap(csin) VFloat3 "$csinput /* VFloat3_csin */"
%typemap(csdirectorin, 
   pre="/* NOP VFloat3_csdirectorin_pre */"
  ) VFloat3
  "$iminput /* VFloat3_csdirectorin */"
%typemap(csdirectorout) VFloat3 "$cscall /* VFloat3_csdirectorout */"
%typemap(csvarin) VFloat3 %{
    /* <VFloat3_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </VFloat3_csvarin> */  %}
%typemap(csvarout) VFloat3 %{ 
   /* <VFloat3_csvarout> */
   get
   {  
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <VFloat3_csvarout> */ %}



// Map std::array<float, 3>   TO   Fusee.Math.float3
%typemap(cstype, out="Fusee.Math.float3 /* std::array<float, 3>_cstype_out */") std::array<float, 3> "Fusee.Math.float3 /* std::array<float, 3>_cstype */"
%typemap(csout, excode=SWIGEXCODE) std::array<float, 3> 
%{ {  /* <std::array<float, 3>_csout> */
      Fusee.Math.float3 ret = $imcall;$excode
      return ret;
   } /* <std::array<float, 3>_csout> */ %}
%typemap(imtype, out="Fusee.Math.float3 /* std::array<float, 3>_imtype_out */") std::array<float, 3> "Fusee.Math.float3 /* std::array<float, 3>_imtype */"
%typemap(ctype, out="std::array<float, 3> /* std::array<float, 3>_ctype_out */") std::array<float, 3> "std::array<float, 3> /* std::array<float, 3>_ctype */"
%typemap(directorout) std::array<float, 3>
%{ /* <std::array<float, 3>_directorout> */
   $result = *((std::array<float, 3> *)&($input)); 
   /* </std::array<float, 3>_directorout> */
 %}
%typemap(directorin) std::array<float, 3> 
%{ /* <std::array<float, 3>_directorin> */
   $input = *((std::array<float, 3> *)&($1)); 
   /* </std::array<float, 3>_directorin> */ 
%}
%typemap(out, null="std::array<float, 3>()")    std::array<float, 3>
%{ 
	/* Fusee.Math.float3 out*/
	$result = $1;
	/* Fusee.Math.float3 out*/
%}
%typemap(in) std::array<float, 3> 
%{
	/* <std::array<float, 3>_in> */
	$1 = *((std::array<float, 3> *)&($input));
	/* </std::array<float, 3>_in> */
%}
%typemap(csin) std::array<float, 3> "$csinput /* std::array<float, 3>_csin */"
%typemap(csdirectorin, 
   pre="/* NOP std::array<float, 3>_csdirectorin_pre */"
  ) std::array<float, 3>
  "$iminput /* std::array<float, 3>_csdirectorin */"
%typemap(csdirectorout) std::array<float, 3> "$cscall /* std::array<float, 3>_csdirectorout */"
%typemap(csvarin) std::array<float, 3> %{
    /* <std::array<float, 3>_csvarin> */
    set 
	{
      $imcall;$excode
    }  /* </std::array<float, 3>_csvarin> */  %}
%typemap(csvarout) std::array<float, 3> %{ 
   /* <std::array<float, 3>_csvarout> */
   get
   {  
      Fusee.Math.float3 ret = $imcall;$excode /*Fusee.Math.float3 ret = $imcall*/
      return ret;
   } /* <std::array<float, 3>_csvarout> */ %}



%include "CppApi.h";
//%include "uniplug_blender_api.h";

