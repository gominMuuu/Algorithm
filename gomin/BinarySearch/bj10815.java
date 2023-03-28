package BinarySearch;

import java.io.*;
import java.util.*;

public class bj10815 {
    static int n;
    static int[] cardArr;

    public static boolean solve(int num) {
        int lt = 0, rt = n - 1;

        while(lt <= rt) {
            int mid = (lt + rt) / 2;
            int midNum = cardArr[mid];

            if(num < midNum) rt = mid - 1;
            else if(num > midNum) lt = mid + 1;
            else return true;
        }
        return false;
    }
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        n = Integer.parseInt(br.readLine());
        cardArr = new int[n];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<n; i++) {
            cardArr[i] = Integer.parseInt(st.nextToken());
        }

        // 이분 탐색을 위해 배열 정렬
        Arrays.sort(cardArr);

        int m = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine(), " ");

        for(int i=0; i<m; i++) {
            int num = Integer.parseInt(st.nextToken());

            if(solve(num)) sb.append("1 ");
            else sb.append("0 ");
        }

        System.out.println(sb);

    }
}
