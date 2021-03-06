static const unsigned char xonix_animations[] = {
  0x00, 0x55, 0x02, 0x59, 0x1a, 0x41, 0x2a, 0x55,  // 88 FIELD_CLAIMING_MAN

  0x00, 0x55, 0x20, 0x4d, 0x2c, 0x41, 0x2a, 0x55,  // 89 FCLAIM_L1
  0x00, 0x55, 0x20, 0x56, 0x26, 0x50, 0x2a, 0x55,  // 8a FCLAIM_L2
  0x00, 0x55, 0x28, 0x53, 0x2b, 0x50, 0x2a, 0x55,  // 8b FCLAIM_L3
  0x00, 0x55, 0x28, 0x55, 0x29, 0x54, 0x2a, 0x55,  // 8c FCLAIM_L4
  0x00, 0x55, 0x2a, 0x54, 0x2a, 0x54, 0x2a, 0x55,  // 8d FCLAIM_L5
  0x00, 0x55, 0x2a, 0x55, 0x2a, 0x55, 0x2a, 0x55,  // 8e FCLAIM_L6
  0x00, 0x55, 0x2a, 0x55, 0x2a, 0x55, 0x2a, 0x55,  // 8f FCLAIM_L7

  0x00, 0x55, 0x2a, 0x55, 0x2a, 0x55, 0x2a, 0x55,//0x89 FCLAIM_R1
  0x00, 0x55, 0x2a, 0x55, 0x2a, 0x55, 0x2a, 0x55,//0x8a FCLAIM_R2
  0x00, 0x55, 0x2a, 0x55, 0x2a, 0x55, 0x2a, 0x55,//0x8b FCLAIM_R3
  0x00, 0x55, 0x2a, 0x95, 0xaa, 0x15, 0x2a, 0x55,//0x8c FCLAIM_R4
  0x00, 0x55, 0x0a, 0xd5, 0xca, 0x15, 0x2a, 0x55,//0x8d FCLAIM_R5
  0x00, 0x55, 0x0a, 0x65, 0x6a, 0x05, 0x2a, 0x55,//0x8e FCLAIM_R6
  0x00, 0x55, 0x02, 0x35, 0x32, 0x05, 0x2a, 0x55,//0x8f FCLAIM_R7


};

static const unsigned char xonix_font[] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //0x00 FIELD_EMPTY
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x01 FIELD_FULL
  0x00, 0x55, 0x2a, 0x55, 0x2a, 0x55, 0x2a, 0x55, //0x02 FIELD_CLAIMING

  0x00, 0x7f, 0x42, 0x5b, 0x5a, 0x43, 0x7e, 0x55, //0x03 FIELD_FULL_MAN
  
  0x00, 0x7f, 0x7e, 0x43, 0x5a, 0x5b, 0x42, 0x55, //0x04 FIELD_FULL_T1
  0x00, 0x7f, 0x7e, 0x7f, 0x42, 0x5b, 0x5a, 0x41, //0x05 FIELD_FULL_T2
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x43, 0x5a, 0x59, //0x06 FIELD_FULL_T3
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x42, 0x59, //0x07 FIELD_FULL_T4
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x41, //0x08 FIELD_FULL_T5
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x09 FIELD_FULL_T6
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x0a FIELD_FULL_T7

  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x0b FIELD_FULL_B1
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x0c FIELD_FULL_B2
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x0d FIELD_FULL_B3
  0x18, 0x43, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x0e FIELD_FULL_B4
  0x18, 0x5b, 0x42, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x0f FIELD_FULL_B5
  0x00, 0x5b, 0x5a, 0x43, 0x7e, 0x7f, 0x7e, 0x55, //0x10 FIELD_FULL_B6
  0x00, 0x43, 0x5a, 0x5b, 0x42, 0x7f, 0x7e, 0x55, //0x11 FIELD_FULL_B7
  
  0x00, 0x7f, 0x60, 0x6d, 0x6c, 0x61, 0x7e, 0x55, //0x10 FIELD_FULL_L1
  0x00, 0x7f, 0x70, 0x76, 0x76, 0x70, 0x7e, 0x55, //0x11 FIELD_FULL_L2
  0x00, 0x7f, 0x78, 0x7b, 0x7b, 0x78, 0x7e, 0x55, //0x12 FIELD_FULL_L3
  0x00, 0x7f, 0x7c, 0x7d, 0x7d, 0x7c, 0x7e, 0x55, //0x13 FIELD_FULL_L4
  0x00, 0x7f, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x55, //0x14 FIELD_FULL_L5
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x15 FIELD_FULL_L6
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x16 FIELD_FULL_L7

  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x17 FIELD_FULL_R1
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x18 FIELD_FULL_R2
  0x00, 0x7f, 0x7e, 0x7f, 0x7e, 0x7f, 0x7e, 0x55, //0x19 FIELD_FULL_R3
  0x00, 0x7f, 0x3e, 0xbf, 0xbe, 0x3f, 0x7e, 0x55, //0x1a FIELD_FULL_R4
  0x00, 0x7f, 0x1e, 0xdf, 0xde, 0x1f, 0x7e, 0x55, //0x1b FIELD_FULL_R5
  0x00, 0x7f, 0x0e, 0x6f, 0x6e, 0x0f, 0x7e, 0x55, //0x1c FIELD_FULL_R6
  0x00, 0x7f, 0x06, 0x37, 0x36, 0x07, 0x7e, 0x55, //0x1d FIELD_FULL_R7

};

