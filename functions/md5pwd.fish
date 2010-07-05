function md5pwd
         switch (uname)
                case Linux
                     pwd | md5sum --text -
                case Darwin
                     pwd | md5 -q -s
         end
end
