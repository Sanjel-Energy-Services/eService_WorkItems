
using System;
using System.Collections.Generic;
using System.IO;

namespace Sanjel.PrintingService.CSS.Parser
{
    public class Token
    {
        #region Instance Properties

        /// <summary>
        /// token kind
        /// </summary>
        public int Kind { get; set; }

        /// <summary>
        /// token position in the source text (starting at 0)
        /// </summary>
        public int Pos { get; set; }

        /// <summary>
        /// token column (starting at 1)
        /// </summary>
        public int Col { get; set; }

        /// <summary>
        /// token line (starting at 1)
        /// </summary>
        public int Line { get; set; }

        /// <summary>
        /// token value
        /// </summary>
        public string Val { get; set; }

        /// <summary>
        /// ML 2005-03-11 Tokens are kept in linked list
        /// </summary>
        public Token Next { get; set; }

        #endregion Instance Properties
    }

    public class Buffer
    {
        #region Instance Variables

        public const int Eof = char.MaxValue + 1;

        private const int MaxBufferLength = 64 * 1024; // 64KB
        private readonly byte[] _buf;         // input buffer
        private int _bufStart;       // position of first byte in buffer relative to input stream
        private int _bufLen;         // length of buffer
        private readonly int _fileLen;        // length of input stream
        private int _pos;            // current position in buffer
        private Stream _stream;      // input stream (seekable)
        private readonly bool _isUserStream;  // was the stream opened by the user?

        #endregion Instance Variables

        #region Constructors

        public Buffer(Stream s, bool isUserStream)
        {
            _stream = s;
            _isUserStream = isUserStream;
            _fileLen = _bufLen = (int)s.Length;
            if (_stream.CanSeek && _bufLen > MaxBufferLength) _bufLen = MaxBufferLength;
            _buf = new byte[_bufLen];
            _bufStart = Int32.MaxValue; // nothing in the buffer so far
            Pos = 0; // setup buffer to position 0 (start)
            if (_bufLen == _fileLen) Close();
        }

        protected Buffer(Buffer b)
        {
            // called in UTF8Buffer constructor
            _buf = b._buf;
            _bufStart = b._bufStart;
            _bufLen = b._bufLen;
            _fileLen = b._fileLen;
            _pos = b._pos;
            _stream = b._stream;
            b._stream = null;
            _isUserStream = b._isUserStream;
        }

        ~Buffer() { Close(); }

        #endregion Constructors

        #region Instance Properties

        public int Pos
        {
            get { return _pos + _bufStart; }
            set
            {
                if (value < 0) value = 0;
                else if (value > _fileLen) value = _fileLen;
                if (value >= _bufStart && value < _bufStart + _bufLen)
                {
                    // already in buffer
                    _pos = value - _bufStart;
                }
                else if (_stream != null)
                {
                    // must be swapped in
                    _stream.Seek(value, SeekOrigin.Begin);
                    _bufLen = _stream.Read(_buf, 0, _buf.Length);
                    _bufStart = value; _pos = 0;
                }
                else
                {
                    _pos = _fileLen - _bufStart; // make Pos return fileLen
                }
            }
        }

        #endregion Instance Properties

        #region Instance Methods

        protected void Close()
        {
            if (!_isUserStream && _stream != null)
            {
                _stream.Close();
                _stream = null;
            }
        }

        public virtual int Read()
        {
            if (_pos < _bufLen)
            {
                return _buf[_pos++];
            }
            if (Pos < _fileLen)
            {
                Pos = Pos; // shift buffer start to Pos
                return _buf[_pos++];
            }
            return Eof;
        }

        public int Peek()
        {
            int curPos = Pos;
            int ch = Read();
            Pos = curPos;
            return ch;
        }

        public string GetString(int beg, int end)
        {
            int len = end - beg;
            char[] buf = new char[len];
            int oldPos = Pos;
            Pos = beg;
            for (int i = 0; i < len; i++) buf[i] = (char)Read();
            Pos = oldPos;
            return new String(buf);
        }

        #endregion Instance Methods
    }

    // UTF8Buffer
    public class Utf8Buffer : Buffer
    {
        public Utf8Buffer(Buffer b) : base(b) { }

        public override int Read()
        {
            int ch;
            do
            {
                ch = base.Read();
                // until we find a uft8 start (0xxxxxxx or 11xxxxxx)
            }
            while ((ch >= 128) && ((ch & 0xC0) != 0xC0) && (ch != Eof));

            if (ch < 128 || ch == Eof)
            {
                // nothing to do, first 127 chars are the same in ascii and utf8
                // 0xxxxxxx or end of file character
            }
            else if ((ch & 0xF0) == 0xF0)
            {
                // 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                int c1 = ch & 0x07; ch = base.Read();
                int c2 = ch & 0x3F; ch = base.Read();
                int c3 = ch & 0x3F; ch = base.Read();
                int c4 = ch & 0x3F;
                ch = (((((c1 << 6) | c2) << 6) | c3) << 6) | c4;
            }
            else if ((ch & 0xE0) == 0xE0)
            {
                // 1110xxxx 10xxxxxx 10xxxxxx
                int c1 = ch & 0x0F; ch = base.Read();
                int c2 = ch & 0x3F; ch = base.Read();
                int c3 = ch & 0x3F;
                ch = (((c1 << 6) | c2) << 6) | c3;
            }
            else if ((ch & 0xC0) == 0xC0)
            {
                // 110xxxxx 10xxxxxx
                int c1 = ch & 0x1F; ch = base.Read();
                int c2 = ch & 0x3F;
                ch = (c1 << 6) | c2;
            }
            return ch;
        }
    }

    // Scanner
    public class CssScanner
    {
        #region Instance Variables

        private const char Eol = '\n';
        private const int EofSym = 0;               // pdt
        private const int MaxT = 49;
        private const int NoSym = 49;

        private Buffer _buffer;                     // scanner buffer

        private int _inputChar;                     // current input character
        private int _posByte;                       // byte position of current character
        private int _posCol;                        // column number of current character
        private int _lineNumber;                    // line number of current character
        private int _oldEols;                       // EOLs that appeared in a comment;
        private Dictionary<int, int> _start;        // maps first token character to start state

        private Token _currentToken;                // current token
        private Token _tokens;                      // list of tokens already peeked (first token is a dummy)
        private Token _peekToken;                   // current peek token

        private char[] _tokenText = new char[128];  // text of current token
        private int _tokenLen;                      // length of current token

        #endregion Instance Variables

        #region Constructors

        public CssScanner(string fileName)
        {
            try
            {
                Stream stream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.Read);
                _buffer = new Buffer(stream, false);
                Init();
            }
            catch (IOException)
            {
                throw new FatalError("Cannot open file " + fileName);
            }
        }

        public CssScanner(Stream s)
        {
            _buffer = new Buffer(s, true);
            Init();
        }

        #endregion Constructors

        #region Instance Methods

        // get the next token (possibly a token already seen during peeking)
        public Token Scan()
        {
            if (_tokens.Next == null)
            {
                return NextToken();
            }

            _peekToken = _tokens = _tokens.Next;
            return _tokens;
        }

        #endregion Instance Methods

        #region Private Methods

        private void Init()
        {
            _posByte = -1;
            _lineNumber = 1;
            _posCol = 0;
            _oldEols = 0;
            NextCh();
            if (_inputChar == 0xEF)
            {
                // check optional byte order mark for UTF-8
                NextCh();
                int ch1 = _inputChar;
                NextCh();
                int ch2 = _inputChar;
                if (ch1 != 0xBB || ch2 != 0xBF)
                {
                    throw new FatalError(String.Format("illegal byte order mark: EF {0,2:X} {1,2:X}", ch1, ch2));
                }
                _buffer = new Utf8Buffer(_buffer);
                _posCol = 0;
                NextCh();
            }
            _start = new Dictionary<int, int>(128);
            for (int i = 65; i <= 84; ++i) _start[i] = 1;
            for (int i = 86; i <= 90; ++i) _start[i] = 1;
            for (int i = 95; i <= 95; ++i) _start[i] = 1;
            for (int i = 97; i <= 122; ++i) _start[i] = 1;
            for (int i = 10; i <= 10; ++i) _start[i] = 2;
            for (int i = 13; i <= 13; ++i) _start[i] = 2;
            for (int i = 48; i <= 57; ++i) _start[i] = 3;
            for (int i = 9; i <= 9; ++i) _start[i] = 4;
            for (int i = 11; i <= 12; ++i) _start[i] = 4;
            for (int i = 32; i <= 32; ++i) _start[i] = 4;
            _start[60] = 5;
            _start[45] = 40;
            _start[39] = 11;
            _start[34] = 12;
            _start[40] = 13;
            _start[41] = 14;
            _start[64] = 15;
            _start[44] = 16;
            _start[123] = 17;
            _start[59] = 18;
            _start[125] = 19;
            _start[43] = 20;
            _start[62] = 21;
            _start[126] = 41;
            _start[42] = 42;
            _start[35] = 22;
            _start[46] = 23;
            _start[91] = 24;
            _start[61] = 25;
            _start[124] = 27;
            _start[36] = 29;
            _start[94] = 31;
            _start[93] = 34;
            _start[58] = 35;
            _start[33] = 36;
            _start[47] = 37;
            _start[85] = 43;
            _start[37] = 39;
            _start[Buffer.Eof] = -1;

            _peekToken = _tokens = new Token();  // first token is a dummy
        }

        private void NextCh()
        {
            if (_oldEols > 0)
            {
                _inputChar = Eol;
                _oldEols--;
            }
            else
            {
                _posByte = _buffer.Pos;
                _inputChar = _buffer.Read();
                _posCol++;
                // replace isolated '\r' by '\n' in order to make
                // eol handling uniform across Windows, Unix and Mac
                if (_inputChar == '\r' && _buffer.Peek() != '\n') _inputChar = Eol;
                if (_inputChar == Eol)
                {
                    _lineNumber++;
                    _posCol = 0;
                }
            }

        }

        private void AddCh()
        {
            if (_tokenLen >= _tokenText.Length)
            {
                char[] newBuf = new char[2 * _tokenText.Length];
                Array.Copy(_tokenText, 0, newBuf, 0, _tokenText.Length);
                _tokenText = newBuf;
            }
            _tokenText[_tokenLen++] = (char)_inputChar;
            NextCh();
        }

        private bool Comment0()
        {
            int level = 1, pos0 = _posByte, line0 = _lineNumber, col0 = _posCol;
            NextCh();
            if (_inputChar == '*')
            {
                NextCh();
                for (; ; )
                {
                    if (_inputChar == '*')
                    {
                        NextCh();
                        if (_inputChar == '/')
                        {
                            level--;
                            if (level == 0)
                            {
                                _oldEols = _lineNumber - line0;
                                NextCh();
                                return true;
                            }
                            NextCh();
                        }
                    }
                    else if (_inputChar == Buffer.Eof) return false;
                    else NextCh();
                }
            }
            else
            {
                _buffer.Pos = pos0;
                NextCh();
                _lineNumber = line0;
                _posCol = col0;
            }
            return false;
        }

        private void CheckLiteral()
        {
            switch (_currentToken.Val)
            {
                case "url": _currentToken.Kind = 9; break;
                case "all": _currentToken.Kind = 12; break;
                case "aural": _currentToken.Kind = 13; break;
                case "braille": _currentToken.Kind = 14; break;
                case "embossed": _currentToken.Kind = 15; break;
                case "handheld": _currentToken.Kind = 16; break;
                case "print": _currentToken.Kind = 17; break;
                case "projection": _currentToken.Kind = 18; break;
                case "screen": _currentToken.Kind = 19; break;
                case "tty": _currentToken.Kind = 20; break;
                case "tv": _currentToken.Kind = 21; break;
                case "n": _currentToken.Kind = 22; break;
                case "important": _currentToken.Kind = 45; break;
                default: break;
            }
        }

        private Token NextToken()
        {
            while (_inputChar == 10 || _inputChar == 13) NextCh();

            if (_inputChar == '/' && Comment0()) return NextToken();

            _currentToken = new Token {Pos = _posByte, Col = _posCol, Line = _lineNumber};
            int state;
            try
            {
                state = _start[_inputChar];
            }
            catch (KeyNotFoundException)
            {
                state = 0;
            }
            _tokenLen = 0;
            AddCh();

            switch (state)
            {
                case -1: { _currentToken.Kind = EofSym; break; } // NextCh already done
                case 0: { _currentToken.Kind = NoSym; break; }   // NextCh already done
                case 1:
                    if (_inputChar == '-' || _inputChar >= '0' && _inputChar <= '9' || _inputChar >= 'A' && _inputChar <= 'Z' || _inputChar == '_' || _inputChar >= 'a' && _inputChar <= 'z')
                    {
                        AddCh();
                        goto case 1;
                    }
                    else
                    {
                        _currentToken.Kind = 1;
                        _currentToken.Val = new String(_tokenText, 0, _tokenLen);
                        CheckLiteral();
                        return _currentToken;
                    }
                case 2: { _currentToken.Kind = 2; break; }
                case 3: { _currentToken.Kind = 3; break; }
                case 4: { _currentToken.Kind = 4; break; }
                case 5:
                    if (_inputChar == '!')
                    {
                        AddCh();
                        goto case 6;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 6:
                    if (_inputChar == '-')
                    {
                        AddCh();
                        goto case 7;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 7:
                    if (_inputChar == '-')
                    {
                        AddCh();
                        goto case 8;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 8: { _currentToken.Kind = 5; break; }
                case 9:
                    if (_inputChar == '>')
                    {
                        AddCh();
                        goto case 10;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 10: { _currentToken.Kind = 6; break; }
                case 11: { _currentToken.Kind = 7; break; }
                case 12: { _currentToken.Kind = 8; break; }
                case 13: { _currentToken.Kind = 10; break; }
                case 14: { _currentToken.Kind = 11; break; }
                case 15: { _currentToken.Kind = 23; break; }
                case 16: { _currentToken.Kind = 25; break; }
                case 17: { _currentToken.Kind = 26; break; }
                case 18: { _currentToken.Kind = 27; break; }
                case 19: { _currentToken.Kind = 28; break; }
                case 20: { _currentToken.Kind = 29; break; }
                case 21: { _currentToken.Kind = 30; break; }
                case 22: { _currentToken.Kind = 33; break; }
                case 23: { _currentToken.Kind = 34; break; }
                case 24: { _currentToken.Kind = 35; break; }
                case 25: { _currentToken.Kind = 36; break; }
                case 26: { _currentToken.Kind = 37; break; }
                case 27:
                    if (_inputChar == '=')
                    {
                        AddCh();
                        goto case 28;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 28: { _currentToken.Kind = 38; break; }
                case 29:
                    if (_inputChar == '=')
                    {
                        AddCh();
                        goto case 30;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 30: { _currentToken.Kind = 39; break; }
                case 31:
                    if (_inputChar == '=')
                    {
                        AddCh();
                        goto case 32;
                    }
                    else
                    {
                        _currentToken.Kind = NoSym;
                        break;
                    }
                case 32: { _currentToken.Kind = 40; break; }
                case 33: { _currentToken.Kind = 41; break; }
                case 34: { _currentToken.Kind = 42; break; }
                case 35: { _currentToken.Kind = 43; break; }
                case 36: { _currentToken.Kind = 44; break; }
                case 37: { _currentToken.Kind = 46; break; }
                case 38: { _currentToken.Kind = 47; break; }
                case 39: { _currentToken.Kind = 48; break; }
                case 40:
                    if (_inputChar == '-')
                    {
                        AddCh();
                        goto case 9;
                    }
                    else
                    {
                        _currentToken.Kind = 24;
                        break;
                    }
                case 41:
                    if (_inputChar == '=')
                    {
                        AddCh();
                        goto case 26;
                    }
                    else
                    {
                        _currentToken.Kind = 31;
                        break;
                    }
                case 42:
                    if (_inputChar == '=')
                    {
                        AddCh();
                        goto case 33;
                    }
                    else
                    {
                        _currentToken.Kind = 32;
                        break;
                    }
                case 43:
                    if (_inputChar == '-' || _inputChar >= '0' && _inputChar <= '9' || _inputChar >= 'A' && _inputChar <= 'Z' || _inputChar == '_' || _inputChar >= 'a' && _inputChar <= 'z')
                    {
                        AddCh();
                        goto case 1;
                    }
                    else if (_inputChar == 92)
                    {
                        AddCh();
                        goto case 38;
                    }
                    else
                    {
                        _currentToken.Kind = 1;
                        _currentToken.Val = new String(_tokenText, 0, _tokenLen);
                        CheckLiteral();
                        return _currentToken;
                    }
            }
            _currentToken.Val = new String(_tokenText, 0, _tokenLen);
            return _currentToken;
        }

        // peek for the next token, ignore pragmas
        private Token Peek()
        {
            if (_peekToken.Next == null)
            {
                do
                {
                    _peekToken = _peekToken.Next = NextToken();
                }
                while (_peekToken.Kind > MaxT); // skip pragmas
            }
            else
            {
                do
                {
                    _peekToken = _peekToken.Next;
                }
                while (_peekToken.Kind > MaxT);
            }
            return _peekToken;
        }

        // make sure that peeking starts at the current scan position
        private void ResetPeek()
        {
            _peekToken = _tokens;
        }

        #endregion Private Methods
    }
}