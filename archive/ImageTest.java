// these import statements prompt the code for working with images
import java.io.*;
import java.awt.*;
import java.awt.image.*;
import javax.imageio.*;
import javax.swing.*;

public class ImageTest{ // extends JPanel{

    public static void print(String s){
	System.out.println(s);
    }

    public static void main (String[]args) throws IOException{

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
		    //j.setLocationRelativeTo(null);
		    j.setVisible(true);
		    j.setSize(264,191);
		}
	    });
	//	run();
	print("huzzah, you have reached the end of the code!");
    }
}

