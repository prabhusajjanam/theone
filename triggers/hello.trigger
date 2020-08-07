trigger hello on Account (before insert,before update) {
myhelloworld.addhelloworld(trigger.new);
}