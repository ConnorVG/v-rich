vRich
=====

Set 'Run LÖVE' as your build system and then proceed to build the project. There is nothing cool here yet, just messing around - no optimisation / efficiency either.

We need a system were everything is rendered as a simple rectangle. Each rectangle would have an anchor (the point of rotation). I believe this will be the simplest to manage and most efficient to process.

```
     A = Anchor
     # = Boundry

          # # #
          #   #
          #   #
          # A #
          # # #

# # # # #       # # # # #
#     A #       # A     #
# # # # #       # # # # #

          # # #
          # A #
          #   #
          #   #
          # # #
```
