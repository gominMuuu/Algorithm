package TwoPointer;

import java.io.*;
import java.util.*;

public class bj20442 {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String zzfnzz = 'K' + br.readLine() + 'K';
        int lk = -1;
        int rk = -1;
        int rsum = 0;
        char target = 'K';
        int cnt = 0;
        ArrayList<Integer> arr = new ArrayList<Integer>();
        for (int i = 0; i < zzfnzz.length(); i++) {
            if (zzfnzz.charAt(i) == target)
                cnt++;
            if (zzfnzz.charAt(i) != target) {
                arr.add(cnt);
                if (target == 'R')rsum += cnt;
                target = target == 'K' ? 'R' : 'K';
                cnt = 1;
            }
        }
        arr.add(cnt);
        int left = 0;
        int right = arr.size() - 1;
        lk += arr.get(left);
        rk += arr.get(right);
        int max = 0;
        while (rsum > 0) {
            int sum = Math.min(lk, rk)*2+rsum;
            max = Math.max(sum, max);
            int olk = lk;
            if(olk<=rk) {
                rsum -= arr.get(++left);
                lk += arr.get(++left);
            }
            if(olk>=rk) {
                rsum -= arr.get(--right);
                rk += arr.get(--right);
            }
        }
        System.out.println(max);
    }
}
