trigger concreation on Account (after insert) {

acccreation myaccClass = new acccreation();
myaccClass.accmethod(trigger.new);

//acccreation.accmethod(trigger.new);
}