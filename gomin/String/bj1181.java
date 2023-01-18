package String;

import java.io.*;
import java.util.*;

public class bj1181 {
    public void solution(String[] sA) {
        // 중복 제거
        String[] nA = Arrays.stream(sA).distinct().toArray(String[] :: new);
        // 길이 짧은 순 정렬
        for(int i=0; i<nA.length; i++) {
            for(int j=i+1; j<nA.length; j++) {
                if(nA[i].length() > nA[j].length()) {
                    // swap
                    String tmp = nA[i];
                    nA[i] = nA[j];
                    nA[j] = tmp;
                }
            }
        }
        // 사전 순 정렬
        for(int i=0; i<nA.length; i++) {
            for (int j = i + 1; j < nA.length; j++) {
                if(nA[i].length() == nA[j].length()) {
                    // 알파벳 비교 후 swap
                    if(nA[i].compareTo(nA[j]) > 0) {
                        String tmp = nA[i];
                        nA[i] = nA[j];
                        nA[j] = tmp;
                    }
                }
            }
        }

        for(String x : nA) {
            System.out.println(x);
        }
    }

    public static void main(String[] args) throws NumberFormatException, IOException {
        bj1181 T = new bj1181();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(br.readLine());
        String[] sA = new String[N];

        for(int i=0; i<N; i++) {
            sA[i] = br.readLine();
        }
        T.solution(sA);
    }
}
