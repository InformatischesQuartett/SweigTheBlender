#include <Python.h>
#include <string>
#include <iostream>
#include <map>
#include <stdlib.h>     

_declspec(dllexport) void InitUniplug();

static PyObject *
uniplug_init(PyObject *self, PyObject *args)
{	
	InitUniplug();

	Py_INCREF(Py_None);
	return Py_None;
}

// INITIALIZATION

static PyMethodDef UniplugMethods[] = {
		{ "init", uniplug_init, METH_VARARGS, "---" },
		{ NULL, NULL, 0, NULL }
};

static struct PyModuleDef uniplugmodule = {
	PyModuleDef_HEAD_INIT,
	"uniplug",  /* name of module */
	NULL,	    /* module documentation, may be NULL */
	-1,         /* module keeps state in global variables. */
	UniplugMethods		/* method definition table, may be NULL */
};

PyMODINIT_FUNC
PyInit_uniplug(void)
{
	return PyModule_Create(&uniplugmodule);
}