#include "LoopParallelPass.h"

#include <fstream>
#include <iostream>
#include <regex>
#include <set>
#include <string>

using namespace std;

void analyzeLoop(const string &loopText, int loopNumber) {

    bool unsafe = false;
    string reason = "Independent memory accesses";

    // ---------------------------------
    // 1. Array dependency
    // a(i) = a(i-1) + 1
    // ---------------------------------

    if (loopText.find("arith.subi") != string::npos) {

        unsafe = true;
        reason = "Array Dependency";
    }

    // ---------------------------------
    // 2. I/O dependency
    // print / write
    // ---------------------------------

    else if (loopText.find("_FortranAio") != string::npos) {

        unsafe = true;
        reason = "I/O Dependency";
    }

    // ---------------------------------
    // 3. Function side effect
    // ---------------------------------

    else if (loopText.find("fir.call") != string::npos) {

        unsafe = true;
        reason = "Function Side Effect";
    }

    // ---------------------------------
    // 4. Loop carried dependency
    // load %X
    // store ... to %X
    // ---------------------------------

    else {

        regex loadRegex(R"(fir\.load (%[0-9]+))");
        regex storeRegex(R"(fir\.store .* to (%[0-9]+))");

        smatch match;

        set<string> loads;
        set<string> stores;

        string::const_iterator searchStart(loopText.cbegin());

        while (regex_search(searchStart,
                            loopText.cend(),
                            match,
                            loadRegex)) {

            loads.insert(match[1]);

            searchStart = match.suffix().first;
        }

        searchStart = loopText.cbegin();

        while (regex_search(searchStart,
                            loopText.cend(),
                            match,
                            storeRegex)) {

            stores.insert(match[1]);

            searchStart = match.suffix().first;
        }

        bool dependencyFound = false;

        for (auto &x : loads) {

            if (stores.count(x)) {

                dependencyFound = true;
                break;
            }
        }

        if (dependencyFound) {

            unsafe = true;
            reason = "Loop-Carried Dependency";
        }
    }

    cout << "\n---------------------------------\n";
    cout << "Loop #" << loopNumber << "\n";

    if (unsafe) {

        cout << "Classification : Not Safe\n";
        cout << "Reason : " << reason << "\n";
    }
    else {

        cout << "Classification : Likely Parallelizable\n";
        cout << "Reason : " << reason << "\n";
    }
}

void analyzeMLIR(const string &filename) {

    ifstream file(filename);

    if (!file.is_open()) {

        cout << "Cannot open file\n";
        return;
    }

    string line;

    bool insideLoop = false;

    int loopNumber = 0;

    int braceDepth = 0;

    string loopText;

    while (getline(file, line)) {

        if (!insideLoop &&
            line.find("fir.do_loop") != string::npos) {

            insideLoop = true;

            braceDepth = 0;

            loopText.clear();

            loopNumber++;
        }

        if (insideLoop) {

            loopText += line;
            loopText += "\n";

            for (char c : line) {

                if (c == '{')
                    braceDepth++;

                if (c == '}')
                    braceDepth--;
            }

            if (braceDepth == 0 &&
                line.find("}") != string::npos) {

                analyzeLoop(loopText,
                            loopNumber);

                insideLoop = false;
            }
        }
    }

    if (loopNumber == 0) {

        cout << "No fir.do_loop found\n";
    }
}