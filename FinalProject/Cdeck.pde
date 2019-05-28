public class Cdeck
{
  public ArrayList<Cards> tempDeck;
  public ArrayList<Cards> dis;
  public Cdeck(ArrayList<Cards> temp)
  {
    tempDeck=temp;
    dis = new ArrayList<Cards>();
  }
  
  public void setDeck()
  {
     
    for(int i=0; i<4; i++)
    {
      for(int j=0; j<14; j++)
      {
        if(i==0)
        tempDeck.add( new Cards(j, "red"));
        if(i==1)
        tempDeck.add( new Cards(j, "yellow"));
        if(i==2)
        tempDeck.add( new Cards(j, "green"));
        if(i==3)
        tempDeck.add( new Cards(j, "blue"));
      }
      for(int k=1; k<14; k++)
      {
        if(k==13)
        {
          if(i==0)
        tempDeck.add( new Cards(14, "red"));
        if(i==1)
        tempDeck.add( new Cards(14, "yellow"));
        if(i==2)
        tempDeck.add( new Cards(14, "green"));
        if(i==3)
        tempDeck.add( new Cards(14, "blue"));
        }else{
        if(i==0)
        tempDeck.add( new Cards(k, "red"));
        if(i==1)
        tempDeck.add( new Cards(k, "yellow"));
        if(i==2)
        tempDeck.add( new Cards(k, "green"));
        if(i==3)
        tempDeck.add( new Cards(k, "blue"));
      }
      }
    }
    
  }
  public void shuffleDeck(ArrayList<Cards> deck)
  {
    
    for(int i=0; i<108; i++)
    deck.add(tempDeck.remove((int) random(0, tempDeck.size())));
     
  }
  public void disgardPile(ArrayList<Cards> hand1, int indx)
  {
    dis.add(hand1.remove(indx)); 
  }
  public ArrayList<Cards> getDisgardPile()
  {
    return dis;
  }
  public void startDisgard(ArrayList<Cards> deck)
  {
    disgardPile(deck, deck.size()-1);
  }
  public void disgard(ArrayList<Cards> hand, int indx)
  {
     disgardPile(hand, indx);
  }
  public boolean checkCard(Cards onDisgard, Cards putIn)
  {
    boolean isGood = false;
    if(onDisgard.getNumber() == putIn.getNumber() || onDisgard.getColour().equals(putIn.getColour()))
    isGood = true;
    return isGood;
}
}
