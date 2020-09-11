

## gettext-runtime/src

### envsubst
```
Usage: envsubst [OPTION] [SHELL-FORMAT]

Substitutes the values of environment variables.

Operation mode:
  -v, --variables             output the variables occurring in SHELL-FORMAT

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

In normal operation mode, standard input is copied to standard output,
with references to environment variables of the form $VARIABLE or ${VARIABLE}
being replaced with the corresponding values.  If a SHELL-FORMAT is given,
only those environment variables that are referenced in SHELL-FORMAT are
substituted; otherwise all environment variables references occurring in
standard input are substituted.

When --variables is used, standard input is ignored, and the output consists
of the environment variables that are referenced in SHELL-FORMAT, one per line.

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```
### gettext
```
Usage: gettext [OPTION] [[TEXTDOMAIN] MSGID]
or:    gettext [OPTION] -s [MSGID]...

Display native language translation of a textual message.

  -d, --domain=TEXTDOMAIN   retrieve translated messages from TEXTDOMAIN
  -c, --context=CONTEXT     specify context for MSGID
  -e                        enable expansion of some escape sequences
  -n                        suppress trailing newline
  -E                        (ignored for compatibility)
  [TEXTDOMAIN] MSGID        retrieve translated message corresponding
                            to MSGID from TEXTDOMAIN

Informative output:
  -h, --help                display this help and exit
  -V, --version             display version information and exit

If the TEXTDOMAIN parameter is not given, the domain is determined from the
environment variable TEXTDOMAIN.  If the message catalog is not found in the
regular directory, another location can be specified with the environment
variable TEXTDOMAINDIR.
When used with the -s option the program behaves like the 'echo' command.
But it does not simply copy its arguments to stdout.  Instead those messages
found in the selected catalog are translated.
Standard search directory: /tools/share/locale

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### gettext.sh
```
GNU gettext shell script function library version 0.20.1
Usage: . gettext.sh
```

### ngettext
```
Usage: ngettext [OPTION] [TEXTDOMAIN] MSGID MSGID-PLURAL COUNT

Display native language translation of a textual message whose grammatical
form depends on a number.

  -d, --domain=TEXTDOMAIN   retrieve translated message from TEXTDOMAIN
  -c, --context=CONTEXT     specify context for MSGID
  -e                        enable expansion of some escape sequences
  -E                        (ignored for compatibility)
  [TEXTDOMAIN]              retrieve translated message from TEXTDOMAIN
  MSGID MSGID-PLURAL        translate MSGID (singular) / MSGID-PLURAL (plural)
  COUNT                     choose singular/plural form based on this value

Informative output:
  -h, --help                display this help and exit
  -V, --version             display version information and exit

If the TEXTDOMAIN parameter is not given, the domain is determined from the
environment variable TEXTDOMAIN.  If the message catalog is not found in the
regular directory, another location can be specified with the environment
variable TEXTDOMAINDIR.
Standard search directory: /tools/share/locale

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

## gettext-tools/src

### cldr-plurals
```
Usage: cldr-plurals [OPTION...] [LOCALE RULES]...

Extract or convert Unicode CLDR plural rules.

If both LOCALE and RULES are specified, it reads CLDR plural rules for
LOCALE from RULES and print them in a form suitable for gettext use.
If no argument is given, it reads CLDR plural rules from the standard input.

Mandatory arguments to long options are mandatory for short options too.
Similarly for optional arguments.

  -c, --cldr                  print plural rules in the CLDR format
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### hostname
```
Usage: hostname [OPTION]

Print the machine's hostname.

Output format:
  -s, --short                 short host name
  -f, --fqdn, --long          long host name, includes fully qualified domain
                                name, and aliases
  -i, --ip-address            addresses for the hostname

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgattrib
```
Usage: msgattrib [OPTION] [INPUTFILE]

Filters the messages of a translation catalog according to their attributes,
and manipulates the attributes.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE                   input PO file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If no input file is given or if it is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Message selection:
      --translated            keep translated, remove untranslated messages
      --untranslated          keep untranslated, remove translated messages
      --no-fuzzy              remove 'fuzzy' marked messages
      --only-fuzzy            keep 'fuzzy' marked messages
      --no-obsolete           remove obsolete #~ messages
      --only-obsolete         keep obsolete #~ messages

Attribute manipulation:
      --set-fuzzy             set all messages 'fuzzy'
      --clear-fuzzy           set all messages non-'fuzzy'
      --set-obsolete          set all messages obsolete
      --clear-obsolete        set all messages non-obsolete
      --previous              when setting 'fuzzy', keep previous msgids
                              of translated messages.
      --clear-previous        remove the "previous msgid" from all messages
      --empty                 when removing 'fuzzy', also set msgstr empty
      --only-file=FILE.po     manipulate only entries listed in FILE.po
      --ignore-file=FILE.po   manipulate only entries not listed in FILE.po
      --fuzzy                 synonym for --only-fuzzy --clear-fuzzy
      --obsolete              synonym for --only-obsolete --clear-obsolete

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                write the .po file using indented style
      --no-location           do not write '#: filename:line' lines
  -n, --add-location          generate '#: filename:line' lines (default)
      --strict                write out strict Uniforum conforming .po file
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgcat
```
Usage: msgcat [OPTION] [INPUTFILE]...

Concatenates and merges the specified PO files.
Find messages which are common to two or more of the specified PO files.
By using the --more-than option, greater commonality may be requested
before messages are printed.  Conversely, the --less-than option may be
used to specify less commonality before messages are printed (i.e.
--less-than=2 will only print the unique messages).  Translations,
comments, extracted comments, and file positions will be cumulated, except
that if --use-first is specified, they will be taken from the first PO file
to define them.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE ...               input files
  -f, --files-from=FILE       get list of input files from FILE
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If input file is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Message selection:
  -<, --less-than=NUMBER      print messages with less than this many
                              definitions, defaults to infinite if not set
  ->, --more-than=NUMBER      print messages with more than this many
                              definitions, defaults to 0 if not set
  -u, --unique                shorthand for --less-than=2, requests
                              that only unique messages be printed

Input file syntax:
  -P, --properties-input      input files are in Java .properties syntax
      --stringtable-input     input files are in NeXTstep/GNUstep .strings
                              syntax

Output details:
  -t, --to-code=NAME          encoding for output
      --use-first             use first available translation for each
                              message, don't merge several translations
      --lang=CATALOGNAME      set 'Language' field in the header entry
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                write the .po file using indented style
      --no-location           do not write '#: filename:line' lines
  -n, --add-location          generate '#: filename:line' lines (default)
      --strict                write out strict Uniforum conforming .po file
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgcmp
```
Usage: msgcmp [OPTION] def.po ref.pot

Compare two Uniforum style .po files to check that both contain the same
set of msgid strings.  The def.po file is an existing PO file with the
translations.  The ref.pot file is the last created PO file, or a PO Template
file (generally created by xgettext).  This is useful for checking that
you have translated each and every message in your program.  Where an exact
match cannot be found, fuzzy matching is used to produce better diagnostics.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  def.po                      translations
  ref.pot                     references to the sources
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search

Operation modifiers:
  -m, --multi-domain          apply ref.pot to each of the domains in def.po
  -N, --no-fuzzy-matching     do not use fuzzy matching
      --use-fuzzy             consider fuzzy entries
      --use-untranslated      consider untranslated entries

Input file syntax:
  -P, --properties-input      input files are in Java .properties syntax
      --stringtable-input     input files are in NeXTstep/GNUstep .strings
                              syntax

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgcomm
```
Usage: msgcomm [OPTION] [INPUTFILE]...

Find messages which are common to two or more of the specified PO files.
By using the --more-than option, greater commonality may be requested
before messages are printed.  Conversely, the --less-than option may be
used to specify less commonality before messages are printed (i.e.
--less-than=2 will only print the unique messages).  Translations,
comments and extracted comments will be preserved, but only from the first
PO file to define them.  File positions from all PO files will be
cumulated.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE ...               input files
  -f, --files-from=FILE       get list of input files from FILE
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If input file is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Message selection:
  -<, --less-than=NUMBER      print messages with less than this many
                              definitions, defaults to infinite if not set
  ->, --more-than=NUMBER      print messages with more than this many
                              definitions, defaults to 1 if not set
  -u, --unique                shorthand for --less-than=2, requests
                              that only unique messages be printed

Input file syntax:
  -P, --properties-input      input files are in Java .properties syntax
      --stringtable-input     input files are in NeXTstep/GNUstep .strings
                              syntax

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                write the .po file using indented style
      --no-location           do not write '#: filename:line' lines
  -n, --add-location          generate '#: filename:line' lines (default)
      --strict                write out strict Uniforum conforming .po file
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location
      --omit-header           don't write header with 'msgid ""' entry

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgconv
```
Usage: msgconv [OPTION] [INPUTFILE]

Converts a translation catalog to a different character encoding.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE                   input PO file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If no input file is given or if it is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Conversion target:
  -t, --to-code=NAME          encoding for output
The default encoding is the current locale's encoding.

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                indented output style
      --no-location           suppress '#: filename:line' lines
  -n, --add-location          preserve '#: filename:line' lines (default)
      --strict                strict Uniforum output style
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgen
```
Usage: msgen [OPTION] INPUTFILE

Creates an English translation catalog.  The input file is the last
created English PO file, or a PO Template file (generally created by
xgettext).  Untranslated entries are assigned a translation that is
identical to the msgid.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE                   input PO or POT file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If input file is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
      --lang=CATALOGNAME      set 'Language' field in the header entry
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                indented output style
      --no-location           suppress '#: filename:line' lines
  -n, --add-location          preserve '#: filename:line' lines (default)
      --strict                strict Uniforum output style
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgexec
```
Usage: msgexec [OPTION] COMMAND [COMMAND-OPTION]

Applies a command to all translations of a translation catalog.
The COMMAND can be any program that reads a translation from standard
input.  It is invoked once for each translation.  Its output becomes
msgexec's output.  msgexec's return code is the maximum return code
across all invocations.

A special builtin command called '0' outputs the translation, followed by a
null byte.  The output of "msgexec 0" is suitable as input for "xargs -0".

Command input:
  --newline                   add newline at the end of input

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  -i, --input=INPUTFILE       input PO file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If no input file is given or if it is -, standard input is read.

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgfilter
```
Usage: msgfilter [OPTION] FILTER [FILTER-OPTION]

Applies a filter to all translations of a translation catalog.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  -i, --input=INPUTFILE       input PO file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If no input file is given or if it is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

The FILTER can be any program that reads a translation from standard input
and writes a modified translation to standard output.

Filter input and output:
  --newline                   add a newline at the end of input and
                                remove a newline from the end of output
Useful FILTER-OPTIONs when the FILTER is 'sed':
  -e, --expression=SCRIPT     add SCRIPT to the commands to be executed
  -f, --file=SCRIPTFILE       add the contents of SCRIPTFILE to the commands
                                to be executed
  -n, --quiet, --silent       suppress automatic printing of pattern space

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
      --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
      --indent                indented output style
      --keep-header           keep header entry unmodified, don't filter it
      --no-location           suppress '#: filename:line' lines
  -n, --add-location          preserve '#: filename:line' lines (default)
      --strict                strict Uniforum output style
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgfmt
```
Usage: msgfmt [OPTION] filename.po ...

Generate binary message catalog from textual translation description.

Mandatory arguments to long options are mandatory for short options too.
Similarly for optional arguments.

Input file location:
  filename.po ...             input files
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If input file is -, standard input is read.

Operation mode:
  -j, --java                  Java mode: generate a Java ResourceBundle class
      --java2                 like --java, and assume Java2 (JDK 1.2 or higher)
      --csharp                C# mode: generate a .NET .dll file
      --csharp-resources      C# resources mode: generate a .NET .resources file
      --tcl                   Tcl mode: generate a tcl/msgcat .msg file
      --qt                    Qt mode: generate a Qt .qm file
      --desktop               Desktop Entry mode: generate a .desktop file
      --xml                   XML mode: generate XML file

Output file location:
  -o, --output-file=FILE      write output to specified file
      --strict                enable strict Uniforum mode
If output file is -, output is written to standard output.

Output file location in Java mode:
  -r, --resource=RESOURCE     resource name
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
      --source                produce a .java file, instead of a .class file
  -d DIRECTORY                base directory of classes directory hierarchy
The class name is determined by appending the locale name to the resource name,
separated with an underscore.  The -d option is mandatory.  The class is
written under the specified directory.

Output file location in C# mode:
  -r, --resource=RESOURCE     resource name
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
  -d DIRECTORY                base directory for locale dependent .dll files
The -l and -d options are mandatory.  The .dll file is written in a
subdirectory of the specified directory whose name depends on the locale.

Output file location in Tcl mode:
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
  -d DIRECTORY                base directory of .msg message catalogs
The -l and -d options are mandatory.  The .msg file is written in the
specified directory.

Desktop Entry mode options:
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
  -o, --output-file=FILE      write output to specified file
  --template=TEMPLATE         a .desktop file used as a template
  -d DIRECTORY                base directory of .po files
  -kWORD, --keyword=WORD      look for WORD as an additional keyword
  -k, --keyword               do not to use default keywords
The -l, -o, and --template options are mandatory.  If -D is specified, input
files are read from the directory instead of the command line arguments.

XML mode options:
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
  -L, --language=NAME         recognise the specified XML language
  -o, --output-file=FILE      write output to specified file
  --template=TEMPLATE         an XML file used as a template
  -d DIRECTORY                base directory of .po files
The -l, -o, and --template options are mandatory.  If -D is specified, input
files are read from the directory instead of the command line arguments.

Input file syntax:
  -P, --properties-input      input files are in Java .properties syntax
      --stringtable-input     input files are in NeXTstep/GNUstep .strings
                              syntax

Input file interpretation:
  -c, --check                 perform all the checks implied by
                                --check-format, --check-header, --check-domain
      --check-format          check language dependent format strings
      --check-header          verify presence and contents of the header entry
      --check-domain          check for conflicts between domain directives
                                and the --output-file option
  -C, --check-compatibility   check that GNU msgfmt behaves like X/Open msgfmt
      --check-accelerators[=CHAR]  check presence of keyboard accelerators for
                                menu items
  -f, --use-fuzzy             use fuzzy entries in output

Output details:
  -a, --alignment=NUMBER      align strings to NUMBER bytes (default: 1)
      --endianness=BYTEORDER  write out 32-bit numbers in the given byte order
                                (big or little, default depends on platform)
      --no-hash               binary file will not include the hash table

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit
      --statistics            print statistics about translations
  -v, --verbose               increase verbosity level

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msggrep
```
Usage: msggrep [OPTION] [INPUTFILE]

Extracts all messages of a translation catalog that match a given pattern
or belong to some given source files.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE                   input PO file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If no input file is given or if it is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Message selection:
  [-N SOURCEFILE]... [-M DOMAINNAME]...
  [-J MSGCTXT-PATTERN] [-K MSGID-PATTERN] [-T MSGSTR-PATTERN]
  [-C COMMENT-PATTERN] [-X EXTRACTED-COMMENT-PATTERN]
A message is selected if it comes from one of the specified source files,
or if it comes from one of the specified domains,
or if -J is given and its context (msgctxt) matches MSGCTXT-PATTERN,
or if -K is given and its key (msgid or msgid_plural) matches MSGID-PATTERN,
or if -T is given and its translation (msgstr) matches MSGSTR-PATTERN,
or if -C is given and the translator's comment matches COMMENT-PATTERN,
or if -X is given and the extracted comment matches EXTRACTED-COMMENT-PATTERN.

When more than one selection criterion is specified, the set of selected
messages is the union of the selected messages of each criterion.

MSGCTXT-PATTERN or MSGID-PATTERN or MSGSTR-PATTERN or COMMENT-PATTERN or
EXTRACTED-COMMENT-PATTERN syntax:
  [-E | -F] [-e PATTERN | -f FILE]...
PATTERNs are basic regular expressions by default, or extended regular
expressions if -E is given, or fixed strings if -F is given.

  -N, --location=SOURCEFILE   select messages extracted from SOURCEFILE
  -M, --domain=DOMAINNAME     select messages belonging to domain DOMAINNAME
  -J, --msgctxt               start of patterns for the msgctxt
  -K, --msgid                 start of patterns for the msgid
  -T, --msgstr                start of patterns for the msgstr
  -C, --comment               start of patterns for the translator's comment
  -X, --extracted-comment     start of patterns for the extracted comment
  -E, --extended-regexp       PATTERN is an extended regular expression
  -F, --fixed-strings         PATTERN is a set of newline-separated strings
  -e, --regexp=PATTERN        use PATTERN as a regular expression
  -f, --file=FILE             obtain PATTERN from FILE
  -i, --ignore-case           ignore case distinctions
  -v, --invert-match          output only the messages that do not match any
                              selection criterion

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
      --no-escape             do not use C escapes in output (default)
      --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
      --indent                indented output style
      --no-location           suppress '#: filename:line' lines
  -n, --add-location          preserve '#: filename:line' lines (default)
      --strict                strict Uniforum output style
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
      --sort-output           generate sorted output
      --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msginit
```
Usage: msginit [OPTION]

Creates a new PO file, initializing the meta information with values from the
user's environment.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  -i, --input=INPUTFILE       input POT file
If no input file is given, the current directory is searched for the POT file.
If it is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified PO file
If no output file is given, it depends on the --locale option or the user's
locale setting.  If it is -, the results are written to standard output.

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
  -l, --locale=LL_CC[.ENCODING]  set target locale
      --no-translator         assume the PO file is automatically generated
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgmerge
```
Usage: msgmerge [OPTION] def.po ref.pot

Merges two Uniforum style .po files together.  The def.po file is an
existing PO file with translations which will be taken over to the newly
created file as long as they still match; comments will be preserved,
but extracted comments and file positions will be discarded.  The ref.pot
file is the last created PO file with up-to-date source references but
old translations, or a PO Template file (generally created by xgettext);
any translations or comments in the file will be discarded, however dot
comments and file positions will be preserved.  Where an exact match
cannot be found, fuzzy matching is used to produce better results.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  def.po                      translations referring to old sources
  ref.pot                     references to new sources
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
  -C, --compendium=FILE       additional library of message translations,
                              may be specified more than once

Operation mode:
  -U, --update                update def.po,
                              do nothing if def.po already up to date

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Output file location in update mode:
The result is written back to def.po.
      --backup=CONTROL        make a backup of def.po
      --suffix=SUFFIX         override the usual backup suffix
The version control method may be selected via the --backup option or through
the VERSION_CONTROL environment variable.  Here are the values:
  none, off       never make backups (even if --backup is given)
  numbered, t     make numbered backups
  existing, nil   numbered if numbered backups exist, simple otherwise
  simple, never   always make simple backups
The backup suffix is '~', unless set with --suffix or the SIMPLE_BACKUP_SUFFIX
environment variable.

Operation modifiers:
  -m, --multi-domain          apply ref.pot to each of the domains in def.po
      --for-msgfmt            produce output for 'msgfmt', not for a translator
  -N, --no-fuzzy-matching     do not use fuzzy matching
      --previous              keep previous msgids of translated messages

Input file syntax:
  -P, --properties-input      input files are in Java .properties syntax
      --stringtable-input     input files are in NeXTstep/GNUstep .strings
                              syntax

Output details:
      --lang=CATALOGNAME      set 'Language' field in the header entry
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                indented output style
      --no-location           suppress '#: filename:line' lines
  -n, --add-location          preserve '#: filename:line' lines (default)
      --strict                strict Uniforum output style
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit
  -v, --verbose               increase verbosity level
  -q, --quiet, --silent       suppress progress indicators

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msgunfmt
```
Usage: msgunfmt [OPTION] [FILE]...

Convert binary message catalog to Uniforum style .po file.

Mandatory arguments to long options are mandatory for short options too.

Operation mode:
  -j, --java                  Java mode: input is a Java ResourceBundle class
      --csharp                C# mode: input is a .NET .dll file
      --csharp-resources      C# resources mode: input is a .NET .resources file
      --tcl                   Tcl mode: input is a tcl/msgcat .msg file

Input file location:
  FILE ...                    input .mo files
If no input file is given or if it is -, standard input is read.

Input file location in Java mode:
  -r, --resource=RESOURCE     resource name
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
The class name is determined by appending the locale name to the resource name,
separated with an underscore.  The class is located using the CLASSPATH.

Input file location in C# mode:
  -r, --resource=RESOURCE     resource name
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
  -d DIRECTORY                base directory for locale dependent .dll files
The -l and -d options are mandatory.  The .dll file is located in a
subdirectory of the specified directory whose name depends on the locale.

Input file location in Tcl mode:
  -l, --locale=LOCALE         locale name, either language or language_COUNTRY
  -d DIRECTORY                base directory of .msg message catalogs
The -l and -d options are mandatory.  The .msg file is located in the
specified directory.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                write indented output style
      --strict                write strict uniforum style
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit
  -v, --verbose               increase verbosity level

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### msguniq
```
Usage: msguniq [OPTION] [INPUTFILE]

Unifies duplicate translations in a translation catalog.
Finds duplicate translations of the same message ID.  Such duplicates are
invalid input for other programs like msgfmt, msgmerge or msgcat.  By
default, duplicates are merged together.  When using the --repeated option,
only duplicates are output, and all other messages are discarded.  Comments
and extracted comments will be cumulated, except that if --use-first is
specified, they will be taken from the first translation.  File positions
will be cumulated.  When using the --unique option, duplicates are discarded.

Mandatory arguments to long options are mandatory for short options too.

Input file location:
  INPUTFILE                   input PO file
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If no input file is given or if it is -, standard input is read.

Output file location:
  -o, --output-file=FILE      write output to specified file
The results are written to standard output if no output file is specified
or if it is -.

Message selection:
  -d, --repeated              print only duplicates
  -u, --unique                print only unique messages, discard duplicates

Input file syntax:
  -P, --properties-input      input file is in Java .properties syntax
      --stringtable-input     input file is in NeXTstep/GNUstep .strings syntax

Output details:
  -t, --to-code=NAME          encoding for output
      --use-first             use first available translation for each
                              message, don't merge several translations
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                write the .po file using indented style
      --no-location           do not write '#: filename:line' lines
  -n, --add-location          generate '#: filename:line' lines (default)
      --strict                write out strict Uniforum conforming .po file
  -p, --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### recode-sr-latin
```
Usage: recode-sr-latin [OPTION]

Recode Serbian text from Cyrillic to Latin script.
The input text is read from standard input.  The converted text is output to
standard output.

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### urlget
```
Usage: urlget [OPTION] URL FILE

Fetches and outputs the contents of an URL.  If the URL cannot be accessed,
the locally accessible FILE is used instead.

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit
  -q, --quiet, --silent       suppress progress indicators

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```

### xgettext
```
Usage: xgettext [OPTION] [INPUTFILE]...

Extract translatable strings from given input files.

Mandatory arguments to long options are mandatory for short options too.
Similarly for optional arguments.

Input file location:
  INPUTFILE ...               input files
  -f, --files-from=FILE       get list of input files from FILE
  -D, --directory=DIRECTORY   add DIRECTORY to list for input files search
If input file is -, standard input is read.

Output file location:
  -d, --default-domain=NAME   use NAME.po for output (instead of messages.po)
  -o, --output=FILE           write output to specified file
  -p, --output-dir=DIR        output files will be placed in directory DIR
If output file is -, output is written to standard output.

Choice of input file language:
  -L, --language=NAME         recognise the specified language
                                (C, C++, ObjectiveC, PO, Shell, Python, Lisp,
                                EmacsLisp, librep, Scheme, Smalltalk, Java,
                                JavaProperties, C#, awk, YCP, Tcl, Perl, PHP,
                                GCC-source, NXStringTable, RST, RSJ, Glade,
                                Lua, JavaScript, Vala, Desktop)
  -C, --c++                   shorthand for --language=C++
By default the language is guessed depending on the input file name extension.

Input file interpretation:
      --from-code=NAME        encoding of input files
                                (except for Python, Tcl, Glade)
By default the input files are assumed to be in ASCII.

Operation mode:
  -j, --join-existing         join messages with existing file
  -x, --exclude-file=FILE.po  entries from FILE.po are not extracted
  -cTAG, --add-comments=TAG   place comment blocks starting with TAG and
                                preceding keyword lines in output file
  -c, --add-comments          place all comment blocks preceding keyword lines
                                in output file
      --check=NAME            perform syntax check on messages
                                (ellipsis-unicode, space-ellipsis,
                                 quote-unicode, bullet-unicode)
      --sentence-end=TYPE     type describing the end of sentence
                                (single-space, which is the default, 
                                 or double-space)

Language specific options:
  -a, --extract-all           extract all strings
                                (only languages C, C++, ObjectiveC, Shell,
                                Python, Lisp, EmacsLisp, librep, Scheme, Java,
                                C#, awk, Tcl, Perl, PHP, GCC-source, Glade,
                                Lua, JavaScript, Vala)
  -kWORD, --keyword=WORD      look for WORD as an additional keyword
  -k, --keyword               do not to use default keywords
                                (only languages C, C++, ObjectiveC, Shell,
                                Python, Lisp, EmacsLisp, librep, Scheme, Java,
                                C#, awk, Tcl, Perl, PHP, GCC-source, Glade,
                                Lua, JavaScript, Vala, Desktop)
      --flag=WORD:ARG:FLAG    additional flag for strings inside the argument
                              number ARG of keyword WORD
                                (only languages C, C++, ObjectiveC, Shell,
                                Python, Lisp, EmacsLisp, librep, Scheme, Java,
                                C#, awk, YCP, Tcl, Perl, PHP, GCC-source,
                                Lua, JavaScript, Vala)
  -T, --trigraphs             understand ANSI C trigraphs for input
                                (only languages C, C++, ObjectiveC)
      --its=FILE              apply ITS rules from FILE
                                (only XML based languages)
      --qt                    recognize Qt format strings
                                (only language C++)
      --kde                   recognize KDE 4 format strings
                                (only language C++)
      --boost                 recognize Boost format strings
                                (only language C++)
      --debug                 more detailed formatstring recognition result

Output details:
      --color                 use colors and other text attributes always
      --color=WHEN            use colors and other text attributes if WHEN.
                              WHEN may be 'always', 'never', 'auto', or 'html'.
      --style=STYLEFILE       specify CSS style rule file for --color
  -e, --no-escape             do not use C escapes in output (default)
  -E, --escape                use C escapes in output, no extended chars
      --force-po              write PO file even if empty
  -i, --indent                write the .po file using indented style
      --no-location           do not write '#: filename:line' lines
  -n, --add-location          generate '#: filename:line' lines (default)
      --strict                write out strict Uniforum conforming .po file
      --properties-output     write out a Java .properties file
      --stringtable-output    write out a NeXTstep/GNUstep .strings file
      --itstool               write out itstool comments
  -w, --width=NUMBER          set output page width
      --no-wrap               do not break long message lines, longer than
                              the output page width, into several lines
  -s, --sort-output           generate sorted output
  -F, --sort-by-file          sort output by file location
      --omit-header           don't write header with 'msgid ""' entry
      --copyright-holder=STRING  set copyright holder in output
      --foreign-user          omit FSF copyright in output for foreign user
      --package-name=PACKAGE  set package name in output
      --package-version=VERSION  set package version in output
      --msgid-bugs-address=EMAIL@ADDRESS  set report address for msgid bugs
  -m[STRING], --msgstr-prefix[=STRING]  use STRING or "" as prefix for msgstr
                                values
  -M[STRING], --msgstr-suffix[=STRING]  use STRING or "" as suffix for msgstr
                                values

Informative output:
  -h, --help                  display this help and exit
  -V, --version               output version information and exit

Report bugs in the bug tracker at <https://savannah.gnu.org/projects/gettext>
or by email to <bug-gettext@gnu.org>.
```
