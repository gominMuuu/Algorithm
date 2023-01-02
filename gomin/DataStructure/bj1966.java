package DataStructure;

import java.util.*;

// id와 중요도를 갖는 Printer 클래스 작성
class Printer {
    int id;
    int priority;

    public Printer(int id, int priority) {
        this.id = id;
        this.priority = priority;
    }
}

public class bj1966 {
    public int solution(int M, Queue<Printer> pQ) {
        int answer = 1;     // 초기값 1

        while(!pQ.isEmpty()) {
            Printer temp = pQ.poll();   // 큐의 첫 값 반환 및 제거

            for(Printer x : pQ) {
                // 중요도 비교 후, 중요도가 낮을 시 뒤로 간다.
                if(temp.priority < x.priority) {
                    pQ.add(temp);
                    temp = null;
                    break;
                }
            }
            // 현재 제일 중요도가 높은 경우
            if(temp != null) {
                // 문제에서 알고자 하는 M번째 문서일 경우 return
                if(temp.id == M) {
                    return answer;
                }
                // M번째 문서가 아니라면, 카운트값 1 올려준다.
                else { answer++; }
            }
        }
        return answer;
    }
    public static void main(String[] args) {
        bj1966 T = new bj1966();
        Scanner kb = new Scanner(System.in);
        int total = kb.nextInt();

        for(int i=0; i<total; i++) {
            int N = kb.nextInt();
            int M = kb.nextInt();
            Queue<Printer> pQ = new LinkedList<>();
            for(int j=0; j<N; j++) {
                pQ.add(new Printer(j, kb.nextInt()));
            }
            System.out.println(T.solution(M, pQ));
        }
    }
}
