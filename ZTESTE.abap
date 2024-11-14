*&---------------------------------------------------------------------*
*& Report ZTESTE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zteste.

CLASS pai DEFINITION.
  " Privado: Só é acessado pela própria classe
  PROTECTED SECTION.
    DATA: atributo_protegido_pai TYPE string.
ENDCLASS.

CLASS filho DEFINITION INHERITING FROM pai.
  
  " Público: Pode ser acessado por qualquer código no programa
  PUBLIC SECTION.
    DATA: atributo_publico_filho TYPE string.
    METHODS: set_atributo_privado_filho IMPORTING valor TYPE string,
            get_atributo_privado_filho RETURNING VALUE(valor) TYPE string.

  " Protegido: Pode ser acessado pela própria classe e por seus filhos ( herana )
  PRIVATE SECTION.
    DATA: atributo_privado_filho TYPE string.

ENDCLASS.

CLASS pai IMPLEMENTATION.

ENDCLASS.

CLASS filho IMPLEMENTATION.
  METHOD set_atributo_privado_filho.
    atributo_privado_filho = valor.
  ENDMETHOD.

  METHOD get_atributo_privado_filho.
    valor = atributo_privado_filho.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  DATA: lo_filho TYPE REF TO filho.
  lo_filho = NEW filho( ).
  lo_filho->atributo_publico_filho = '123'.
  lo_filho->set_atributo_privado_filho( valor = '456' ).
  WRITE lo_filho->get_atributo_privado_filho( ).
