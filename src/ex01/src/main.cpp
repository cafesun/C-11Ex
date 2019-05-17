#include <iostream>
#include "gtest/gtest.h"

using std::cerr;
using std::cout;
using std::endl;

int main(int argc, char* argv[])
{
	int iRet = 0;
	try
	{

		::testing::InitGoogleTest(&argc, argv);

		iRet = RUN_ALL_TESTS();
	}
	catch (...)
	{
		cerr << "UnKnown Exception" << endl;
	}
	return iRet;
}