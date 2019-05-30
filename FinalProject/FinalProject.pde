ArrayList<Cards> deck = new ArrayList<Cards>();
ArrayList<Cards> disgardPile = new ArrayList<Cards>();
Cdeck atmp = new Cdeck(deck);
ArrayList<Players> multi = new ArrayList<Players>();
int numPlayers=2;
int pTurn = 0;
int indx=0;
boolean isFinished = false;
int numPos = 0;
ArrayList<Integer> possible = new ArrayList<Integer>();
boolean endGame = false;
boolean disgard = false;
int j=0;
int u=0;
void setup() {
  atmp.setDeck();
  atmp.shuffleDeck(deck);

  //boolean more = true;


  multi.add(new Players("Lily"));
  multi.add(new Players());
  for (int i=0; i<numPlayers; i++)
    multi.get(i).startHand(deck);
  atmp.startDisgard(deck); 
  for (int i = 0; i<atmp.getDisgardPile().size(); i++)
    disgardPile.add(atmp.getDisgardPile().get(i));
  //Play();
}
void draw() {
  if (endGame == false)
  {
    if (pTurn == 0)
    {
      if (disgard)
      {   
        if (keyCode==UP)
        {
          additionalEffects(multi.get(pTurn).getHand().get(possible.get(u)));
          atmp.disgard(multi.get(pTurn).getHand(), possible.get(u));
          for (int k = numPos-1; k>-1; k--)
            possible.remove(k);
          numPos=0;
          possible = new ArrayList<Integer>();
          isFinished = true;
          disgard = false;
        }
        if (j>80)
        {
          j = 0;
          u++;
          if (u>=numPos)
            u = 0;
          System.out.println("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
          currentCard();
          println("Would you like to disgard "+multi.get(pTurn).getHand().get(possible.get(u)).getNumber()+" "+multi.get(pTurn).getHand().get(possible.get(u)).getColour());
          println("up arrow key to disgard");
        }
        j++;
      } else {
        endGame();
        deckReset();
        currentCard();
        showHand();
        System.out.println("\nCurrent Player: "+multi.get(pTurn).getName());
        System.out.println("\nHere are your playable cards:");
        isPlayable();
        System.out.println("\n\nDraw (left arrow key) or Disgard (right arrow key)");

        if (isFinished) {
          System.out.println("\n\n\n\n\n\n\n\n");
          pTurn = 1;
        }
      }
    } else {
      endGame();
      deckReset();

      System.out.print("\n\n\n\n\n\n\nCurrent Card: ");
      currentCard();
      System.out.println("\nCurrent Hand:");
      showHand();
      System.out.println("\nCurrent Player: "+multi.get(pTurn).getName());

      for (int i =0; i<multi.get(pTurn).getHand().size(); i++)
      {
        Cards temp = multi.get(pTurn).getHand().get(i);
        Cards disg = atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1);
        if (atmp.checkCard( disg, temp))
        {
          atmp.disgard(multi.get(pTurn).getHand(), i);
          System.out.print("\n\n\n\n\n\n\nCurrent Card: ");
          currentCard();
          isFinished = false;
          pTurn = 0;
          return;
        }
      }
      if (pTurn == 1)
      {
        multi.get(pTurn).drawCard(deck);
        int index = multi.get(pTurn).getHand().size()-1;
        Cards last = multi.get(pTurn).getHand().get(index);
        if (atmp.checkCard(last, atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1)))
          atmp.disgard(multi.get(pTurn).getHand(), index);  
        currentCard();
        isFinished = false;
        pTurn =0;
      }
    }
  }
  endGame();
}
void currentCard()
{
  System.out.println("Current Card: "+atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1).getNumber()+" "+atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1).getColour());
}
void showHand()
{
  int leng = multi.get(pTurn).getHand().size();
  for (int i =0; i<leng; i++)
    System.out.print(multi.get(pTurn).getHand().get(i).getNumber()+" "+multi.get(pTurn).getHand().get(i).getColour()+"  ");
}
void deckReset()
{
  if (deck.size()==0)
    atmp.switchA(atmp.getDisgardPile(), deck);
}
void isPlayable()
{
  for (int i =0; i<multi.get(pTurn).getHand().size(); i++)
  {
    if (atmp.checkCard(atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1), multi.get(pTurn).getHand().get(i)))
    {
      System.out.print(multi.get(pTurn).getHand().get(i).getNumber()+" "+multi.get(pTurn).getHand().get(i).getColour()+"  ");
      numPos++;
      possible.add(i);
    }
  }
}

void endGame() {
  if (multi.get(pTurn).getHand().size() == 0)
    endGame = true;
  if (endGame == true) {
    System.out.println("The game has ended");
  }
}

void additionalEffects(Cards current)
{
  int effectOn;
  Cards check = current;
  if(pTurn == 0)
  {
    effectOn = 1;
  }else{
    effectOn = 0;
  }
    
  if(check.getNumber() == 14)
  {
    multi.get(effectOn).drawCard(deck);
    multi.get(effectOn).drawCard(deck);
    multi.get(effectOn).drawCard(deck);
    multi.get(effectOn).drawCard(deck);
    //change color
  }
  if(check.getNumber() == 13)
  {
    //change color
  }
  if(check.getNumber() == 12)
  {
    multi.get(effectOn).drawCard(deck);
    multi.get(effectOn).drawCard(deck);
  }
  if(check.getNumber() == 11)
  {
  }
  if(check.getNumber() == 10)
  {
  }
}


void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) {
      println("Drawing");
      multi.get(pTurn).drawCard(deck);
      isFinished = true;
    }

    if (keyCode==RIGHT) {
      println("Disgarding");
      if (numPos == 0)
      {
        println("Sorry you have no disgardable cards");
      } else {
        disgard = true;
        u=0;
        j=0;
      }
    }
  }
}
