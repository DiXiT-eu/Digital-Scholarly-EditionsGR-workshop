---
output:
  word_document: default
  pdf_document: default
  html_document: default
---
	
# Working on Schema customization with ROMA


## Before you start
In this exercise, you will use Roma, a web tool available from the TEI web site. You will need access to the internet and a web browser such as Firefox or Opera and once you have your schema you will also need an XML-aware editor to use it (e.g., oXygen).

These instructions only cover part of Roma’s functionality. They describe the steps needed to

- select modules,

- delete elements,

- delete attributes, 

- make an attribute mandatory, and

- constraint its values.

These instructions do not cover some other capabilities of Roma, including adding elements; changing an element’s class membership, contents, or description; changing an attribute's permitted values (other than to a closed list of values); changing the language of Roma interface itself or of the elements & attributes generated.


## Getting started

In this exercise, we will start from an existing customization and we will edit it. 

- The customization is in your Materials folder > unit9 > ODD > **tei_dixit.odd**

- Now, let's go to Roma: when you are on-line, point your favorite web browser to <http://www.tei-c.org/Roma/>.

- You should get to the Roma start screen, which says something like 'Roma: generating validators for the TEI' at the top. 

- As said, we will edit an existing ODD: check the 'Open existing customization' radio button and upload the file **tei_dixit.xml**

- Click Submit!

## Metadata
After clicking Submit, it should take you to the tab Customize in the Page *Set your parameters*. Here you can enter basic metadata of your customization:

- For the **title** choose a meaningful (for you!) name, like 'My first TEI customization' or 'Athens Workshop Customization'

- For the **filename**, it’s a good idea to avoid characters that may confuse operating systems, like slashes, back-slashes, colons, spaces, etc. You can use something like 'myTEI' or 'athensTEI'

- Choose the **language** you prefer. Remember that this will only affect Roma and NOT the customization (inlcuding the documentation) that you are creating

- The **author** is you!

- Adding a short **description** is a good practice, for you (in order to remember months later, and for others)

Press the Submit button (the name of your Customization appears on the top right corner).

## Modules

In this page (List of TEI modules) you can choose the modules which will be included in the schema. The full list of available TEI modules is listed on the left, and at the right there is a ‘List of selected modules’ which is the list currently selected for your schema.

- For this exercise, remove the module Dictionary.

## Elements 

It is often the case that the modules chosen contain many more elements than are desired.
We are starting from a large customization, so let's remove some elements that we know we will not use.

- First click on a module name from the List of selected Modules (the right column). For this exercise, click on the module *namesdates*. This should take you to the appropriate *Change module* page.

- Have a look at the elements listed and find one that will not be used in the encoding of letters (like the ones we have worked with). For example, the element 'climate' or 'langKnowledge' or 'terrain'. Now you can Exclude it/them. 

Don't forget to Save your changes (bottom of the page)!

## Attributes

On the same page, the *Change modules* page, there is a *Change attributes* link next to each element, on the right. Clicking on this link will bring you to a page for changing or adding attributes called *Added Attributes*.

Imagine that we want to make sure that for each person the date of birth is specified (so that later you can put all the data on a beautiful timeline). In order to do this, we want the attribute '@when' to be mandatory on the element 'birth'.

Also, as we are very confident about the information we have about the birth of persons, we don't need to specify how certain we are; we can therefore Excude the attribute '@cert' (that signifies the degree of certainty associated with the intervention or interpretation) :)

- First of all, find the element birth and click on the relative *Change attributes* link on the right.

- This brings you to the *Added attributes* page. A list of attributes is displayed. 

- Find the attribute '@cert' and select the radio button Exclude. Don't forget to Save (at the bottom of the page)! 

- Then, find the attribute '@when'. For changing it, we need to click on it. This brings you to the page *Add some attributes*.

- As said, we want the attribute '@when' to be mandatory. How to do that? Change the values of *Is it optional* to No.

- Don't forget to Save!


## Saving your ODD files

Clicking the *Save Customization* tab, downloads the ODD file that Roma has generated. The default name is the filename specified in the Customize page with .xml appended. Some people like to change the .xml to .odd. Either way, you should **always** save your ODD file, or you will have to go through all this work again anytime you want to modify your customization.

## Generate the Documentation

To generate reference documentation in HTML, select the *Documentation* tab. Leave the output type at the default 'html', and click Submit. Once the file is stored on your compyter, you can open the it with your web browser.

## Generate the schema
To generate an output schema select the *Schema* tab. Here you can change the desired schema language of the schema that Roma will generate and download when you click Submit. For our purposes, leave the default, RELAX NG compact syntax. 

## Test your Customization

If you want to test your Customization, go to oXygen and associate the schema to a TEI document: 

- in oXygen, open a TEI document (one of the letter we have been working on)

- choose menu 'Document' > 'Schema' > 'Associate schema' and select the file you just downloaded by clicking on the plain folder next to the URL box. Leave the rest as it is and press OK. 

- The schema is now associated (you can see it at the top of your TEI document)

- Now try to use the element 'entry'. oXygen will prompt you an error 'Element "entry" not allowed anywhere'! Why? Because we deleted the module Dictionaries

- inside the element 'person' (not 'persName', but 'person' in the Header) create an element 'langKnowledge'. The same error will appear, because we excluded this element

- again inside the element 'person', have a look at the element 'birth'. The attribute '@when' is already there? If not, oXygen will prompt another error, because we made this attribute mandatory. 

Very good! You can keep playing with what you changed in the schema and see how it reflects your encoding!


---

## Still have time ... ?

In this additional exercise we will constrain the list of values for an attribute. This means that when you use a certain attribute, you can only give the values that you specified in the schema.

For this exercise, we want to prepare a schema for encoding poems, and in particular sonnets. For ensuring consistency, we want that each element 'lg' (line groups) has an attribute '@type' with value 'quatrain' or 'tercet', which are the type of stanzas a sonnet is made of.

- You can keep working on the same schema. If you closed Roma, go back to it and upload the Customization

- You can change the metadata and the name of the Customization

- In the Tab *Modules*, click on the module 'Core'

- Now find 'lg' and click on the button 'Change attributes' on the right

- Now find the attribute '@type' and click on it

- In the *Add some attributes* page, we can set the list of values to 'Closed list' (yes!)

- In the field below, 'List of values', we can specify the values we want, separated by a comma. This should looks like 'quatrain, tercet'

- You can add a description for the change attribute, like 'Specify the stanzas inside a sonnet'

- Don't forget to save :)

That's all! Now you can Save the Customization and generate the Schema, as you did in the previous exercise. 

You can test your schema on the poem you encoded in the very beginning of this workshop (also available at <https://github.com/DiXiT-eu/Digital-Scholarly-EditionsGR-workshop/blob/master/results/poem/karyotakis_soneto.xml>).


---

This exercise reuses tutorials at

- <http://www.wwp.northeastern.edu/outreach/seminars/_current/handouts/exercise-roma.xhtml> Licence: CC-BY-NC-SA

- <http://www.tei-c.org/Guidelines/Customization/use_roma.xml> Licence: CC-BY


---

**About this exercise**

Publication: DiXiT Workshop *Digital Scholarly Editions and Modern Greek Studies*. Athens, 24-28 April 2017.

Author: Elena Spadini

Reusing materials published by TEI-C and Women Writers Project, as specified above.

Licence: [CC-BY-NC-SA 4.0]<https://creativecommons.org/licenses/by-nc-sa/4.0/>
