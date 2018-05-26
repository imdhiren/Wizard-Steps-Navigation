﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProcessFormStep.Models
{
    public class Result<T>
    {
        public bool IsSucceed { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
        public Exception Exception { get; set; }
        public int Id { get; set; }
    }
}