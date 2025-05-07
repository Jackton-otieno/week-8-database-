const express = require('express');
const router = express.Router();
const pool = require('../config/db');

// Create a new task
router.post('/', async (req, res) => {
    const { title, description, status, due_date, category_id } = req.body;
    try {
        const [result] = await pool.query(
            'INSERT INTO tasks (title, description, status, due_date, category_id) VALUES (?, ?, ?, ?, ?)',
            [title, description, status, due_date, category_id]
        );
        res.status(201).json({ task_id: result.insertId, message: 'Task created' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Read all tasks
router.get('/', async (req, res) => {
    try {
        const [rows] = await pool.query(`
            SELECT t.*, c.name AS category_name 
            FROM tasks t 
            LEFT JOIN categories c ON t.category_id = c.category_id
        `);
        res.json(rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Read a single task
router.get('/:id', async (req, res) => {
    try {
        const [rows] = await pool.query(`
            SELECT t.*, c.name AS category_name 
            FROM tasks t 
            LEFT JOIN categories c ON t.category_id = c.category_id 
            WHERE t.task_id = ?
        `, [req.params.id]);
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Task not found' });
        }
        res.json(rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Update a task
router.put('/:id', async (req, res) => {
    const { title, description, status, due_date, category_id } = req.body;
    try {
        const [result] = await pool.query(
            'UPDATE tasks SET title = ?, description = ?, status = ?, due_date = ?, category_id = ? WHERE task_id = ?',
            [title, description, status, due_date, category_id, req.params.id]
        );
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Task not found' });
        }
        res.json({ message: 'Task updated' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Delete a task
router.delete('/:id', async (req, res) => {
    try {
        const [result] = await pool.query('DELETE FROM tasks WHERE task_id = ?', [req.params.id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'Task not found' });
        }
        res.json({ message: 'Task deleted' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;