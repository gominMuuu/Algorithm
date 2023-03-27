package BinarySearch;

import java.io.*;
import java.util.*;

public class bj1789 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // 서로 다른 N개의 자연수의 합이 S
        long s = Long.parseLong(br.readLine());

        long sum = 0, cnt = 0;
        for(int i=1; ; i++) {
            if(sum > s)	break;
            sum += i;
            cnt ++;
        }

        System.out.println(cnt - 1);
    }
}
