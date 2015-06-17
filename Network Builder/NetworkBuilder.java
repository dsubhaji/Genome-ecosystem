package network;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Scanner;


public class NetworkBuilder
{
	static String line;
	static BufferedReader br1 = null, br2 =null;
	static ArrayList<String> pList = new ArrayList<String>();
	static ArrayList<String> rList = new ArrayList<String>();
	
	
	public static void main(String[] args) throws IOException
	{
		
		String fileContent1 = "*Vertices " ;
		String fileContent2 = "*Edges" ;
		
		System.out.println("Enter your current directory: ");
		Scanner scanner = new Scanner(System.in);
		String directory = scanner.nextLine();
		
		try
		{
			br1 =  new BufferedReader(new FileReader(directory + "//people.csv"));
		//	br2 =  new BufferedReader(new FileReader(directory + "//repo.csv"));
			
		} catch(FileNotFoundException e)
		{
			System.out.println(e.getMessage() + " \n file not found re-run and try again");
			System.exit(0);
		}
		int count = 0;
		try {
			while((line = br1.readLine()) != null){ //skip first line
			while((line = br1.readLine()) != null)
			{
				pList.add(line); // add to array list
				count++ ;	
			}
			}
			
		} catch (IOException error) 
		{
			System.out.println(error.getMessage() + "Error reading file");
		}
		System.out.println("Network process completed");
		
		PrintStream myconsole = new PrintStream(new File(directory + "network.net"));
    	System.setOut(myconsole);
    	
		/**************Vertices ***************/
        System.out.println(fileContent1 + count); //print out vertices
        
        //print out each item in the ArrayList
        int size = pList.size();
      		for(int i=0; i < size; i++)
      		{
      			String[] data=(pList.get(i)).split(",");
                  System.out.println(data[1]);
      		} 
      		
      		
      	/************* Edges****************/
      	int q = pList.size(); 
    	System.out.println(fileContent2);
   		 //print out each item in the ArrayList
    	for(int c=0; c<q; c++)
		{
			int v;
			String[] data=(pList.get(c)).split(",");
			for(v=c;v<q; v++)
			{
				String[] dataCorepo=(pList.get(v)).split(",");
				if(dataCorepo[6].equals(data[6]))
				{
					System.out.println(data[1] + " " + dataCorepo[1] + " 1");
					
				}
			}	
		}
    	
	} // end of main
} // end of class

