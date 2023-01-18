package String;

import java.io.*;
import java.util.*;

public class bj20210 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(br.readLine());
        String[] sA = new String[N];

        for(int i=0; i<N; i++) {
            sA[i] = br.readLine();
        }

        // 문자열 정렬 조건
        Arrays.sort(sA, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                System.out.println(o1 + " , " + o2);
                int lt = 0, rt = 0;
                String num1Str = "0", num2Str = "0";

                while(lt < o1.length() && rt < o2.length()) {
                    // 문자와 문자 비교
                    if(Character.isAlphabetic(o1.charAt(lt)) && Character.isAlphabetic(o2.charAt(rt))) {
                        int num1 = Integer.parseInt(num1Str);
                        int num2 = Integer.parseInt(num2Str);
                        if(num1 != num2) {
                            return num1 - num2;
                        }

                        if(o1.charAt(lt) == o2.charAt(rt)) {
                            lt++;
                            rt++;
                        } else {
                            return o1.charAt(lt) - o2.charAt(rt);
                        }
                    }
                    // 앞 단어는 숫자, 뒷 단어는 문자
                    else if(!Character.isAlphabetic(o1.charAt(lt)) && Character.isAlphabetic(o2.charAt(rt))) {
                        num1Str += String.valueOf(o1.charAt(lt));
                        int num1 = Integer.parseInt(num1Str);
                        int num2 = Integer.parseInt(num2Str);
                        if(num1 == num2) {
                            lt++;
                            rt++;
                        } else return num1 - num2;
                    }
                    // 앞 단어는 문자, 뒷 단어는 숫자
                    else if(Character.isAlphabetic(o1.charAt(lt)) && !Character.isAlphabetic(o2.charAt(rt))) {
                        num2Str += String.valueOf(o2.charAt(rt));
                        int num1 = Integer.parseInt(num1Str);
                        int num2 = Integer.parseInt(num2Str);
//                        System.out.println(num1 + ", " + num2);
                        if(num1 == num2) {
                            lt++;
                            rt++;
                        } else if(num1 == 0) return num2;
                        else return num1 - num2;
                    }
                    // 숫자와 숫자 비교
                    else {
                        num1Str += String.valueOf(o1.charAt(lt));
                        num2Str += String.valueOf(o2.charAt(rt));
                        lt++;
                        rt++;
                    }
                }
                return o1.compareTo(o2);
            }
        });

        for(String x : sA) {
            System.out.println(x);
        }
    }
}
