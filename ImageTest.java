// these import statements prompt the code for working with images
import java.io.*;
import java.awt.*;
import java.awt.image.*;
import javax.imageio.*;
import javax.swing.*;

public class ImageTest{

    public static void print(String s){
	System.out.println(s);
    }

    public static void main (String[]args) throws IOException{
	int width = 1000; // of image
	int length = 900;
	File f = null;
	/*
	try{
	    f = new File("PrivateInvestigator.png");
	    buffer = new BufferedImage(width, length, BufferedImage.TYPE_INT_ARGB);
	    buffer = ImageIO.read(f);
	    print("done reading file");
	}catch(IOException e){
	    print("error: did not successfully read file -- " + e);
	}
	*/
	SwingUtilities.invokeLater(new Runnable(){
		public void run(){
		    BufferedImage buffer = null;
		    JFrame j = new JFrame("jframe");
		    j.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		    try{
			buffer = ImageIO.read(new File("PrivateInvestigator.png"));
		    }catch(Exception e){
			e.printStackTrace();
			print("error in rendering photo!!");
			//System.exit(1); // exit bc of abnormal termination
		    }
		    ImageIcon imageIcon = new ImageIcon("PrivateInvestigator.png");
		    JLabel jLabel = new JLabel();
		    jLabel.setIcon(imageIcon);
		    j.getContentPane().add(jLabel, BorderLayout.CENTER);

		    j.pack();
		    j.setLocationRelativeTo(null);
		    j.setVisible(true);
		    print("..");
		}
	    });
	//	run();
	print("huzzah, you have reached the end of the code!");
    }
}

