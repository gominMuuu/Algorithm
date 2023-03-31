package BinarySearch;

import java.io.*;
import java.util.*;

public class bj1477 {
    static int[] dist;

    public static Stack<Integer> sortedStack(Stack stack){
        Stack<Integer> newStack = new Stack<>();
        while (!stack.isEmpty()){
            int value = (int) stack.pop();

            if(!newStack.isEmpty() && value >= newStack.peek()){
                newStack.push(value);
            } else {
                while (!newStack.isEmpty() && newStack.peek() > value){
                    stack.push(newStack.pop());
                }
                newStack.push(value);
            }
        }
        return newStack;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        // 현재 휴게소의 개수 N, 더 지으려고 하는 휴게소의 개수 M, 고속도로의 길이 L
        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int l = Integer.parseInt(st.nextToken());

        int[] arr = new int[n + 2];
        dist = new int[n + 1];

        st = new StringTokenizer(br.readLine(), " ");
        arr[0] = 0;
        for(int i=1; i<=n; i++) {
            arr[i] = Integer.parseInt(st.nextToken());
        }
        arr[n + 1] = l;

        // 정렬
        Arrays.sort(arr);
        for(int i=0; i<n+1; i++) {
            dist[i] = arr[i + 1] - arr[i];
        }

        Arrays.sort(dist);
        Stack<Integer> stack = new Stack<>();
        for(int x : dist) {
            stack.add(x);
        }

        int cnt = 1;
        while(cnt <= m && !stack.isEmpty()) {
            int num = stack.pop();
            if(num % 2 == 0) {
                stack.add(num / 2);
            } else {
                int a = num / 2;
                int b = num / 2 + 1;
                stack.add(a);
                stack.add(b);
            }
            cnt++;
            stack = sortedStack(stack);
        }

        System.out.println(stack.peek());
    }
}
