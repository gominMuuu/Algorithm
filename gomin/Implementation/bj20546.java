package Implementation;

import java.io.*;
import java.util.*;

public class bj20546 {
    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int money = Integer.parseInt(br.readLine());
        int BNPMoney = money, TIMINGMoney = money;
        int[] stockArr = new int[14];

        st = new StringTokenizer(br.readLine(), " ");
        for(int i=0; i<14; i++) {
            stockArr[i] = Integer.parseInt(st.nextToken());
        }

        // 준현 BNP
        int BNPStockCnt = 0;
        for(int i=0; i<14; i++) {
            int cnt = BNPMoney / stockArr[i];
            if(cnt == 0) continue;

            BNPStockCnt += cnt;
            BNPMoney = BNPMoney - (stockArr[i] * cnt);
        }
        // 준현의 자산
        int BNPSum = BNPMoney + (stockArr[13] * BNPStockCnt);
//        System.out.println("준현의 현금: " + BNPMoney + ", 준현의 주식수: " + BNPStockCnt);
//        System.out.println("준현의 자산: " + BNPSum);

        // 성민 TIMING
        int TIMINGCnt = 0;
        for(int i=3; i<14; i++) {
            // 3일치 동향 파악
            // 만약 3일동안 상승했다면, 다음날 전량 매도
            if(stockArr[i-1] > stockArr[i-2] && stockArr[i-2] > stockArr[i-3]) {
                TIMINGMoney += stockArr[i] * TIMINGCnt;
                TIMINGCnt = 0;
            }
            // 만약 3일동안 하락했다면, 다음날 전량 매수
            else if (stockArr[i-1] < stockArr[i-2] && stockArr[i-2] < stockArr[i-3]) {
                int cnt = TIMINGMoney / stockArr[i];
                if(cnt == 0) continue;

                TIMINGCnt += cnt;
                TIMINGMoney = TIMINGMoney - (stockArr[i] * cnt);
            }
        }
        // 성민의 자산
        int TIMINGSum = TIMINGMoney + (stockArr[13] * TIMINGCnt);
//        System.out.println("성민의 현금: " + TIMINGMoney + ", 성민의 주식수: " + TIMINGCnt);
//        System.out.println("성민의 자산: " + TIMINGSum);

        if(BNPSum > TIMINGSum)
            System.out.println("BNP");
        else if(BNPSum == TIMINGSum)
            System.out.println("SAMESAME");
        else
            System.out.println("TIMING");

    }
}
