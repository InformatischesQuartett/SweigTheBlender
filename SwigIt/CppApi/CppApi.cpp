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
	Vector_POD retval = Vector_POD( myArray.x, myArray.y, myArray.z );
	return retval;
}

//Hier geht's schief ! 
Vector_POD CppApiXX::FooInArrayOut(Foo f)
{
	std::cout << "Vector FooInArrayOut(Foo f)" << std::endl;
	Vector_POD retval = Vector_POD(1.0f, 2.0f, 3.0f);
	return retval;
}

std::string CppApiXX::default_value()
{
	std::cout << "default_value()" << std::endl;
	std::string retval = "defalut_Value";
	return retval;
}

void CppApiXX::default_value(const std::string& value)
{
	std::cout << "default_value(const std::string& value)" << std::endl;
}

std::vector<int> CppApiXX::createV3(int vx, int vy, int vz)
{
	std::vector<int> ret;
	ret.push_back(vx);
	ret.push_back(vy);
	ret.push_back(vz);
	std::cout << "Created: " << ret.at(0) << " , "<<ret.at(1)<<" , "<<ret.at(2) << std::endl;
	return ret;
}

std::map<std::string, int> CppApiXX::properties()
{
	std::cout << "std::map<std::string, int>" << std::endl;
	std::map<std::string, int> ret;
	ret["first"] = 1;
	ret["second"] = 2;
	ret["third"] = 3;
	return ret;
}

void CppApiXX::TestArrayInObsolete(std::array<float, 3> a)
{
	std::cout << "void TestArrayInObsolete(std::array<float, 3>)" << std::endl;
}

std::array<float, 3> CppApiXX::TestArrayOutObsolete()
{
	std::cout << "std::array<float, 3> TestArrayOutObsolete" << std::endl;
	std::array<float, 3> retval = { 1.1f, 2.2f, 3.3f };
	return retval;
}

std::array<float, 3> CppApiXX::FooInArrayOutObsolete(Foo f)
{
	std::cout << "std::array<float, 3> FooInArrayOutObsolete(Foo f)" << std::endl;
	std::array<float, 3> retval = { 1.1f, 2.2f, 3.3f };
	return retval;
}