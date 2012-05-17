module RedCloth
  module ActiveModelDecorator

    def self.included(base)

      base.class_eval do

        #
        # USAGE: 
        #
        # class Person
        #   redcloth_on [:name, :last_name]
        # end
        #
        # and those attributes will be decorated by RedCloth
        #


        def self.redcloth_on(attributes_array=[])
          attributes_array.each{|a| define_proper_methods_on(a) }
        end

        private

        #
        # nodoc
        #

        def self.define_proper_methods_on(name)

          solve_value = (name.to_s + "_attribute").to_sym

          define_method(name) do
            RedCloth.new(self.send(solve_value)).to_html
          end

          define_method(solve_value) do
            qt = attributes[name.to_s]
            qt.nil? ? "" : qt
          end
        end
      end
    end
  end
end

