pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#cc9417c5#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#ddf3267e#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#da4d2671#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#4c8cceba#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#2da59038#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#5f84b5ab#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#b321486d#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00012, "system__parametersB");
   u00013 : constant Version_32 := 16#538f9d47#;
   pragma Export (C, u00013, "system__parametersS");
   u00014 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00014, "system__secondary_stackB");
   u00015 : constant Version_32 := 16#86c45f51#;
   pragma Export (C, u00015, "system__secondary_stackS");
   u00016 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00016, "system__storage_elementsB");
   u00017 : constant Version_32 := 16#0066da3c#;
   pragma Export (C, u00017, "system__storage_elementsS");
   u00018 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00018, "system__stack_checkingB");
   u00019 : constant Version_32 := 16#a31afbd0#;
   pragma Export (C, u00019, "system__stack_checkingS");
   u00020 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00020, "system__exception_tableB");
   u00021 : constant Version_32 := 16#700bf97a#;
   pragma Export (C, u00021, "system__exception_tableS");
   u00022 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00022, "system__exceptionsB");
   u00023 : constant Version_32 := 16#45c6fdce#;
   pragma Export (C, u00023, "system__exceptionsS");
   u00024 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00024, "system__exceptions__machineS");
   u00025 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00025, "system__exceptions_debugB");
   u00026 : constant Version_32 := 16#532f69fc#;
   pragma Export (C, u00026, "system__exceptions_debugS");
   u00027 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00027, "system__img_intB");
   u00028 : constant Version_32 := 16#2f7e70fa#;
   pragma Export (C, u00028, "system__img_intS");
   u00029 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#73874efc#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#2dfe6648#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#d2b6296c#;
   pragma Export (C, u00033, "system__traceback__symbolicB");
   u00034 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00034, "system__traceback__symbolicS");
   u00035 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00035, "ada__exceptions__tracebackB");
   u00036 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00036, "ada__exceptions__tracebackS");
   u00037 : constant Version_32 := 16#5d344636#;
   pragma Export (C, u00037, "system__crtlS");
   u00038 : constant Version_32 := 16#b6a35849#;
   pragma Export (C, u00038, "system__dwarf_linesB");
   u00039 : constant Version_32 := 16#44249c75#;
   pragma Export (C, u00039, "system__dwarf_linesS");
   u00040 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00040, "ada__charactersS");
   u00041 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00041, "ada__characters__handlingB");
   u00042 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00042, "ada__characters__handlingS");
   u00043 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00043, "ada__characters__latin_1S");
   u00044 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00044, "ada__stringsS");
   u00045 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00045, "ada__strings__mapsB");
   u00046 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00046, "ada__strings__mapsS");
   u00047 : constant Version_32 := 16#4a6f6ca4#;
   pragma Export (C, u00047, "system__bit_opsB");
   u00048 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00048, "system__bit_opsS");
   u00049 : constant Version_32 := 16#1923ecbb#;
   pragma Export (C, u00049, "system__unsigned_typesS");
   u00050 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00050, "ada__strings__maps__constantsS");
   u00051 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00051, "interfacesS");
   u00052 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00052, "system__address_imageB");
   u00053 : constant Version_32 := 16#8c490d02#;
   pragma Export (C, u00053, "system__address_imageS");
   u00054 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00054, "system__img_unsB");
   u00055 : constant Version_32 := 16#86d7d04c#;
   pragma Export (C, u00055, "system__img_unsS");
   u00056 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00056, "system__ioB");
   u00057 : constant Version_32 := 16#b3e76777#;
   pragma Export (C, u00057, "system__ioS");
   u00058 : constant Version_32 := 16#cf909744#;
   pragma Export (C, u00058, "system__object_readerB");
   u00059 : constant Version_32 := 16#6942daaf#;
   pragma Export (C, u00059, "system__object_readerS");
   u00060 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00060, "interfaces__cB");
   u00061 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00061, "interfaces__cS");
   u00062 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00062, "system__val_lliB");
   u00063 : constant Version_32 := 16#b7817698#;
   pragma Export (C, u00063, "system__val_lliS");
   u00064 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00064, "system__val_lluB");
   u00065 : constant Version_32 := 16#63d1bbc9#;
   pragma Export (C, u00065, "system__val_lluS");
   u00066 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00066, "system__val_utilB");
   u00067 : constant Version_32 := 16#810526c6#;
   pragma Export (C, u00067, "system__val_utilS");
   u00068 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00068, "system__case_utilB");
   u00069 : constant Version_32 := 16#09acf9ef#;
   pragma Export (C, u00069, "system__case_utilS");
   u00070 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00070, "interfaces__c_streamsB");
   u00071 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00071, "interfaces__c_streamsS");
   u00072 : constant Version_32 := 16#931ff6be#;
   pragma Export (C, u00072, "system__exception_tracesB");
   u00073 : constant Version_32 := 16#097ab0a2#;
   pragma Export (C, u00073, "system__exception_tracesS");
   u00074 : constant Version_32 := 16#ce7de326#;
   pragma Export (C, u00074, "system__win32S");
   u00075 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00075, "system__wch_conB");
   u00076 : constant Version_32 := 16#36d8b2ea#;
   pragma Export (C, u00076, "system__wch_conS");
   u00077 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00077, "system__wch_stwB");
   u00078 : constant Version_32 := 16#1bc99eeb#;
   pragma Export (C, u00078, "system__wch_stwS");
   u00079 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00079, "system__wch_cnvB");
   u00080 : constant Version_32 := 16#396f0819#;
   pragma Export (C, u00080, "system__wch_cnvS");
   u00081 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00081, "system__wch_jisB");
   u00082 : constant Version_32 := 16#b91f1138#;
   pragma Export (C, u00082, "system__wch_jisS");
   u00083 : constant Version_32 := 16#5130abd7#;
   pragma Export (C, u00083, "ada__strings__unboundedB");
   u00084 : constant Version_32 := 16#4c956ffe#;
   pragma Export (C, u00084, "ada__strings__unboundedS");
   u00085 : constant Version_32 := 16#0b4a75ae#;
   pragma Export (C, u00085, "ada__strings__searchB");
   u00086 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00086, "ada__strings__searchS");
   u00087 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00087, "ada__tagsB");
   u00088 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00088, "ada__tagsS");
   u00089 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00089, "system__htableB");
   u00090 : constant Version_32 := 16#a96723d2#;
   pragma Export (C, u00090, "system__htableS");
   u00091 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00091, "system__string_hashB");
   u00092 : constant Version_32 := 16#0b3948ac#;
   pragma Export (C, u00092, "system__string_hashS");
   u00093 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00093, "system__val_unsB");
   u00094 : constant Version_32 := 16#098b0180#;
   pragma Export (C, u00094, "system__val_unsS");
   u00095 : constant Version_32 := 16#5b9edcc4#;
   pragma Export (C, u00095, "system__compare_array_unsigned_8B");
   u00096 : constant Version_32 := 16#84a6e1b5#;
   pragma Export (C, u00096, "system__compare_array_unsigned_8S");
   u00097 : constant Version_32 := 16#5f72f755#;
   pragma Export (C, u00097, "system__address_operationsB");
   u00098 : constant Version_32 := 16#3ea92e0b#;
   pragma Export (C, u00098, "system__address_operationsS");
   u00099 : constant Version_32 := 16#6a86c9a5#;
   pragma Export (C, u00099, "system__storage_pools__subpoolsB");
   u00100 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00100, "system__storage_pools__subpoolsS");
   u00101 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00101, "system__finalization_mastersB");
   u00102 : constant Version_32 := 16#7659a9f2#;
   pragma Export (C, u00102, "system__finalization_mastersS");
   u00103 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00103, "system__img_boolB");
   u00104 : constant Version_32 := 16#d87ce1d3#;
   pragma Export (C, u00104, "system__img_boolS");
   u00105 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00105, "ada__finalizationS");
   u00106 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00106, "ada__streamsB");
   u00107 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00107, "ada__streamsS");
   u00108 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00108, "ada__io_exceptionsS");
   u00109 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00109, "system__finalization_rootB");
   u00110 : constant Version_32 := 16#6257e3a8#;
   pragma Export (C, u00110, "system__finalization_rootS");
   u00111 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00111, "system__storage_poolsB");
   u00112 : constant Version_32 := 16#0e480e95#;
   pragma Export (C, u00112, "system__storage_poolsS");
   u00113 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00113, "system__storage_pools__subpools__finalizationB");
   u00114 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00114, "system__storage_pools__subpools__finalizationS");
   u00115 : constant Version_32 := 16#12218162#;
   pragma Export (C, u00115, "system__atomic_countersB");
   u00116 : constant Version_32 := 16#99f9bdb5#;
   pragma Export (C, u00116, "system__atomic_countersS");
   u00117 : constant Version_32 := 16#221eebf6#;
   pragma Export (C, u00117, "system__machine_codeS");
   u00118 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00118, "system__stream_attributesB");
   u00119 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00119, "system__stream_attributesS");
   u00120 : constant Version_32 := 16#9c33741b#;
   pragma Export (C, u00120, "globalsS");
   u00121 : constant Version_32 := 16#76eb9383#;
   pragma Export (C, u00121, "inputsB");
   u00122 : constant Version_32 := 16#6615249f#;
   pragma Export (C, u00122, "inputsS");
   u00123 : constant Version_32 := 16#ab966715#;
   pragma Export (C, u00123, "ada__command_lineB");
   u00124 : constant Version_32 := 16#d59e21a4#;
   pragma Export (C, u00124, "ada__command_lineS");
   u00125 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00125, "gnatS");
   u00126 : constant Version_32 := 16#084c16d0#;
   pragma Export (C, u00126, "gnat__regexpS");
   u00127 : constant Version_32 := 16#933fac2f#;
   pragma Export (C, u00127, "system__regexpB");
   u00128 : constant Version_32 := 16#0e9737f4#;
   pragma Export (C, u00128, "system__regexpS");
   u00129 : constant Version_32 := 16#dfa03552#;
   pragma Export (C, u00129, "system__strings__stream_opsB");
   u00130 : constant Version_32 := 16#55d4bd57#;
   pragma Export (C, u00130, "system__strings__stream_opsS");
   u00131 : constant Version_32 := 16#c0e7c6c9#;
   pragma Export (C, u00131, "ada__streams__stream_ioB");
   u00132 : constant Version_32 := 16#31fc8e02#;
   pragma Export (C, u00132, "ada__streams__stream_ioS");
   u00133 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00133, "system__communicationB");
   u00134 : constant Version_32 := 16#34c5c5ea#;
   pragma Export (C, u00134, "system__communicationS");
   u00135 : constant Version_32 := 16#b29d05bd#;
   pragma Export (C, u00135, "system__file_ioB");
   u00136 : constant Version_32 := 16#8ad4715d#;
   pragma Export (C, u00136, "system__file_ioS");
   u00137 : constant Version_32 := 16#9dd55695#;
   pragma Export (C, u00137, "system__os_libB");
   u00138 : constant Version_32 := 16#bf5ce13f#;
   pragma Export (C, u00138, "system__os_libS");
   u00139 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00139, "system__stringsB");
   u00140 : constant Version_32 := 16#531a815e#;
   pragma Export (C, u00140, "system__stringsS");
   u00141 : constant Version_32 := 16#d03a0a90#;
   pragma Export (C, u00141, "system__file_control_blockS");
   u00142 : constant Version_32 := 16#4e7c0d8c#;
   pragma Export (C, u00142, "outputsB");
   u00143 : constant Version_32 := 16#9021e276#;
   pragma Export (C, u00143, "outputsS");
   u00144 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00144, "ada__integer_text_ioB");
   u00145 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00145, "ada__integer_text_ioS");
   u00146 : constant Version_32 := 16#d5bfa9f3#;
   pragma Export (C, u00146, "ada__text_ioB");
   u00147 : constant Version_32 := 16#c3f01c15#;
   pragma Export (C, u00147, "ada__text_ioS");
   u00148 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00148, "ada__text_io__integer_auxB");
   u00149 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00149, "ada__text_io__integer_auxS");
   u00150 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00150, "ada__text_io__generic_auxB");
   u00151 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00151, "ada__text_io__generic_auxS");
   u00152 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00152, "system__img_biuB");
   u00153 : constant Version_32 := 16#df0164f6#;
   pragma Export (C, u00153, "system__img_biuS");
   u00154 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00154, "system__img_llbB");
   u00155 : constant Version_32 := 16#9ec67408#;
   pragma Export (C, u00155, "system__img_llbS");
   u00156 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00156, "system__img_lliB");
   u00157 : constant Version_32 := 16#3ceac5e9#;
   pragma Export (C, u00157, "system__img_lliS");
   u00158 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00158, "system__img_llwB");
   u00159 : constant Version_32 := 16#37aa579e#;
   pragma Export (C, u00159, "system__img_llwS");
   u00160 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00160, "system__img_wiuB");
   u00161 : constant Version_32 := 16#b140e364#;
   pragma Export (C, u00161, "system__img_wiuS");
   u00162 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00162, "system__val_intB");
   u00163 : constant Version_32 := 16#6500ba07#;
   pragma Export (C, u00163, "system__val_intS");
   u00164 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00164, "system__memoryB");
   u00165 : constant Version_32 := 16#74d8f60c#;
   pragma Export (C, u00165, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.communication%s
   --  system.communication%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.win32%s
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.regexp%s
   --  system.regexp%b
   --  gnat.regexp%s
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  globals%s
   --  inputs%s
   --  inputs%b
   --  outputs%s
   --  outputs%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
