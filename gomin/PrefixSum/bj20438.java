package PrefixSum;

import java.io.*;
import java.util.*;

public class bj20438 {
    static int[] arr;
    static int[] sleeping;
    static int[] prefixSum;

    // 졸고 있는 학생 셋팅
    public static void setSleepingStudent() {
        for(int i=0; i<sleeping.length; i++) {
            arr[sleeping[i]] = 1;
        }
    }
    // 자신의 입장 번호의 배수의 학생에게 출석코드 전송
    public static void setCodeToStudent(int x) {
        for(int i=3; i<arr.length; i++) {
            if(i % x == 0) {
                arr[i] = 0;
            }
        }
    }
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());   // 학생의 수 n
        int k = Integer.parseInt(st.nextToken());   // 졸고 있는 학생의 수 k
        int q = Integer.parseInt(st.nextToken());   // 출석 코드를 보낼 학생의 수 q
        int m = Integer.parseInt(st.nextToken());   // 주어질 구간의 수 m

        arr = new int[n+3];
        prefixSum = new int[n+3];
        Arrays.fill(arr, 1);

        arr[0] = 0;
        arr[1] = 0;
        arr[2] = 0;

        // 2번째 줄: 졸고 있는 학생의 번호
        sleeping = new int[k];
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<k; i++) {
            int num = Integer.parseInt(st.nextToken());
            sleeping[i] = num;
        }

        // 3번째 줄: 출석 코드를 받을 학생의 번호
        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<q; i++) {
            int num = Integer.parseInt(st.nextToken());
            setCodeToStudent(num);
        }

        setSleepingStudent();

        for(int i=3; i<prefixSum.length; i++) {
            prefixSum[i] = arr[i] + prefixSum[i-1];
        }

        // 4번째부터 m개의 줄: 구간의 범위
        for(int i=0; i<m; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int x1 = Integer.parseInt(st.nextToken());
            int x2 = Integer.parseInt(st.nextToken());
            sb.append(prefixSum[x2] - prefixSum[x1 - 1]).append('\n');
        }

        System.out.println(sb);
    }
}
