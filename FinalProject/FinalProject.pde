ArrayList<Cards> deck = new ArrayList<Cards>();
ArrayList<Cards> disgardPile = new ArrayList<Cards>();
Cdeck atmp = new Cdeck(deck);
ArrayList<Players> multi = new ArrayList<Players>();
 int numPlayers=2;
 int pTurn = 0;
 int indx=0;
 
void setup() {
  atmp.setDeck();
  atmp.shuffleDeck(deck);

  //boolean more = true;
 
  multi.add(new Players());
  multi.add(new Players("Lily"));
  for (int i=0; i<numPlayers; i++)
  multi.get(i).startHand(deck);
  atmp.startDisgard(deck); 
  for(int i = 0; i<atmp.getDisgardPile().size(); i++)
  disgardPile.add(atmp.getDisgardPile().get(i));
  Play();
}
void draw(){
  
}
void Play() {
  
  boolean endGame = false;
  
 // while(endGame == false)
  //{
 // if(pTurn == 0)
 // {
 //  for(int i =0; i<multi.get(pTurn).getHand().size(); i++)
 //  System.out.print(multi.get(pTurn).getHand().get(i).getNumber()+" "+multi.get(pTurn).getHand().get(i).getColour()+"  ");
 //  System.out.println("\nCurrent Player: "+multi.get(pTurn).getName());
 //  System.out.println("Draw (left arrow key) or Disgard (right arrow key)");
   
 //  if(multi.get(pTurn).getHand().size() == 0)
//    endGame = true;
 //   pTurn = 1;
//}else{
  int leg = multi.get(pTurn).getHand().size();
   System.out.println("\n\n\n\n\n\n\n");
   for(int i =0; i<leg; i++)
   System.out.print(multi.get(pTurn).getHand().get(i).getNumber()+" "+multi.get(pTurn).getHand().get(i).getColour()+"  ");
   System.out.println("\nCurrent Player: "+multi.get(pTurn).getName());
   
   for(int i =0; i<multi.get(pTurn).getHand().size(); i++)
   {
     Cards temp = multi.get(pTurn).getHand().get(i);
     Cards disg = atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1);
     if(atmp.checkCard( disg, temp))
     {
       atmp.disgard(multi.get(pTurn).getHand(), i);
       pTurn = 0;
     }
   }
   multi.get(pTurn).drawCard(deck);
   int index = multi.get(pTurn).getHand().size()-1;
   Cards last = multi.get(pTurn).getHand().get(index);
   if(atmp.checkCard(last, atmp.getDisgardPile().get(atmp.getDisgardPile().size()-1)))
   atmp.disgard(multi.get(pTurn).getHand(), index);  
    if(multi.get(pTurn).getHand().size() == 0)
     endGame = true;
     pTurn =0;
 // }

 // }
  
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==LEFT){
      println("Drawing");
      multi.get(pTurn).drawCard(deck);
    }
    
     if(keyCode==RIGHT){
      println("Disgarding");
      //atmp.checkCard(multi.get(pTurn).getHand()
      //atmp.disgard(multi.get(pTurn).getHand(), indx);
      
    }
  }
  
}
