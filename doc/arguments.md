
# Introduction



## Terminology
**Sources**:

* "The UNIX Programming Environment" (1984) by Kernighan, B.W. and Pike, R. ([on Google Books](https://books.google.ch/books?id=mcO0Vh9efE0C))
* [Git CLI](https://linux.die.net/man/7/gitcli)
* [Command-line interface on Wikipedia](https://en.wikipedia.org/wiki/Command-line_interface#Arguments)
* [Stack Overflow on Arguments v Options](http://stackoverflow.com/questions/12496900/the-difference-between-arguments-and-options-pertaining-to-the-linux-shell)

### Arguments
Arguments are all the strings that follow the program name on the command line. Historically, those arguments are then made available to the executed program in a variable `argv` (C programs), `ARGV` (Ruby), `$*` (Bash), ... There are different types of arguments described in detail below.

### Positional arguments
Also called _required arguments_ are arguments that have to be specified for the proper operation of the program and if there are multiple required arguments, their order is predetermined. The number of required arguments is usually kept to a minimum to avoid having to memorize the order in which they are passed. Instead, most CLIs use more optional arguments with reasonable defaults.

### Options
Options, sometimes also called _flags_ or _switches_, are simply named on/off arguments that control some specific aspect of the program execution.

#### Short Options
Since options can only be on or off, most programs allow the use of so-called _short options_, a one letter abbreviation of the option name to represent the option. Some programs also allow to combine multiple short options into a single string of letters reduce the typing effort even more (e.g. `tar -xvf my.tar`).

#### Negating Options
While most (this is a guess) options default to being off and are turned on by specifying the option on the command line, some of them will default to being on. When an option defaults to being on, a common convention is to turn it off by prefixing the option name with a "no-" (e.g. `git diff --no-color`).

### Optional Arguments
Optional arguments are similar to options except that they can have more than just on/off values. As such, an optional argument always consists of two parts, the argument name and the argument value.

### Options with Optional Arguments
If an optional argument can also work as an option (with on/off value) or has a reasonable default value, then the value for the argument may be omitted. This is referred to as an option with an optional argument since it can function as either.



# Specification

## Syntax
* All (long) options and optional arguments start with two dash characters `--` followed immediately (no space) by the option name.
* The optional argument value is added to the option name (again no spaces) with an equals sign `=`.
* When working with values that contain spaces, make sure to follow proper escaping and/or quoting rules for your CLI.
* Short options start with only one dash instead of two.
* Multiple short options can be concatenated to a multi-option string that also starts with a single dash. Every letter in the multi-option will be interpreted as an individual option short name.
* Any option present as an argument represents the "on" state for that option (this should be reflected in the name). To disable an option, prefix the option name with `no-`.

**Option**
```
--my-option
# disabling 'my-option'
--no-my-option
```

**Short Option**
```
-m
# combining short options -m -o and -p
-mop
```

**Optional Argument**
```
--my-opt-arg=42
# string value with spaces
--my-opt-arg2="Hello World"
```

### Disambiguation
The _stop parsing options_ argument `--` indicates the end of options, every argument following this option will be treated as a positional argument. This can / has to be used for example when a positional argument _value_ happens to start with one or two dashes (which would normally be interpreted as an option).


## Global Options
These options must be supported by all commands. They provide a common API for inspecting commands.

* `--version`: Displays the name and version of the command. While the output of this command may include some descriptive information, there should be an option to reduce the output to a machine friendly version.
* `--help`: Shows usage information of the command. This should display a list of all arguments and describe their meaning and use cases.
* `--verbose`: Produces verbose output for debugging diagnosis of issues.
* `--yes`: Assume 'yes' on all actions that would normally require confirmation by the user.



# In the Context of Keen

Since `keen` is a command that runs other commands, argument handling works _slightly_ different. The first argument of the runner is always either a runner sub-command like `list`, `help`, ... or the name of the user command to run. In both cases, the argument parsing essentially starts with the _second_ argument to the runner instead of the first one. This can also be though of as having a two-part program name consisting of the runner's name and the command name separated by a space.

```
keen my:command --help
# is the same as
keen help my:command
```
