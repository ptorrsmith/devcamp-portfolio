module PagesHelper

    def twitter_parser tweet
        # use regex to match a URL (look online for example)
        # warning, URLs sometimes have a full-stop at the end, which will confuse many url regex find patterns
        # this one from Joran Hudgens Udemy example

        url_regex = %r{
            \b
            (
              (?: [a-z][\w-]+:
               (?: /{1,3} | [a-z0-9%] ) |
                www\d{0,3}[.] |
                [a-z0-9.\-]+[.][a-z]{2,4}/
              )
              (?:
               [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
              )+
              (?:
                \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
                [^\s`!()\[\]{};:'".,<>?«»“”‘’]
              )
            )
          }ix

          tweet.gsub(url_regex) do | url_match |
            "<a href=#{url_match} target='_blank'>#{url_match}</a>"
          end
        #   another way of doing blocks on a single line, no need for do / end
        #   eg.gsub(url_regex) { |url_match| "<a href=#{url_match} target='_blank'>#{url_match}</a>" }


    end


end
