using System.Collections;
using System.Data;
using System.IO;
using System.Reflection.Metadata;
using System.Security;
using System.Text.Json;
using System.Windows.Forms;

namespace AssemCompiler
{
    public partial class Form1 : Form
    {

        private List<Instruction> MainInstructions = new List<Instruction>();
        private List<string> DisplayOptions = new List<string> { "Binary", "VHDL" };
        public Form1()
        {
            InitializeComponent();

        }
        DataTable Table { get; set; }
        private void Form1_Load(object sender, EventArgs e)
        {
            foreach (string DisplayOption in DisplayOptions)
            {
                comboBox1.Items.Add(DisplayOption);
            }
            //auto select first item
            comboBox1.SelectedIndex = 1;
            DataTable table = new DataTable();
            Table = table;
            table.TableName = "Instructions";
            table.Columns.Add("Instruction", typeof(string));
            table.Columns.Add("Param1", typeof(string));
            table.Columns.Add("Param2", typeof(string));
            table.Columns.Add("Param3", typeof(string));
            table.Columns.Add("Tag", typeof(string));
            dataGridView1.DataSource = table;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List<Instruction> instructions = new List<Instruction>();
            List<string> CMPOptions = new List<string>() {"EQ", "GT", "GE" };
            Dictionary<string, int> Tags = new Dictionary<string, int>();
            List < KeyValuePair<string,int> > NamedLocations = new List<KeyValuePair<string, int>>();
            int InstAdress = 0;
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.Cells[0].Value != null && row.Cells[1].Value != null)
                {
                    bool hasConstant = false;
                    short constant = 0;
                    Instruction instruction = new Instruction();
                    if (!Enum.TryParse(typeof(AssemblyInstrucion), row.Cells[0].Value.ToString().ToUpper(),
                        true,
                        out object inst))
                    {
                        MessageBox.Show("INVALID INST AT LINE :" + row.Index.ToString());
                        return;
                    }
                    if (row.Cells[1].Value.ToString()[0] == '#')
                    {
                        if (!short.TryParse(row.Cells[1].Value.ToString().Substring(1), out constant))
                        {
                            MessageBox.Show("INVALID PARAM AT LINE :" + row.Index.ToString());
                            return;
                        }
                        hasConstant = true;
                        instruction.SetConstant();
                    }
                    else
                    {
                        if (!int.TryParse(row.Cells[1].Value.ToString(), out int param1))
                        {
                            if (Tags.Keys.Contains(row.Cells[1].Value.ToString()))
                            {
                                constant = (short)Tags[row.Cells[1].Value.ToString()];
                                hasConstant = true;
                                instruction.SetConstant();
                            }
                            else
                            {
                                constant = 0;
                                hasConstant = true;
                                instruction.SetConstant();
                                NamedLocations.Add(new KeyValuePair<string, int>(row.Cells[1].Value.ToString(), 1+InstAdress));
                            }
                        }
                        else
                        {
                            instruction.RegisterParam(0, param1);
                        }
                    }
                    for (int i = 2; i < 4; i++)
                    {
                        if (row.Cells[i].Value != null)
                        {
                            if (!int.TryParse(row.Cells[i].Value.ToString(), out int param))
                            {
                                if (i == 2)
                                {
                                    if (CMPOptions.Contains(row.Cells[2].Value.ToString()) && (AssemblyInstrucion)inst == AssemblyInstrucion.CJUMP)
                                    {
                                        instruction.SetArguments(row.Cells[2].Value.ToString());
                                        continue;
                                    }
                                }
                                MessageBox.Show("INVALID PARAM AT LINE :" + row.Index.ToString());
                                return;
                            }
                            else
                            {
                                instruction.RegisterParam(i - 1, param);
                            }
                        }
                        else
                        {
                            instruction.RegisterParam(i - 1, 0);
                        }
                    }
                    if (row.Cells[4].Value.ToString() != "") { 
                        Tags[row.Cells[4].Value.ToString()] = InstAdress; }
                    instruction.SetInstruction((AssemblyInstrucion)inst);
                    instructions.Add(instruction);
                    if (hasConstant)
                    {
                        InstAdress++;
                        instructions.Add(new Instruction(constant));
                    }
                    InstAdress++;
                }
            }
            if (instructions.Count == 0) { return; }
            foreach(var tag in NamedLocations)
            {
                if (!Tags.ContainsKey(tag.Key)) { 
                    MessageBox.Show("Invalid use of tag: " + tag.Key);
                    return;
                }
                instructions[tag.Value] = new Instruction((short)Tags[tag.Key]);
            }
            MainInstructions = instructions;
            button3.Enabled = true;
            DisplayData();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            string selected = comboBox1.SelectedItem.ToString();
            while (true)
            {
                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "Routing files (*.bin)|*.bin";
                saveFileDialog.RestoreDirectory = true;
                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string filePath = saveFileDialog.FileName;
                    //create file
                    using (StreamWriter writer = new StreamWriter(filePath))
                    {
                        foreach (Instruction instruction in MainInstructions)
                        {
                            if (selected == "Binary")
                            {
                                writer.Write(instruction.Getbytes());
                            }
                            else
                            {
                                writer.WriteLine(instruction.ToVHDLLine());
                            }
                        }
                    }
                    break;
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DisplayData();
        }

        private void DisplayData()
        {
            string selected = comboBox1.SelectedItem.ToString();
            string Display = "";
            foreach (Instruction instruction in MainInstructions)
            {
                if (selected == "Binary")
                {
                    Display += instruction.ToString() + "\r\n";
                }
                else
                {
                    Display += instruction.ToVHDLLine() + "\r\n";
                }
            }
            textBox1.Text = Display;
        }
        private void SaveData(string filePath)
        {
            DataTable dataTable = (DataTable)dataGridView1.DataSource;
            dataTable.WriteXml(filePath);
        }

        private void LoadData(string filePath)
        {
            ((DataTable)(dataGridView1.DataSource)).ReadXml(filePath);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "Routing files (*.Assemb)|*.Assemb";
            saveFileDialog.RestoreDirectory = true;
            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                SaveData(saveFileDialog.FileName);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Routing files (*.Assemb)|*.Assemb";
            openFileDialog.RestoreDirectory = true;
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                LoadData(openFileDialog.FileName);
            }
        }

        private void insertToolStripMenuItem_Click(object sender, EventArgs e)
        {
            DataGridViewCell cell = dataGridView1.SelectedCells[0];
            Table.Rows.InsertAt(Table.NewRow(), cell.RowIndex);
        }
    }
}