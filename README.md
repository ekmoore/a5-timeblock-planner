# Generate Time-Block Planner Pages

This is a fork of [drewish's planner](https://github.com/drewish/planner), taking elements of [pzula's fork](https://github.com/pzula/planner) which is based off of [jlorenzetti](https://github.com/jlorenzetti/planner)'s but scales it down to A5.

My changes:
- A5 sizing
- Changed default hours

Quick
- `planner.rb` generates planner pages based on [Cal Newport's Time-Block Planner](https://www.timeblockplanner.com) layout.
- `one-on-one.rb` generates templates based on [Manager Tools' 1-on-1s](https://www.manager-tools.com/map-universe/one-ones). You specify which people you meet every week, and you'll get a page for each.

Take a look at a [sample](sample.pdf) and see what you think. If you don't like it, go to the [source repo]([drewish's planner](https://github.com/drewish/planner)) and look at some of the forks [drewish](https://github.com/drewish/) highlights.


## Installation

Assuming you've got [Ruby](http://www.ruby-lang.org/en/) and [Bundler](https://bundler.io)
installed you can just run:
```
git clone git@github.com:ekmoore/planner.git
cd planner
bundle install
```

## Usage

You can generate planner pages for the current week:
```
./planner.rb
```

Or, you can generate a different week's pages by passing in the date:
```
./planner.rb 2022-05-27
```

On a Mac you can send the PDF directly to your printer:
```
lpr time_block_pages.pdf
```

The script that generates the 1-on-1 forms works similarly:
```
./one-on-one.rb
```

Similarly, you can choose a week:
```
./one-on-one.rb 2022-05-27
```

## Limitations

Probably only works on a Mac since it hardcodes the font path.
