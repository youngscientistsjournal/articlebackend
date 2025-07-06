package com.neon.lexing;




%%

%public
%class NeonLexer
%unicode
%line
%column

%{
public enum TokenType {
      IDENTIFIER, INTEGER, EQ, PLUS, MINUS, TIMES, DIV, UNKNOWN
}
%}

%{
public class Token<K> {
      public TokenType tokenType;
      private K value;

      public Token(TokenType tokenType) {
          this.tokenType = tokenType;
      }

      public Token(TokenType tokenType, K value) {
          this(tokenType);
          this.value = value;
      }

      @Override
      public String toString() {

          if (this.value == null) {
              return tokenType;
          }

          return tokenType.toString() + " : " + value.toString();
      }
}
%}


%%

\s+                         { /* skip whitespace */ }
[a-zA-Z_][a-zA-Z0-9_]*      { return new Token<String>(TokenType.IDENTIFIER, yytext()); }
[0-9]+                      { return new Token<String>(TokenType.INTEGER, yytext()); }
"="                         { return new Token<String>(TokenType.EQ); }
"+"                         { return new Token<String>(TokenType.PLUS); }
"-"                         { return new Token<String>(TokenType.MINUS); }
"*"                         { return new Token<String>(TokenType.TIMES); }
"/"                         { return new Token<String>(TokenType.DIV); }

.                           { return new Token<String>(TokenType.UNKNOWN); }