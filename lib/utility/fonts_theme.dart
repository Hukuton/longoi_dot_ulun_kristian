import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsTheme {
  static const List<String> myGoogleFonts = [
    "Abril Fatface",
    "Aclonica",
    "Alegreya Sans",
    "Architects Daughter",
    "Archivo",
    "Archivo Narrow",
    "Bebas Neue",
    "Bitter",
    "Bree Serif",
    "Bungee",
    "Cabin",
    "Cairo",
    "Coda",
    "Comfortaa",
    "Comic Neue",
    "Cousine",
    "Croissant One",
    "Faster One",
    "Forum",
    "Great Vibes",
    "Heebo",
    "Inconsolata",
    "Josefin Slab",
    "Lato",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mukta",
    "Nunito",
    "Offside",
    "Open Sans",
    "Oswald",
    "Overlock",
    "Pacifico",
    "Playfair Display",
    "Poppins",
    "Raleway",
    "Roboto",
    "Roboto Mono",
    "Source Sans Pro",
    "Space Mono",
    "Spicy Rice",
    "Squada One",
    "Sue Ellen Francisco",
    "Trade Winds",
    "Ubuntu",
    "Varela",
    "Vollkorn",
    "Work Sans",
    "Zilla Slab"
  ];

  static TextTheme getTextTheme(String font, TextTheme textTheme) {
    TextTheme _textTheme = GoogleFonts.robotoTextTheme(textTheme);
    switch (font) {
      case 'Abril Fatface':
        _textTheme = GoogleFonts.abrilFatfaceTextTheme(textTheme);
        break;
      case 'Aclonica':
        _textTheme = GoogleFonts.aclonicaTextTheme(textTheme);
        break;
      case 'Alegreya Sans':
        _textTheme = GoogleFonts.alegreyaSansTextTheme(textTheme);
        break;
      case 'Architects Daughter':
        _textTheme = GoogleFonts.architectsDaughterTextTheme(textTheme);
        break;
      case 'Archivo':
        _textTheme = GoogleFonts.archivoTextTheme(textTheme);
        break;
      case 'Archivo Narrow':
        _textTheme = GoogleFonts.archivoNarrowTextTheme(textTheme);
        break;
      case 'Bebas Neue':
        _textTheme = GoogleFonts.bebasNeueTextTheme(textTheme);
        break;
      case 'Bitter':
        _textTheme = GoogleFonts.bitterTextTheme(textTheme);
        break;
      case 'Bree Serif':
        _textTheme = GoogleFonts.breeSerifTextTheme(textTheme);
        break;
      case 'Bungee':
        _textTheme = GoogleFonts.bungeeTextTheme(textTheme);
        break;
      case 'Cabin':
        _textTheme = GoogleFonts.cabinTextTheme(textTheme);
        break;
      case 'Cairo':
        _textTheme = GoogleFonts.cairoTextTheme(textTheme);
        break;
      case 'Coda':
        _textTheme = GoogleFonts.codaTextTheme(textTheme);
        break;
      case 'Comfortaa':
        _textTheme = GoogleFonts.comfortaaTextTheme(textTheme);
        break;
      case 'Comic Neue':
        _textTheme = GoogleFonts.comicNeueTextTheme(textTheme);
        break;
      case 'Cousine':
        _textTheme = GoogleFonts.cousineTextTheme(textTheme);
        break;
      case 'Croissant One':
        _textTheme = GoogleFonts.croissantOneTextTheme(textTheme);
        break;
      case 'Faster One':
        _textTheme = GoogleFonts.fasterOneTextTheme(textTheme);
        break;
      case 'Forum':
        _textTheme = GoogleFonts.forumTextTheme(textTheme);
        break;
      case 'Great Vibes':
        _textTheme = GoogleFonts.greatVibesTextTheme(textTheme);
        break;
      case 'Heebo':
        _textTheme = GoogleFonts.heeboTextTheme(textTheme);
        break;
      case 'Inconsolata':
        _textTheme = GoogleFonts.inconsolataTextTheme(textTheme);
        break;
      case 'Josefin Slab':
        _textTheme = GoogleFonts.josefinSlabTextTheme(textTheme);
        break;
      case 'Lato':
        _textTheme = GoogleFonts.latoTextTheme(textTheme);
        break;
      case 'Libre Baskerville':
        _textTheme = GoogleFonts.libreBaskervilleTextTheme(textTheme);
        break;
      case 'Lobster':
        _textTheme = GoogleFonts.lobsterTextTheme(textTheme);
        break;
      case 'Lora':
        _textTheme = GoogleFonts.loraTextTheme(textTheme);
        break;
      case 'Merriweather':
        _textTheme = GoogleFonts.merriweatherTextTheme(textTheme);
        break;
      case 'Montserrat':
        _textTheme = GoogleFonts.montserratTextTheme(textTheme);
        break;
      case 'Mukta':
        _textTheme = GoogleFonts.muktaTextTheme(textTheme);
        break;
      case 'Nunito':
        _textTheme = GoogleFonts.nunitoTextTheme(textTheme);
        break;
      case 'Offside':
        _textTheme = GoogleFonts.offsideTextTheme(textTheme);
        break;
      case 'Open Sans':
        _textTheme = GoogleFonts.openSansTextTheme(textTheme);
        break;
      case 'Oswald':
        _textTheme = GoogleFonts.oswaldTextTheme(textTheme);
        break;
      case 'Overlock':
        _textTheme = GoogleFonts.overlockTextTheme(textTheme);
        break;
      case 'Pacifico':
        _textTheme = GoogleFonts.pacificoTextTheme(textTheme);
        break;
      case 'Playfair Display':
        _textTheme = GoogleFonts.playfairDisplayTextTheme(textTheme);
        break;
      case 'Poppins':
        _textTheme = GoogleFonts.poppinsTextTheme(textTheme);
        break;
      case 'Raleway':
        _textTheme = GoogleFonts.ralewayTextTheme(textTheme);
        break;
      case 'Roboto':
        _textTheme = GoogleFonts.robotoTextTheme(textTheme);
        break;
      case 'Roboto Mono':
        _textTheme = GoogleFonts.robotoMonoTextTheme(textTheme);
        break;
      case 'Source Sans Pro':
        _textTheme = GoogleFonts.sourceSansProTextTheme(textTheme);
        break;
      case 'Space Mono':
        _textTheme = GoogleFonts.spaceMonoTextTheme(textTheme);
        break;
      case 'Spicy Rice':
        _textTheme = GoogleFonts.spicyRiceTextTheme(textTheme);
        break;
      case 'Squada One':
        _textTheme = GoogleFonts.squadaOneTextTheme(textTheme);
        break;
      case 'Sue Ellen Francisco':
        _textTheme = GoogleFonts.sueEllenFranciscoTextTheme(textTheme);
        break;
      case 'Trade Winds':
        _textTheme = GoogleFonts.tradeWindsTextTheme(textTheme);
        break;
      case 'Ubuntu':
        _textTheme = GoogleFonts.ubuntuTextTheme(textTheme);
        break;
      case 'Varela':
        _textTheme = GoogleFonts.varelaTextTheme(textTheme);
        break;
      case 'Vollkorn':
        _textTheme = GoogleFonts.vollkornTextTheme(textTheme);
        break;
      case 'Work Sans':
        _textTheme = GoogleFonts.workSansTextTheme(textTheme);
        break;
      case 'Zilla Slab':
        _textTheme = GoogleFonts.zillaSlabTextTheme(textTheme);
        break;
    }
    return _textTheme;
  }
}
