package TwoPointer;

import java.io.*;
import java.util.*;

public class bj11728 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int[] answer = new int[n+m];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<n; i++) {
            answer[i] = Integer.parseInt(st.nextToken());
        }

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<m; i++) {
            answer[i + n] = Integer.parseInt(st.nextToken());
        }

        Arrays.sort(answer);

        for(int x : answer) {
            bw.write(String.valueOf(x)+" ");
        }

        bw.flush();
        bw.close();
    }
}
