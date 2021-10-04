# IIC3745 Project A

## Setup

To start the project you should have bundler installed and run:

```
bin/setup
```

To run tests and coverage:
```
rake test
```

To run rubocop:
```
rake rubocop
```

## Conventions

### Commits

Commits can have one of the following types:

| type | description |
|---|---|
| feat | new functionality |
| fix | fixes old functionality |
| lint | fixes rubocop offenses |
| test | test related changes |
| doc | documentation related changes |

Commits should start with the corresponding type, followed by other explanation. For example:

```
feat(user-payment): add payment method
```

### Pull requests

This repo includes a PR template that you may follow

### References

* [kfrn (2017) minesweeper-ruby](https://github.com/kfrn/minesweeper-ruby)
* [Coding Train (2019) minesweeper on P5](https://github.com/CodingTrain/website/blob/main/CodingChallenges/CC_071_minesweeper/P5/)
