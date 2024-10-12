# Development Document Guideline



## Format 

- 文字资料用Markdown格式文档，它是带简单格式标记的纯文本，可以易于进行通过代码版本管理工具来进行版本管理 ，而且易于搜索，提交信息查找效率。
- UML图表使用draw.io的文档，导出为非压缩的XML格式，同样是纯文本文件。



## 工具

- Typora, 非常灵巧的小编辑器，可以从https://www.typora.io/ 下载
- draw.io desktop，可以从draw.io网站上下载。创建一个文档，然后点击Help菜单，可以找到Download draw.io Desktop链接



## Typora 使用技巧

### 加入图片

在markdown文件中，可以通过加入一个图片链接轻易使用网络上现有图片。但是本地图片如果在文档中被引用，当它被分享给其他人的时候，文件是不能被包含在md文件中的，会导致文件中的图片不能显示。所以需要把要引用的文件上传到网上，然后再引用图片的链接。

对于GitHub的用户，GitHub中没有专门的图片管理器可以上传图片，但是我们可以借用一下issue中自动上传图片的功能，来达到上传图片并获取链接的目的。



- Upload Images to GitHub's CDN

1. First, visit any repository on GitHub and click your way through to the issues page.

2. Create a new issue by clicking the **New Issue** button. You'll now see title and description fields. 

3. Drag-and-drop an image on to the description field. This will start the uploading process.

4. Copy the URL and use it in README, issues or pull requests however you like.

<img src="https://user-images.githubusercontent.com/499192/57450172-1a955f80-725e-11e9-9fed-267179bdab15.gif" alt="Example of uploading image to GitHub's CDN" width="500px">



**请注意：不同公司的文档要使用各自的GitHub帐户来上传图片并获取链接。否则如果帐户关闭，所有图片就会显示不出来。 Sanjel文档必须使用Sanjel的GitHub帐户。**



### 导出其他格式文档

如果文档没有共享的需要，可以使用本地图片然后导出PDF，HTML或是Word等文档格式。

