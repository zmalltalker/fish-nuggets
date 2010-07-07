function md5pwd
         switch (uname)
                case Linux
                     pwd | md5sum --text -
                case Darwin
                    md5 -q -s (pwd)
         end
end
