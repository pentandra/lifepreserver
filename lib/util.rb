# Standalone method from https://gist.github.com/Integralist/9503099
def symbolize(obj)
  return obj.reduce({}) do |memo, (k, v)|
    memo.tap { |m| m[k.to_sym] = symbolize(v) }
  end if obj.is_a? Hash

  return obj.reduce([]) do |memo, v| 
    memo << symbolize(v); memo
  end if obj.is_a? Array

  obj
end
