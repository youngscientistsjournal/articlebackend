package com.neon;

import com.neon.lexing.NeonLexer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        String s = "a=b+3";

        BufferedReader b = new BufferedReader(new StringReader(s));

        NeonLexer l = new NeonLexer(b);
        try {

            ArrayList<NeonLexer.Token<String>> a = new ArrayList<>();


            NeonLexer.Token<String> t;
            while ((t = l.yylex()) != null) {
                a.add(t);
            }


            for (NeonLexer.Token<String> x : a) {
                System.out.println(x);
            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}