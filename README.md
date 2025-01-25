**Stock Quote App**

### Short Description:

The Stock Quote App is a Flutter-based mobile application designed to provide users with real-time or near real-time stock market data. The app offers features like stock search, watchlist management, and optional historical data visualization, making it a comprehensive tool for tracking and analyzing stock performance.
## Screenshot
<img src="https://github.com/user-attachments/assets/bcd59376-041f-461c-a733-1b2fc2f3bcbe" alt="Screenshot 1" width="300" height="600">
<img src="https://github.com/user-attachments/assets/716eb403-f13f-46bd-a91b-1def20d5206a" alt="Screenshot 2" width="300" height="600">
<img src="https://github.com/user-attachments/assets/82a12696-9b8c-458d-bc7e-84f221d9bc43" alt="Screenshot 3" width="300" height="600">
<img src="https://github.com/user-attachments/assets/bb87418c-5138-4cbb-be1d-a8d5b66b3528" alt="Screenshot 4" width="300" height="600">


## I will attach video link.
I am create 5 minutes video some part is pending like how to git initial and push also because of larger side of video so not added.
- [Video Explanation:](https://drive.google.com/file/d/1qM0AxZ6YH4X0_Gn9PHQWjbo1cKcL8o1S/view?usp=sharing)
### Features:

1. **Search Functionality**:

   - A user-friendly search bar allows users to find stocks by their symbols.

2. **Stock Quote Display**:

   - Key details for selected stocks, including:
     - Symbol
     - Current Price
     - Price Change (Amount and Percentage)
     - Optional Information: Company Name, Market Cap, P/E Ratio, etc.

3. **Watchlist**:

   - Add and remove stocks for quick access to frequently monitored symbols.

4. **Real-Time Data Fetching**:

   - Retrieves up-to-date stock quotes via a custom API built using FastAPI. This approach was chosen because free APIs often limit the number of calls (e.g., up to 5 calls), making them unsuitable for real-time data requirements.
   - All API files are located in the **server** folder. Please refer to this folder for implementation details.

5. **State Management**:

   - Efficient state handling using tools like Provider or BLoC.

6. **Error Handling**:

   - Graceful handling of issues like invalid stock symbols, API errors, and network failures.

7. **Manual or Auto Refresh (Optional)**:

   - Users can manually refresh stock data or enable background updates at regular intervals.

8. **Responsive Design**:

   - Optimized for various screen sizes and device orientations.

9. **Offline Support (Optional)**:

   - Caching recently accessed stock information for offline viewing.

10. **Industry Sector Grouping (Bonus)**:

    - View stock quotes grouped by industry sectors, enhancing data organization and analysis.

11. **CI/CD Pipeline**:

    - The project integrates a CI/CD pipeline to automate testing, building, and deployment processes, ensuring efficient and reliable development workflows.

### How to Start this project:

1. Open a terminal or console and navigate to the **server** folder.
2. Run the following command to start the server:
   ```bash
   pip install -r requirements.txt
   ```
3. If necessary, install the required dependencies first:
   ```bash
    uvicorn main:app --reload
   ```
4. Once the server is running, navigate to the project’s **lib** folder in another terminal.
5. Run the Flutter application to test its functionality and features.
