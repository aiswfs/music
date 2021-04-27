from django import forms
# import 
class FileFieldForm(forms.Form):
    file_field = forms.FileField(label='选择多个文件',widget=forms.ClearableFileInput(attrs={'multiple':True}))