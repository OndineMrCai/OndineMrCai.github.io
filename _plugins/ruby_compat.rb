# Ruby 3.2+ removed Object#tainted? / #taint / #untaint, but old Jekyll 3.9
# and Liquid 4.0.3 (locked by the github-pages gem) still call them.
# Re-add as no-op stubs so the site can build under modern Ruby (4.x).
# This file is loaded by `jekyll serve` from _plugins/ automatically;
# GitHub Pages' safe mode ignores it, which is fine — the GH Pages servers
# run a Ruby/Liquid pair where these calls are still valid.
unless "".respond_to?(:tainted?)
  class Object
    def tainted?
      false
    end

    def taint
      self
    end

    def untaint
      self
    end
  end
end
