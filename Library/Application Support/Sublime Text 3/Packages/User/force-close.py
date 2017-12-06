import sublime
import sublime_plugin

class ForceCloseCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    if not self.view.file_name(): 
      self.view.set_scratch(True)

      with open('/tmp/last-file', 'w', encoding='utf8') as f:
        f.write(self.view.substr(sublime.Region(0, self.view.size())))
        
    self.view.close()