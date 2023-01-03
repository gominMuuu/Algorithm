package DataStructure;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

// id와 높이를 갖는 Tower 클래스 작성
class Tower {
    int id;
    int height;

    public Tower(int id, int height) {
        this.id = id;
        this.height = height;
    }
}
public class bj2493 {
    public void solution(int[] hA) {
        Stack<Tower> stack = new Stack<>();

        // 현재 타워 높이 값과 스택의 제일 최근값의 높이를 비교 후
        // 만약 스택에 있는 값의 높이가 더 크다면 출력 후 push
        // 만약 현재 가지고 있는 값의 높이가 더 크다면 스택에 있는 최근값을 pop 후 현재값 push
        for(int i=0; i<hA.length; i++) {
            while(!stack.isEmpty()) {
                if(stack.peek().height >= hA[i]) {
                    System.out.print(stack.peek().id + " ");
                    break;
                }
                stack.pop();
            }
            if(stack.isEmpty()) {
                System.out.print("0 ");
            }
            stack.push(new Tower(i+1, hA[i]));
        }
    }
    public static void main(String[] args) throws NumberFormatException, IOException {
        bj2493 T = new bj2493();
        // Scanner로 입력값 받으면 '메모리 초과'
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());
        StringTokenizer st = new StringTokenizer(br.readLine());

        int[] hA = new int[N];
        for(int i=0; i<N; i++) {
            hA[i] = Integer.parseInt(st.nextToken());
        }
        T.solution(hA);
    }
}
