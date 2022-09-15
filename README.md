# firered-various-asm
Various assembly routines and XSE script files for Pokémon FireRed made around 2016-2018

Feel free to use them in your ROM hacks and to ask questions about them, but
I'll likely not be able to answer most of them since I made these years ago
and did not document much of anything.

To build the assembly code I used to follow [this](https://www.pokecommunity.com/showthread.php?t=233645)
guide by Shiny Quagsire. After the `.bin` file is produced, you can use a hex editor
to copy and paste the assembled code into the appropriate offsets into the ROM. I know,
really stupid development environment, but that's how I used to do it.

Some of these were used in my ROM hack [Pokémon Classified](https://www.pokecommunity.com/showthread.php?t=367156)s.
See this [nice walkthrough](https://www.youtube.com/playlist?list=PLu1wU8jGH4sLcfQqY_C_tio7uVp8v-azb)!

Descriptions for files whose purposes I remember:
- `voltorb-flip/`: My "messagebox-based" implementation of the voltorb flip game from HGSS, which I believe was
                   used in the Mechania City game corner in Pokémon Classified. Because the vanilla slot machines suck.
                   I have absolutely no idea how I pieced this thing together.
- `kurapika/`: Assembly routines used for custom abilities and attacks in my unreleased "FireRed Kurapika" hack,
               see this [video](https://www.youtube.com/watch?v=DozqH6xtVh0).
- `FireRedRNGStrikesAgain.asm`: The backbone of my brutally difficult [RNG Strikes Back](https://www.pokecommunity.com/showthread.php?t=388569) ROM Hack.
                                It has lots of offsets for calls in the battle engine to the random subroutine, may
                                be useful for any ROM hacks that aspires to modify the battle engine.
- `NaturePIDGen.asm`: Can be used to allow updating a Pokémon's nature by generating a new PID that
                      preserves it's gender, shinyness, and ability. It utilizes "JPAN:s routine for figuring out the
                      substructure order of a PID", not sure where I found that. Also not sure if I made an
                      XSE script to go along with it, couldn't find anything like that.
- `BadEGG.asm`, `Shady Egg Man.rbc`:
                One of the first assembly routines I ever made, it turns a Pokémon given by one of the
                scripting variables into a bad egg by incrementing its checksum by 1. Used to great effect
                in my ROM hack [Pokémon Classified](https://www.pokecommunity.com/showthread.php?t=367156)
                where (spoilers) a thug tries to trick you into buying an "egg" that is actually a "bad" one. :P
- `LevelLimit.asm`: Has something to do with Pokémon Classified's feature that makes Pokémon disobedient if
                    you level them up without having enough badges, even for non-traded Pokémon.
- `OTLooker.asm`, `Croagunk.rbc`: Used in Pokémon Classified to set the original trainer name fo the
                                  Croagunk found in the gamma warehouse to "Looker"?
- `HiddenPowerChecker.asm`, `HPChecker.rbc`: Hidden power checker NPC from Pokémon Classified.
- `ItemEvo.asm`: Can't really remember, but I think this was used to make it possible to evolve Pokémon
                 by leveling them up holding an item? For example, Scizor would evolve by leveling it up holding a
                 metal coat?
