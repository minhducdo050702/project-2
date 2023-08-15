<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="quanlydanhmucnguoidung.aspx.cs" Inherits="pr1.adminmembermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSO</title>
    <link rel="icon" type="image/x-icon" href="Assets/imgs/wso2favicon.png">
    <!--Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
    <!--Jquery-->
    <script src="https://code.jquery.com/jquery-3.6.3.slim.js"
        integrity="sha256-DKU1CmJ8kBuEwumaLuh9Tl/6ZB6jzGOBV/5YpNE2BWc=" crossorigin="anonymous"></script>
    <!--Fontawesomes-->
    <link href="Library/Fontawesomes/Fontawesomes/css/all.css" rel="stylesheet" />
    <!--Datatables-->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
    <!--CSS masterpage-->
    <link href="CSS/MasterPagestylesheet.css" rel="stylesheet" />
    <!--Head placeholder-->
    <link rel="stylesheet" href="style2.css">

    <title>Quản lý danh mục người dùng</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
        <h1>Quản lý danh mục người dùng</h1>
    <table id="userTable">
        <thead>
            <tr>
                <th>ID Người dùng</th>
                <th>Tên đăng nhập</th>
    
                <!-- Add more columns as needed -->
            </tr>
        </thead>
        <tbody>
            <!-- User data will be populated here -->
        </tbody>
    </table>

    <script>
        // Function to fetch access token
        async function fetchAccessToken() {
            const tokenUrl = "https://api.asgardeo.io/t/org28f5u/oauth2/token";
            const clientId = "AS8tWsMzNmC_IUSMMFMEpX4MpFoa";
            const clientSecret = "P99aE8Ij4x29WHnjMNKk2Saw2JinwzxgEgDmK_Np23sa";
            const data = new URLSearchParams();
            data.append("grant_type", "client_credentials");
            data.append("scope", "internal_user_mgt_list");

            const response = await fetch(tokenUrl, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                    "Authorization": `Basic ${btoa(`${clientId}:${clientSecret}`)}`
                },
                body: data
            });

            const responseData = await response.json();
            return responseData.access_token;
        }

        // Function to fetch user data and populate the table
        async function fetchAndDisplayUserData() {
            const accessToken = await fetchAccessToken();
            const userUrl = "https://api.asgardeo.io/t/org28f5u/scim2/Users";

            const response = await fetch(userUrl, {
                headers: {
                    "accept": "application/scim+json",
                    "Authorization": `Bearer ${accessToken}`
                }
            });

            const responseData = await response.json();
            const userTable = document.getElementById("userTable").getElementsByTagName('tbody')[0];

            responseData.Resources.forEach(user => {
                const row = userTable.insertRow();
                const idCell = row.insertCell(0);
                const usernameCell = row.insertCell(1);

                idCell.textContent = user.id;
                usernameCell.textContent = user.userName;
            });
        }

        // Fetch and display user data when the page loads
        fetchAndDisplayUserData();
    </script>
    </div>
</asp:Content>
