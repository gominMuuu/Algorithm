package DataStructure;
import java.util.*;

// id와 종이값을 갖는 Balloon 클래스 작성
class Balloon {
    int id;
    int paper;

    public Balloon(int id, int paper) {
        this.id = id;
        this.paper = paper;
    }
}

public class bj2346 {
    public void solution(int[] pA) {
        // 덱
        Deque<Balloon> stack = new ArrayDeque<>();

        for(int i=0; i<pA.length; i++) {
            stack.add(new Balloon(i+1, pA[i]));
        }
        while (true) {
            // 첫번째 풍선 poll
            Balloon b = stack.pollFirst();
            System.out.printf(b.id + " ");
            // 덱이 비어있을 시 중단
            if(stack.isEmpty()) break;
            // 만약 종이에 적힌 값이 양수라면
            // 뒤로 N-1만큼 이동
            if (b.paper > 0) {
                for (int i = 0; i < b.paper - 1; i++) {
                    Balloon tmp = stack.pollFirst();
                    stack.addLast(tmp);
                }
            } else {
                // 만약 종이에 적힌 값이 음수라면
                // 앞으로 절댓값 N만큼 이동
                for (int i = 0; i < Math.abs(b.paper); i++) {
                    Balloon tmp = stack.pollLast();
                    stack.addFirst(tmp);
                }
            }
        }
    }
    public static void main(String[] args) {
        bj2346 T = new bj2346();
        Scanner kb = new Scanner(System.in);
        int N = kb.nextInt();

        int[] pA = new int[N];
        for(int i=0; i<N; i++) {
            pA[i] = kb.nextInt();
        }
        T.solution(pA);
    }
}
