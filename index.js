const express = require('express');
const taskRoutes = require('./routes/tasks');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use('/api/tasks', taskRoutes);

app.get('/', (req, res) => {
    res.send('Task Manager API is running');
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});