   M S B A M L   `   `   `  ����B  >Module3, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:Module3.PagesModule3.Pages  5      ;"clr-namespace:Module3.ModelClassesModule3.ModelClasses  5      )    #Module3.Pages.AddUpdateAccountsPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:Module3.Pages     5      ;ModelClasses"clr-namespace:Module3.ModelClasses     5        N� Title$  AddUpdateAccountsPage��5
       � 	Resources 5         accountsViewSource  statusesViewSource  rolesViewSource��%W   &	        &	      &	 &     �� 5   
   6   �� 5   
   6   �� 5   
   6   5      .��5      � 
�������.+�5   
   � -   5         �Name$ grid1��5       � DataContext# [  6   $��250,0,230,0q�6P   $��Stretch=�6e   $��Center=�6�   $	��300��6�    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $��* �6#    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5       $
��Auto �6    �� 5!      $
��Auto �6    �� 5"      $
��Auto �6    .+�5$      �� $��0��6   $	��ID:��6$   $
��Left=�62   $��3q�6M   $��0��6X   $��Center=�6e   �� 5%      -   5         ��Name$ iDTextBlock��5%      $��1��6-   $��Stretch=�6=   $��3q�6[   $��0��6f   $��Center=�6�   ��6s   �� *ID+6�   �� 5'      $��0��6   $��Логин:��6$   $
��Left=�65   $��3q�6P   $��1��6[   $��Center=�6h   �� 5(      -   5         ��Name$ loginTextBox��5(      $��1��6,   $��Stretch=�6<   $	��NaN��6Z   $��3q�6g   $��1��6r   $��Center=�6�   ��6   �� *Login+ �� Mode$ TwoWay=�	 �� NotifyOnValidationError	 . 
 �� ValidatesOnExceptions
 . 6�   �� 5*      $��0��6   $��Пароль:��6$   $
��Left=�66   $��3q�6Q   $��2��6\   $��Center=�6i   �� 5+      -   5        $ passwordTextBox��5+      $��1��6/   $��Stretch=�6?   $	��NaN��6]   $��3q�6j   $��2��6u   $��Center=�6�   ��6�   �� *
Password+$ TwoWay=�	 . 
 . 6�   �� 5-      $��0��6   $��ФИО:��6$   $
��Left=�63   $��3q�6N   $��3��6Y   $��Center=�6f   �� 5.      -   5        $ fullNameTextBox��5.      $��1��6/   $��Stretch=�6?   $	��NaN��6]   $��3q�6j   $��3��6u   $��Center=�6�   ��6�   �� *
FullName+$ TwoWay=�	 . 
 . 6�   �� 50      $��0��6   $?��9Попытки ошибочной авторизации:��6$   $
��Left=�6M   $��3q�6h   $��4��6s   $��Center=�6�   �� 51      -   5         ��Name$ badLoginTrySlider��51      $��1��60   $��Stretch=�6@   $	��NaN��6^   $��3q�6k   $��4��6v    � Minimum$ 0Q�6�    � Maximum$ 3Q�6�   $��Center=�6    � Value 6�   �� *BadLoginTry+$ TwoWay=�	 . 
 . 6   �� 53      $��0��6   $0��*Последняя авторизация:��6$   $
��Left=�6E   $��3q�6`   $��5��6k   $��Center=�6x   (  "System.Windows.Controls.DatePicker  54      -   5          Name$% lastDateAuthorizationDatePicker��54      $��1��6B   $��Stretch=�6R   $��3q�6p   $��5��6{   $��Center=�6�      SelectedDate 6�   �� *LastDateAuthorization+6�   �� 56      $��0��6   $*��$Новый пользователь:��6$   $
��Left=�6B   $��3q�6]   $��6��6h   $��Center=�6u   �� 57      -   5         ��Name$ newUserCheckBox��57      $��1��60   $�� ��6@   $
��Left=�6K   $��3q�6�   $��6��6�   $��Center=�6�    d� 	IsChecked 6f   �� *	NewUser+$ TwoWay=�	 . 
 . 6�   �� 59      $��0��6   $��	Роль:��6$   $
��Left=�64   $��3q�6O   $��7��6Z   $��Center=�6g   �� 5:      -	   5         ��Name$ rolesComboBox��5:      $��1��6.    �� DisplayMemberPath$
 Name��6>   $��Stretch=�6W   $	��NaN��6u    �� SelectedValuePath$ ID��6�   $��3q�6�   $��7��6  $��Center=�6  ��6�   ��  �� Source# [  �� SelectedValue 6�   �� *RoleID+��5;      �� 5<      .R�5=      $� 5>      5@      �� 5A      $��0��6   $��Статус:��6$   $
��Left=�66   $��3q�6Q   $��8��6\   $��Center=�6i   �� 5B      -
   5        $ statusesComboBox��5B      $��1��61   $
 Name��6A   $��Stretch=�6Z   $	��NaN��6x   $ ID��6�   $��3q�6  $��8��6  $��Center=�6  ��6�   �� # [  6�   �� *
StatusID+��5C      �� 5D      .R�5E      $� 5F      5H      5I      �� 5K   
   -   5        $ textBlockName��5K      $��Center=�6+   $��0,20,0,0q�6H   $
��Wrap=�6Z   $
��Name��6n   $	��Top=�6z   $��41��6�   $	��680��6�    �� TextAlignment$ Center=�6�    �� 
LineHeight$ 24��6�   $��25(�6�   � 5M   
   $��Bottom=�6   $��
30,0,30,20q�6*   .+�5N      �� -   5        $��Сохранить��5N      $	��150��6)   $��0,0,0,0q�65   $��31��6F   $��Center=�6R   $��Center=�6o   6�   �� 5O      -   5        $��
Назад��5O      $��98��6%   $��0,0,0,0q�60   $��31��6A   $
��Left=�6M   $��Center=�6h   6�   5P      5R      5S      