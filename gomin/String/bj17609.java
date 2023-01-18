package String;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class bj17609 {
    // 회문 체크
    public static boolean checkPalindrome(char[] cA, int lt, int rt) {
        while(lt <= rt) {
            if(cA[lt] != cA[rt]) {
                return false;
            }
            lt++;
            rt--;
        }
        return true;
    }
    // 유사회문 체크
    // 만약 짝이 맞지 않는 알파벳이 나온다면, 둘 중 하나를 옮겨 다시 회문 체크
    public static boolean checkPseudo(char[] cA, int lt, int rt) {
        while(lt <= rt) {
            if(cA[lt] != cA[rt]) {
                boolean a = checkPalindrome(cA, lt+1, rt);
                boolean b = checkPalindrome(cA, lt, rt-1);
                if(!a && !b) return false;
                else return true;
            }
            lt++;
            rt--;
        }
        return true;
    }
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int T = Integer.parseInt(br.readLine());

        for(int i=0; i<T; i++) {
            String str = br.readLine();
            char[] cA = str.toCharArray();
            // 포인터 2개 (양 끝)
            int lt = 0, rt = cA.length - 1;

            // 회문과 유사회문 체크
            if(checkPalindrome(cA, lt, rt)) {
                sb.append(0).append('\n');
            } else if(checkPseudo(cA, lt, rt)) {
                sb.append(1).append('\n');
            } else {
                sb.append(2).append('\n');
            }

        }
        System.out.println(sb);
    }
}
