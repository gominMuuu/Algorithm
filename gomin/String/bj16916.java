package String;

import java.io.*;
import java.util.*;

public class bj16916 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringBuilder sb = new StringBuilder();

        String S = br.readLine();
        String P = br.readLine();

        // 시간 초과 - 시간 복잡도 O(n)
        if(S.contains(P)) sb.append(1);
        else sb.append(0);

        bw.write(sb.toString());
        bw.flush();
        bw.close();
        br.close();
    }
}
