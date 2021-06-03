//////////////////////////////////////////////////////////////
// Word Analyzer Program
// By Anneliese Brei
// June 2, 2021
//////////////////////////////////////////////////////////////

// Import RiTa modules
import rita.*;
import rita.antlr.*;
import com.google.gson.*;
import com.google.gson.stream.*;
import com.google.gson.reflect.*;
import com.google.gson.internal.*;
import com.google.gson.internal.reflect.*;
import com.google.gson.internal.bind.*;
import com.google.gson.internal.bind.util.*;
import com.google.gson.annotations.*;
import org.unbescape.uri.*;
import org.unbescape.*;
import org.unbescape.javascript.*;
import org.unbescape.css.*;
import org.unbescape.xml.*;
import org.unbescape.java.*;
import org.unbescape.html.*;
import org.unbescape.csv.*;
import org.unbescape.json.*;
import org.unbescape.properties.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.tree.xpath.*;
import org.antlr.v4.runtime.tree.pattern.*;
import org.antlr.v4.runtime.dfa.*;
import org.antlr.v4.runtime.atn.*;

//////////////////////////////////////////////////////////////
String word, stresses, phonemes;
String typed;
String[] pos;

//////////////////////////////////////////////////////////////
void setup() {
  word = "umbrella";
  typed = "";
  stresses = RiTa.stresses(word);
  phonemes = RiTa.phones(word);
  pos = RiTa.pos(word);
  size(750, 500);
}

void draw() {
  background(255, 245, 245);
  fill(0);
  textAlign(CENTER);
  
  // Print word
  textSize(45);
  text(word, 0, 100, 750, 100);
  
  // Print stresses, phonemes
  textSize(25);
  text("Lexical stress: " + stresses, 0, 200, 750, 100);
  text("Phonemes: " + phonemes, 0, 250, 750, 100);
  
  // Get and print part of speech
  String part_of_speech = get_tag(pos[0]);
  text("Part of speech: " + part_of_speech, 0, 300, 750, 100); 
  
  fill(255, 0, 0);
  textSize(16);
  text("Type a new word & press enter:\n ", 0, 400, 750, 100);
  textSize(25);
  text(typed, 0, 435, 750, 100);
}

void keyPressed() {

  // If return key is pressed, save input
  if (key == ENTER || key == ' ') {
    word = typed;
    typed = "";   // clears input
    
    // Reset word analysis
    stresses = RiTa.stresses(word);
    phonemes = RiTa.phones(word);
    pos = RiTa.pos(word);
  } 
    
  // If deleted, remove last character from typed
  else if (key == BACKSPACE || key == DELETE) {
    if (typed.length() > 0) {
      typed = typed.substring(0, typed.length()-1);
    }
  }
    
  // If characters entered, concatenate to typed string
  else {
    typed += key; 
  }
}

// Function to get Penn Part-of-Speech Tag (https://rednoise.org/rita/reference/postags.html)
String get_tag(String part_of_speech) {
  switch(part_of_speech) {
    case "cc":
      return "Coordinating conjunction";
    case "cd": 
      return "Cardinal number";
    case "dt":
      return "Determiner";
    case "ex":
      return "Existential there";
    case "fw":
      return "Foreign word";
    case "in": 
      return "Preposition or subordinating conjunction";
    case "jj": 
      return "Adjective";
    case "jjr": 
      return "Adjective, comparative";
    case "jjs":
      return "Adjective, superlative";
    case "ls": 
      return "List item marker";
    case "md": 
      return "Modal";
    case "nn": 
      return "Noun, singular or mass";
    case "nns": 
      return "Noun, plural";
    case "nnp": 
      return "Proper noun, singular";
    case "pdt": 
      return "Predeterminer";
    case "pos": 
      return "Possessive ending";
    case "prp": 
      return "Personal pronoun";
    case "prp$": 
      return "Possessive pronoun";
    case "rb": 
      return "Adverb";
    case "rbr": 
      return "Adverb, comparative";
    case "rbs": 
      return "Adverb, superlative";
    case "rp": 
      return "Particle";
    case "sym": 
      return "Symbol";
    case "to": 
      return "to";
    case "uh": 
      return "Interjection";
    case "vb": 
      return "Verb, base form";
    case "vbd": 
      return "Verb, past tense";
    case "vbg": 
      return "Verb, gerund or present participle";
    case "vbn":
      return "Verb, past participle";
    case "vbp":
      return "Verb, non-3rd person singular present";
    case "vbz": 
      return "Verb, 3rd person singular present";
    case "wdt": 
      return "Wh-determiner";
    case "wp": 
      return "Wh-pronoun";
    case "wp$": 
      return "Possessive wh-pronoun";
    case "wrb": 
      return "Wh-adverb";
    default: 
      return "Not identified";
  }
}
