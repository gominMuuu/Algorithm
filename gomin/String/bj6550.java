package String;

import java.io.*;
import java.util.*;

public class bj6550 {
    public static boolean isSubstring(String s, String t) {
        if(t.contains(s)) return true;

        int idx = 0;
        char[] sA = s.toCharArray();
        char[] tA = t.toCharArray();

        for(int i=0; i<tA.length; i++) {
            if(sA[idx] == tA[i]) {
                idx++;
            }
            if(idx == sA.length) break;
        }
        if(idx == s.length()) return true;
        else return  false;
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        String str;
        while((str = br.readLine()) != null) {
            st = new StringTokenizer(str);

            if(!st.hasMoreTokens()) break;
            String s = st.nextToken();
            String t = st.nextToken();

            if(isSubstring(s, t)) sb.append("YES\n");
            else sb.append("NO\n");
        }
        System.out.println(sb);
    }
}
