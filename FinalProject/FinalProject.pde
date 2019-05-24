void setup()
{
  ArrayList<Cards> deck = new ArrayList<Cards>();
  Cdeck atmp = new Cdeck(deck);
  atmp.setDeck();
  atmp.shuffleDeck(deck);
  ArrayList<Players> multi = new ArrayList<Players>();
  //boolean more = true;
  int numPlayers=2;
  multi.add(new Players());
  multi.add(new Players("Lily"));
  for(int i=0; i<numPlayers; i++)
  multi.get(i).startHand(deck);
  atmp.startDisgard(deck); // disgard & draw methods work
  
}
