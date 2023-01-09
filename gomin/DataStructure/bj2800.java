package DataStructure;
import java.util.*;

// 풀이
// 1. 괄호 쌍의 인덱스를 가지는 리스트를 생성한다. 예) (0, 6) (3, 5)
// 2. 위 리스트의 부분집합을 구한다.
// 3. 문자열에서 부분집합에 해당하는 인덱스의 문자는 지운다.
// 4. 답 ArrayList에 넣고 출력.
//
// 예제에 대한 답은 나오는데 제출하면 '틀렸습니다' 뜸.^^

// 괄호의 인덱스를 가지는 클래스 생성
class Bracket {
    int lId;
    int rId;

    public Bracket(int lId, int rId) {
        this.lId = lId;
        this.rId = rId;
    }
}

class Index {
    int id;
    char ch;

    public Index(int id, char ch) {
        this.id = id;
        this.ch = ch;
    }
}

public class bj2800 {
    static ArrayList<String> answer = new ArrayList<>();

    public void solution(String str) {
        Stack<Index> stack = new Stack<>();
        ArrayList<Bracket> bA = new ArrayList<>();

        char[] cA = str.toCharArray();
        for(int i=0; i<cA.length; i++) {
            stack.push(new Index(i, cA[i]));
            if(cA[i] == ')') {
                stack.pop();
                while(stack.peek().ch != '(') {
                    stack.pop();
                }
                if(stack.peek().ch == ('(')) {
                    bA.add(new Bracket(stack.pop().id, i));
                }
            }
        }

        int n = bA.size();
        boolean[] visited = new boolean[n];
        powerSet(bA, visited, n, 0, str);

        // 답을 사전 순으로 정렬한다.
        Collections.sort(answer);
        answer.remove(0);   // 전체집합에 해당하는 인덱스0의 값을 제거

        ArrayList<String> newAnswer = new ArrayList<>();
        // 새로운 ArrayList에 요소를 추가
        for(String strValue : answer) {
            // 중복 요소가 없는 경우 요소를 추가
            if(!newAnswer.contains(strValue)) {
                newAnswer.add(strValue);
            }
        }
        for(String x : newAnswer) {
            System.out.println(x);
        }
    }
    // 괄호 쌍 리스트의 부분집합을 구하는 powerSet 함수
    static void powerSet(ArrayList<Bracket> arr, boolean[] visited, int n, int idx, String str) {
        if(idx == n) {
            ArrayList<Integer> iA = new ArrayList<>();
            for(int i=0; i<visited.length; i++) {
                if(visited[i]) {
                    iA.add(arr.get(i).lId);
                    iA.add(arr.get(i).rId);
                }
            }

            Collections.sort(iA, Collections.reverseOrder());
            StringBuffer sb = new StringBuffer();
            sb.append(str);
            for(int x : iA) {
                sb.deleteCharAt(x);
            }
            answer.add(String.valueOf(sb));
            return;
        }

        visited[idx] = false;
        powerSet(arr, visited, n, idx + 1, str);

        visited[idx] = true;
        powerSet(arr, visited, n, idx + 1, str);
    }
    public static void main(String[] args) {
        bj2800 T = new bj2800();
        Scanner kb = new Scanner(System.in);
        String str = kb.nextLine();

        T.solution(str);
    }
}