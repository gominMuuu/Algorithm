package ExhaustiveSearch;

import java.io.*;
import java.util.*;

/* T -> S가 될 수 있는 지 확인, 재귀 사용
    1. 만약 맨 뒤가 A라면, A를 뺀 후 S와 비교
    2. 만약 맨 앞이 B라면, B를 제외한 나머지 문자열을 뒤집어본 후 S와 비교
 */

public class bj12919 {
    static String S, T;
    static int sLen;

    public static boolean solve(String str) {
        if(str.length() == sLen) {
            if(str.equals(S))
                return true;
            else
                return false;
        }

        if(str.charAt(str.length()-1) == 'A') {
            if(solve(str.substring(0, str.length() - 1)))
                return true;
        }
        if(str.charAt(0) == 'B') {
            StringBuilder reverse = new StringBuilder();
            reverse.append(str.substring(1, str.length()));
            reverse.reverse();
            if(solve(reverse.toString()))
                return true;
        }

        return false;
    }

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        S = br.readLine();
        T = br.readLine();
        sLen = S.length();

        if(solve(T))
            System.out.println(1);
        else
            System.out.println(0);
    }
}
