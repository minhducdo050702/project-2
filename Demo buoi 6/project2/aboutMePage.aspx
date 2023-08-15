<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutMePage.aspx.cs"
  Inherits="pr1.aboutMePage" %>
  <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  </asp:Content>
  <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
      .container {
        width: 80%;
        margin: 0 auto;
      }

      .row {
        display: flex;
        align-items: center;
      }

      .col-8 {
        width: 75%;
        padding: 0 15px;
      }

      .col-4 {
        width: 25%;
        text-align: center;
      }

      h1 {
        font-size: 2em;
        margin-bottom: 10px;
      }

      h2 {
        font-size: 1.5em;
        margin-bottom: 20px;
      }

      h3 {
        font-size: 1.2em;
        margin-bottom: 10px;
      }

      p {
        font-size: 1em;
        margin-bottom: 10px;
      }

      img {
        border-radius: 50%;
      }
    </style>

    <div class="container">
      <div class="row">
        <div class="col-8">
          <h1>About Me</h1>
          <h2>Hi, my name is UwUDmD!</h2>
          <p>I am a student with a passion for Computer Science. In my free time, you can find me reading book about
            Science.</p>
          <p>I have always been interested in WebDev and have pursued this interest through education. I am currently
            working as a WebDev Intern and am always looking for new opportunities to learn and grow in my career.</p>
          <p>Thank you for visiting my about me page. If you have any questions or would like to connect, please feel
            free to reach out using the contact information below.</p>
          <h3>Contact Information:</h3>
          <ul>
            <li>Email: duc.dm200158@sis.hust.edu.vn</li>
            <li>LinkedIn: <a
                href="https://www.linkedin.com/in/minhducdo200158/">https://www.linkedin.com/in/minhducdo200158/</a>
            </li>
            <li>This website is used for my Project1. This webpage was referenced from the website:<a
                href="https://simplesnippets.tech/"> https://simplesnippets.tech/ </a></li>
          </ul>
        </div>
        <div class="col-4">
          <img width="200px" src="Assets/imgs/about%20me.jpg" />
        </div>
      </div>
    </div>
  </asp:Content>