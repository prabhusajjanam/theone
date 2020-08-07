/* Author: Prabhu Sajjanam : Generate a Lottery Number
 * How to run: use below lines to run in Anonumous window after placing numbers in the below sets.
 * PowerBall
Set<integer> numbersSet1 = new Set<integer>{10,16,14,35,23,12,09,02,11,20,39,03,02,01,49,20,02,19,14,03,24};
Set<integer> numbersSet2 = new Set<integer>{12,32,47,49,30,33,12,09,33,24,41,21,04,11,53,23,04,31,18,06,29};
Set<integer> numbersSet3 = new Set<integer>{15,35,54,50,35,54,15,17,44,38,53,23,07,21,57,39,16,35,26,12,42};
Set<integer> numbersSet4 = new Set<integer>{19,36,55,59,41,57,31,36,59,56,55,31,43,25,59,59,30,50,39,32,44};
Set<integer> numbersSet5 = new Set<integer>{56,46,68,66,57,60,60,67,67,68,68,59,56,54,62,60,46,67,68,64,63};
Set<integer> starNumbers = new Set<integer>{19,03,25,06,02,13,02,18,08,18,19,03,22,07,26,18,20,14,09,19,10};
PS_Utility.getNumbers(numbersSet1,numbersSet2,numbersSet3,numbersSet4,numbersSet5,starNumbers);
DrawDate:Output:LotteryResult
02/22/2020: 10,12,16,41,56 :
 *MegaMillions
Set<integer> numbersSet1 = new Set<integer>{06,10,04,09,32,28,17,03,16,03,09,17,25,37,30,17,27,03,22,17,18};
Set<integer> numbersSet2 = new Set<integer>{12,32,06,14,48,31,36,04,18,25,11,27,40,41,44,34,37,20,30,21,31};
Set<integer> numbersSet3 = new Set<integer>{39,48,32,27,50,33,47,18,29,30,13,49,41,42,49,40,48,23,53,29,46};
Set<integer> numbersSet4 = new Set<integer>{61,54,52,36,51,57,51,23,31,54,31,51,52,53,53,63,63,35,55,39,54};
Set<integer> numbersSet5 = new Set<integer>{70,55,64,52,64,62,62,38,37,70,47,66,56,63,56,64,66,60,56,56,61};
Set<integer> starNumbers = new Set<integer>{04,18,06,04,10,19,21,24,08,09,11,02,21,16,11,24,11,16,16,22,25};
PS_Utility.getNumbers(numbersSet1,numbersSet2,numbersSet3,numbersSet4,numbersSet5,starNumbers);
DrawDate:Output:LotteryResult
02/21/2020: 17,18,29,39,70,18

*/

public class PS_Utility {
    public static integer getRandomNumber(set<integer> inputNumbers){
        return (new List<integer>(inputNumbers))[Math.mod(Math.abs(Crypto.getRandomLong().intValue()),inputNumbers.size())];
    }
    
    public static string getNumbers(set<integer> numbersSet1,set<integer>numbersSet2, set<integer>numbersSet3,set<integer>numbersSet4, set<integer>numbersSet5, set<integer>starNumbers)
    {
        string output = '';
        integer number1;
        integer number2;
        integer number3;
        integer number4;
        integer number5;
        integer starNumber;
        set<integer> numberSet = new set<integer>();
        number1 = getRandomNumber(numbersSet1);
        for(integer i=0;i < 100;i++)
        {
            if(number1 < 20)
            {
                numberSet.add(number1);
                break;
            }
            else{
                number1 = getRandomNumber(numbersSet1);
            }
        }        
        number2 = getRandomNumber(numbersSet2);
        
        for(integer i=0;i < 100;i++)
        {
            if(!numberSet.contains(number2) && number2 > 10 && number2 < 20 && number2 > number1)
            {
                numberSet.add(number2);
                break;
            }
            else
            {
                number2 = getRandomNumber(numbersSet2);
            }
        }
        number3 = getRandomNumber(numbersSet3);
        for(integer i=0;i < 100;i++)
        {
            if(!numberSet.contains(number3) && number3 > 10 && number3 < 30 && number3 > number2)
            {
                numberSet.add(number3);
                break;
            }
            else
            {
                number3 = getRandomNumber(numbersSet3);
            }
        }
        number4 = getRandomNumber(numbersSet4);
        for(integer i=0;i < 100;i++)
        {
            if(!numberSet.contains(number4) && number4 > 30 && number4 < 50 && number4 > number3)
            {
                numberSet.add(number4);
                break;
            }
            else
            {
                number4 = getRandomNumber(numbersSet4);
            }
        }
        number5 = getRandomNumber(numbersSet5);
        for(integer i=0;i < 100;i++)
        {
            if(!numberSet.contains(number5) && number5 > 50 && number5 <= 70 && number5 > number4)
            {
                numberSet.add(number5);
                break;
            }
            else
            {
                number5 = getRandomNumber(numbersSet5);
            }
        }
        
        list<integer> outputFiveNumbers = new list<integer>(numberSet);
        outputFiveNumbers.sort();
        
        for(integer i : outputFiveNumbers)
        {
            output = output+i+',';
        }
        
        
        starNumber = getRandomNumber(starNumbers);
        for(integer i=0;i < 100;i++)
        {
            if(starNumber < 30)
            {
                output = output+starNumber;
                break;
            }
            else
            {
                starNumber = getRandomNumber(starNumbers);
            }
        }
        
        system.debug('Numbers are '+output);
        return output;
    }
}