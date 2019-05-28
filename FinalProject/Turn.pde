public class Turn
{
  private Players playera;
  private ArrayList<Cards> deckTemp;

  public Turn(Players p, ArrayList<Cards> c)
  {
    playera=p;
    deckTemp=c;
  }
  public void playerDraw(ArrayList<Cards> c)
  {
    playera.drawCard(c);
  }
  public void playerDisgard(ArrayList<Cards> c)
  {
   //might not use
  }
  
}
