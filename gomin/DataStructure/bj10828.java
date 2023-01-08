package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Stack;
import java.util.StringTokenizer;

public class bj10828 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        Stack<Integer> stack = new Stack<>();
        int N = Integer.parseInt(br.readLine());

        StringTokenizer command;

        while(N-- > 0) {
            command = new StringTokenizer(br.readLine(), " ");	// 문자열 분리

            switch(command.nextToken()) {
                case "push":
                    stack.add(Integer.parseInt(command.nextToken()));
                    break;
                case "pop" :
                    if(stack.isEmpty()) {sb.append(-1).append('\n');}
                    else {sb.append(stack.pop()).append('\n');}
                    break;
                case "size":
                    sb.append(stack.size()).append('\n');
                    break;
                case "empty":
                    if(stack.isEmpty()) {sb.append(1).append('\n');}
                    else {sb.append(0).append('\n');}
                    break;
                case "top":
                    if(stack.isEmpty()) {sb.append(-1).append('\n');}
                    else {sb.append(stack.peek()).append('\n');}
                    break;
            }
        }
        System.out.println(sb);
    }
}
