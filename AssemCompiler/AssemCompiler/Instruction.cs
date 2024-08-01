using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace AssemCompiler
{
    public enum AssemblyInstrucion
    {
        MOV,
        ADD,
        SUB,
        MUL,
        OR,
        AND,
        XOR,
        NOT,
        CMP,
        STR,
        LOD,
        JUMP,
        CJUMP
    }
    internal class Instruction
    {
        short value;
        private static bool CheckBit(int value, int bitIndex)
        {
            return (value & (1 << bitIndex)) != 0;
        }
        public Instruction(short value)
        {
            this.value = value;
        }
        public Instruction()
        {
            value = 0;
        }

        public void RegisterParam(int id, int value)
        {
            bool[] vals = new bool[3];
            for(int i = 0; i < 3; i++)
            {
                if(CheckBit(value, i))
                {
                    SetBit(7 + id * 3 + i);
                }
            }
        }

        public void SetConstant()
        {
            SetBit(6);
        }

        private void SetBits(string bits)
        {
            for(int i = 0;i < bits.Length;i++)
            {
                if (bits[bits.Length - i -1] == '1')
                {
                    SetBit(i);
                }
            }
        }
        public void SetArguments(string s)
        {
            switch (s)
            {
                case "EQ":
                    SetBit(4);
                    break;
                case "GT":
                    SetBit(5);
                    break;
                case "GE":
                    SetBit(4);
                    SetBit(5);
                    break;
                default:
                    break;
            }
        }
        public void SetInstruction(AssemblyInstrucion instrucion)
        {
            switch(instrucion)
            {
                case AssemblyInstrucion.MOV:
                    break;
                case AssemblyInstrucion.ADD:
                    SetBits("1");
                    break;
                case AssemblyInstrucion.SUB:
                    SetBits("10");
                    break;
                case AssemblyInstrucion.MUL:
                    SetBits("11");
                    break;
                case AssemblyInstrucion.OR:
                    SetBits("100");
                    break;
                case AssemblyInstrucion.AND:
                    SetBits("101");
                    break;
                case AssemblyInstrucion.XOR:
                    SetBits("110");
                    break;
                case AssemblyInstrucion.NOT:
                    SetBits("111");
                    break;
                case AssemblyInstrucion.CMP:
                    SetBits("1000");
                    break;
                case AssemblyInstrucion.STR:
                    SetBits("1001");
                    break;
                case AssemblyInstrucion.LOD:
                    SetBits("1010");
                    break;
                case AssemblyInstrucion.JUMP:
                    SetBits("1011");
                    break;
                case AssemblyInstrucion.CJUMP:
                    SetBits("1111");
                    break;
            }
        }

        private void SetBit(int bitIndex) => this.value = (short)((ushort)this.value | (1 << bitIndex));
        public byte[] Getbytes()
        {
            return BitConverter.GetBytes(this.value);
        }

        public string ToVHDLLine()
        {
            string res = "";
            for (int i = 0; i < 16; i++)
            {
                if (CheckBit(value, i))
                {
                    res = res.Insert(0, "1");
                }
                else
                {
                    res = res.Insert(0, "0");
                }
            }
            res = res.Insert(0, "AddInstruction(16'b");
            res += ");";
            return res;
        }

        public override string ToString()
        {
            string res = "";
            for(int i = 0; i < 16; i++)
            {
                if (i == 6|| i == 7 || i == 10 || i == 13)
                {
                    res = res.Insert(0, " ");
                }
                if(CheckBit(value, i))
                {
                    res = res.Insert(0, "1");
                }
                else
                {
                    res = res.Insert(0, "0");
                }
            }
            return res;
        }
    }
}
