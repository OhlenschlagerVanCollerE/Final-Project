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

    for (int i=0; i<4; i++)
    {
      for (int j=0; j<14; j++)
      {
        if (j==13)
        {
          tempDeck.add(new Cards(j, "wild"));
        } else if (j==12)
        {
          if (i==0)
            tempDeck.add( new Cards(j, "red +2"));
          if (i==1)
            tempDeck.add( new Cards(j, "yellow +2"));
          if (i==2)
            tempDeck.add( new Cards(j, "green +2"));
          if (i==3)
            tempDeck.add( new Cards(j, "blue +2"));
        } else if (j==11)
        {
          if (i==0)
            tempDeck.add( new Cards(j, "red reverse"));
          if (i==1)
            tempDeck.add( new Cards(j, "yellow reverse"));
          if (i==2)
            tempDeck.add( new Cards(j, "green reverse"));
          if (i==3)
            tempDeck.add( new Cards(j, "blue reverse"));
        } else if (j==10)
        {
          if (i==0)
            tempDeck.add( new Cards(j, "red skip"));
          if (i==1)
            tempDeck.add( new Cards(j, "yellow skip"));
          if (i==2)
            tempDeck.add( new Cards(j, "green skip"));
          if (i==3)
            tempDeck.add( new Cards(j, "blue skip"));
        } else {
          if (i==0)
            tempDeck.add( new Cards(j, "red"));
          if (i==1)
            tempDeck.add( new Cards(j, "yellow"));
          if (i==2)
            tempDeck.add( new Cards(j, "green"));
          if (i==3)
            tempDeck.add( new Cards(j, "blue"));
        }
      }
      for (int k=1; k<14; k++)
      {
        if (k==13)
        {
          tempDeck.add( new Cards(14, "wild +4"));
        } else if (k==12)
        {
          if (i==0)
            tempDeck.add( new Cards(k, "red +2"));
          if (i==1)
            tempDeck.add( new Cards(k, "yellow +2"));
          if (i==2)
            tempDeck.add( new Cards(k, "green +2"));
          if (i==3)
            tempDeck.add( new Cards(k, "blue +2"));
        } else if (k==11)
        {
          if (i==0)
            tempDeck.add( new Cards(k, "red reverse"));
          if (i==1)
            tempDeck.add( new Cards(k, "yellow reverse"));
          if (i==2)
            tempDeck.add( new Cards(k, "green reverse"));
          if (i==3)
            tempDeck.add( new Cards(k, "blue reverse"));
        } else if (k==10)
        {
          if (i==0)
            tempDeck.add( new Cards(k, "red skip"));
          if (i==1)
            tempDeck.add( new Cards(k, "yellow skip"));
          if (i==2)
            tempDeck.add( new Cards(k, "green skip"));
          if (i==3)
            tempDeck.add( new Cards(k, "blue skip"));
        } else {
          if (i==0)
            tempDeck.add( new Cards(k, "red"));
          if (i==1)
            tempDeck.add( new Cards(k, "yellow"));
          if (i==2)
            tempDeck.add( new Cards(k, "green"));
          if (i==3)
            tempDeck.add( new Cards(k, "blue"));
        }
      }
    }
  }

  public void shuffleDeck(ArrayList<Cards> deck)
  {

    for (int i=0; i<108; i++)
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
    if (onDisgard.getNumber() == putIn.getNumber() || onDisgard.getColour().contains(putIn.getColour()) || putIn.getColour().contains(onDisgard.getColour()) || onDisgard.getColour().contains("wild") || putIn.getColour().contains("wild"))
      isGood = true;
    return isGood;
  }
  public void switchA(ArrayList<Cards> disg, ArrayList<Cards> dec)
  {
    ArrayList<Cards> newDis = new ArrayList<Cards>();
    newDis.add(dis.get(dis.size()-1));
    dec = disg;
    dis = newDis;
    deck = dec;
  }
}
