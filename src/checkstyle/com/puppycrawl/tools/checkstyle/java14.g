////////////////////////////////////////////////////////////////////////////////
// checkstyle: Checks Java source code for adherence to a set of rules.
// Copyright (C) 2001-2002  Oliver Burn
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
////////////////////////////////////////////////////////////////////////////////
header {
package com.puppycrawl.tools.checkstyle;
import com.puppycrawl.tools.checkstyle.api.Scope;
}


/** Java 1.4 Recognizer
 *
 * Based heavily on the Grammer example that comes with ANTLR. See
 * http://www.antlr.org.
 *
 */
class GeneratedJava14Recognizer extends GeneratedJavaRecognizer;

// Options don't get inherited, copy of option block required.
options {
	k = 2;                           // two token lookahead
	exportVocab=GeneratedJava14;     // Call its vocabulary "GeneratedJava14"
	codeGenMakeSwitchThreshold = 2;  // Some optimizations
	codeGenBitsetTestThreshold = 3;
	defaultErrorHandler = false;     // Don't generate parser error handlers
	buildAST = true;
}

// overrides the statement production in java.g, adds assertStatement
statement[int[] aType, MyCommonAST[] aCurlies]
	:	traditionalStatement[aType, aCurlies]
	|	assertStatement[aType, aCurlies]
	;

// assert statement, available since JDK 1.4
assertStatement[int[] aType, MyCommonAST[] aCurlies]
{
    final MyModifierSet modSet = new MyModifierSet();
    final int[] stmtType = new int[1];
    final MyCommonAST[] stmtBraces = new MyCommonAST[2];
    stmtType[0] = STMT_OTHER;
}
	:	asrt:ASSERT^ expression ( c:COLON! expression )? SEMI!
        {
        }
	;

class GeneratedJava14Lexer extends GeneratedJavaLexer;

options {
	exportVocab=GeneratedJava14; // call the vocabulary "GeneratedJava14"
	testLiterals=false;    // don't automatically test for literals
	k=4;                   // four characters of lookahead
	charVocabulary='\u0003'..'\uFFFF';
	codeGenBitsetTestThreshold=20;
}

tokens {
        ASSERT="assert";
}

// antlr expects a definition here: 'unexpected token: null'
// To avoid that message, one definition from GeneratedJavaLexer
// is repeated. Rather inelegant but I didn't find a better solution :-(
// Feel free to improve this...
protected
FLOAT_SUFFIX
	:	'f'|'F'|'d'|'D'
	;
