[![Build Status](https://travis-ci.org/katoy/ruby-book-codes.svg?branch=master)](https://travis-ci.org/katoy/ruby-book-codes)
[![Dependency Status](https://gemnasium.com/katoy/ruby-book-codes.svg)](https://gemnasium.com/katoy/ruby-book-codes)
[![Coverage Status](https://coveralls.io/repos/katoy/ruby-book-codes/badge.png)](https://coveralls.io/r/katoy/ruby-book-codes)
[![Inline docs](http://inch-ci.org/github/katoy/ruby-book-codes.svg?branch=master)](http://inch-ci.org/github/katoy/ruby-book-codes)

See
- https://qiita.com/jnchito/items/60ea1389d00e72b729e7
  【動画付き】「プロを目指す人のためのRuby入門」のテストコードをRSpecに書き換える・その1

- https://github.com/katoy?utf8=%E2%9C%93&tab=repositories&q=rspec&type=&language=
  rspec の練習レポジトリー

## 実行方法

    $ rspec
    $ rspec spec/lib/fizz_buzz_01_spec.rb
    $ rspec spec/lib/fizz_buzz_01_spec.rb:10
    $ rspec spec/lib/fizz_buzz_01_spec.rb -P "arg_1"

    $ rspec -f d
    $ rspec -f p
    $ rspec --order rand
    $ rspec --seed 62490

    $ rspec -r pry

## カバレッジ

    $ rm -fr Coverage
    $ rspec
    $ open coverage/index.html

## github での実行

- Build

- CircleCI

- Coverage

## 静的チェック

- rubocop

- metrics_fu

    $ metric_fu --no-flog --no-roodi

- brakeman

## ドキュメンテーション

- plantuml

- blueprint

## リバース・エンジニアリング

- schemaspy

## トピック

- mock

- selenium

- OWASP ZAP

- Gatling
