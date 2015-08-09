// Map TYPE_NAME TO RESULT
%define %pod_typemaps(DATA_TYPE, TYPE_NAME, RESULT)
	%ignore "operator []";
	%ignore TYPE_NAME;

	%typemap(cstype, out="RESULT /* cstype_out */") TYPE_NAME, TYPE_NAME *
		"RESULT /* cstype */"

	%typemap(csout, excode=SWIGEXCODE) TYPE_NAME, TYPE_NAME *
	%{
		{ /* <csout> */
			RESULT ret = $imcall;$excode
			return ret;
		} /* <csout> */
	%}

	%typemap(imtype, out="RESULT /* imtype_out */") TYPE_NAME, TYPE_NAME *
		"RESULT /* imtype */"

	%typemap(ctype, out="TYPE_NAME /* ctype_out */") TYPE_NAME, TYPE_NAME *
		"TYPE_NAME /* ctype */"

	%typemap(directorout) TYPE_NAME, TYPE_NAME *
	%{
		/* <directorout> */
		$result = *((TYPE_NAME *)&($input)); 
		/* </directorout> */
	%}

	%typemap(directorin) TYPE_NAME, TYPE_NAME *
	%{
		/* <directorin> */
		$input = *((TYPE_NAME *)&($1)); 
		/* </directorin> */ 
	%}

	%typemap(out, null="TYPE_NAME() /* out (null) */") TYPE_NAME
	%{ 
		/* <out> */
		$result = $1;
		/* </out> */
	%}

	%typemap(out, null="TYPE_NAME() /* out (null) */") TYPE_NAME *
	%{ 
		/* <out> */
		$result = *$1;
		/* </out> */
	%}

	%typemap(in) TYPE_NAME
	%{
		/* <in> */
		$1 = *((TYPE_NAME *)&($input));
		/* </in> */
	%}

	%typemap(in) TYPE_NAME *
	%{
		/* <in> */
		$1 = ((TYPE_NAME *)&($input));
		/* </in> */
	%}

	%typemap(csin) TYPE_NAME, TYPE_NAME *
		"$csinput /* csin */"

	%typemap(csdirectorin, pre="/* csdirectorin_pre */") TYPE_NAME, TYPE_NAME *
		"$iminput /* csdirectorin */"

	%typemap(csdirectorout) TYPE_NAME, TYPE_NAME *
		"$cscall /* csdirectorout */"

	%typemap(csvarin) TYPE_NAME, TYPE_NAME *
	%{
		/* <csvarin> */
		set 
		{
			$imcall;$excode
		} /* </csvarin> */
	%}

	%typemap(csvarout) TYPE_NAME, TYPE_NAME *
	%{
		/* <csvarout> */
		get
		{ 
			return $imcall;$excode
		} /* </csvarout> */
	%}
%enddef