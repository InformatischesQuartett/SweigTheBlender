// Cpp.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include <iostream>
#include "CppApi.h"


void CppApiXX::TestArrayIn(Vector_POD)
{
	std::cout << "void testArrayIn(Vector)" << std::endl;
}
//klappt
Vector_POD CppApiXX::TestArrayOut()
{
	std::cout << "Vector testArrayOut()" << std::endl;
	Vector_POD retval = Vector_POD(1.1f, 2.2f, 3.3f);
	return retval;
}
//klappt
Vector_POD CppApiXX::TestArrayInOut(Vector_POD myArray)
{
	std::cout << "Vector testArrayInOut(Vector myArray)" << std::endl;
	Vector_POD retval = Vector_POD( 1.1f, 2.2f, 3.3f );
	return retval;
}

//Hier geht's schief ! 
Vector_POD CppApiXX::FooInArrayOut(Foo f)
{
	std::cout << "Vector FooInArrayOut(Foo f)" << std::endl;
	Vector_POD retval = Vector_POD(1.0f, 2.0f, 3.0f);
	return retval;
}
