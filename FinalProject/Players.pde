public class Players 
{
  private String name;
  private ArrayList<Cards> hand;
  public Players()
  {
    name="AI";
    hand = new ArrayList<Cards>();
  }
  public Players(String nam)
  {
    name=nam;
    hand = new ArrayList<Cards>();
  }
  public String getName()
  {
    return name;
  }
  public ArrayList<Cards> getHand()
  {
    return hand;
  }
  public void startHand(ArrayList<Cards> deck)
  {
    for(int i=0; i<7; i++)
    hand.add(deck.remove(deck.size()-1));
  }
  
  public void drawCard(ArrayList<Cards> deck)
  {
    hand.add(deck.remove(deck.size()-1));
  }
}
