package DataStructure;
import java.util.*;

public class bj1935 {
    public Double solution(HashMap<Character, Double> iM, String str) {
        Double answer = 0.00;
        Stack<Double> stack = new Stack<>();

        for(char x : str.toCharArray()) {
            if(Character.isAlphabetic(x)) {
                stack.push(iM.get(x));
            } else {
                Double rt = stack.pop();
                Double lt = stack.pop();
                if(x == '+') stack.push(lt + rt);
                else if(x == '-') stack.push(lt - rt);
                else if(x == '*') stack.push(lt * rt);
                else if(x == '/') stack.push(lt / rt);
            }
        }
        answer = stack.get(0);
        return answer;
    }
    public static void main(String[] args) {
        bj1935 T = new bj1935();
        Scanner kb = new Scanner(System.in);
        int N = kb.nextInt();
        String str = kb.next();

        HashMap<Character, Double> iM = new HashMap<>();
        for(int i=0; i<N; i++) {
            Double n = kb.nextDouble();
            iM.put((char)('A' + i), n);
//            System.out.println((char)('A' + i) + ":" + n);
        }

        System.out.printf("%.2f", T.solution(iM, str));
    }
}