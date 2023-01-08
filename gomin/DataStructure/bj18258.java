package DataStructure;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj18258 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        // 자꾸 '시간 초과' 오류 떠서 readline으로 변경
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        Deque<Integer> q = new ArrayDeque<>();
        int N = Integer.parseInt(br.readLine());

        StringTokenizer command;

        while(N-- > 0) {
            command = new StringTokenizer(br.readLine(), " ");	// 문자열 분리

            switch(command.nextToken()) {
                case "push":
                    q.offer(Integer.parseInt(command.nextToken()));
                    break;
                case "pop" :
                    Integer item = q.poll();
                    if(item == null) {sb.append(-1).append('\n');}
                    else {sb.append(item).append('\n');}
                    break;
                case "size":
                    sb.append(q.size()).append('\n');
                    break;
                case "empty":
                    if(q.isEmpty()) {sb.append(1).append('\n');}
                    else {sb.append(0).append('\n');}
                    break;
                case "front":
                    Integer ite = q.peek();
                    if(ite == null) {sb.append(-1).append('\n');}
                    else {sb.append(ite).append('\n');}
                    break;
                case "back":
                    Integer it = q.peekLast();
                    if(it == null) {sb.append(-1).append('\n');}
                    else {sb.append(it).append('\n');}
                    break;
            }
        }
        System.out.println(sb);
    }
}