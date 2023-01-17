package String;
import java.io.*;
import java.util.*;

public class bj17413 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        String str = br.readLine();
        Stack<Character> stack = new Stack<>();

        // isTag로 태그인 지 아닌 지 판단
        // 태그라면 답 문자열에 추가
        // 아니라면 스택에 추가
        boolean isTag = false;

        // 공백문자, <, 줄바꿈을 만날 시 stack.pop을 답 문자열에 추가
        for(char ch : str.toCharArray()) {
            if(ch == '<') {
                while(!stack.isEmpty()) {
                    sb.append(stack.pop());
                }
                isTag = true;
            } else if(ch == '>') {
                sb.append(ch);
                isTag = false;
                continue;
            }
            if(isTag) {
                sb.append(ch);
            } else {
                if(ch == ' ') {
                    while(!stack.isEmpty()) {
                        sb.append(stack.pop());
                    }
                    sb.append(ch);
                } else {
                    stack.push(ch);
                }
            }
        }
        // 마지막 문자열 남아있는 지 체크
        while(!stack.isEmpty()) {
            sb.append(stack.pop());
        }
        System.out.println(sb);
    }
}
