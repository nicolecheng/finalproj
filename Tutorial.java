import java.io.*;
import java.awt.*;
import java.awt.image.*;
import javax.imageio.*;
import javax.swing.*;

public class Tutorial extends JPanel{ //implements MouseListener{
    public void paint(Graphics g) {
	Image img = createImageWithText();
	g.drawImage(img, 20,20,this);
    }
    public Image createImageWithText(){
	BufferedImage bufferedImage = new BufferedImage(1100,600,BufferedImage.TYPE_INT_RGB);
	Graphics g = bufferedImage.getGraphics();

	g.drawString("add text here", 20,20);
	;
	return bufferedImage;
    }

    public static void main(String[] args) {
	JFrame frame = new JFrame();
	frame.getContentPane().add(new Tutorial());

	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	frame.setSize(1200, 700);
	frame.setVisible(true);
    }
}
