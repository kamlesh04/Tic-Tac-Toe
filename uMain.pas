unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TfrmMain = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    lblHeader: TLabel;
    recMain: TRectangle;
    rec1: TRectangle;
    rec2: TRectangle;
    rec3: TRectangle;
    rec4: TRectangle;
    rec5: TRectangle;
    rec6: TRectangle;
    rec7: TRectangle;
    rec8: TRectangle;
    rec9: TRectangle;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    recX: TRectangle;
    lblSelectChar: TLabel;
    recO: TRectangle;
    lblX: TLabel;
    lblO: TLabel;
    btnRefresh: TButton;
    lblPlayAgain: TLabel;
    procedure recOClick(Sender: TObject);
    procedure recXClick(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    FInitLetter, FPlayer1 : char;
    FGameOver : boolean;
    FCountTurns : integer;
    procedure InsertXorO(sender : TObject);
    function CheckWinner(Achar : char): char;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  i : integer;
begin
  FGameOver := false;
  FCountTurns := 0;
  for i := 0 to recMain.ChildrenCount -1 do
  begin
    if (recMain.Children.Items[i] is TRectangle) then
    begin
      if not (((recMain.Children.Items[i] as TRectangle).Name = 'recX') or
          (((recMain.Children.Items[i] as TRectangle).Name = 'recO'))) then
      begin
      ((recMain.Children.Items[i] as TRectangle).Children.Items[0] as TLabel).HitTest := true;
      ((recMain.Children.Items[i] as TRectangle).Children.Items[0] as TLabel).Text:= '';
      end;
    end;
  end;
  recX.HitTest := true;
  recO.HitTest := true;
  recO.Fill.Color := TAlphaColors.Beige;
  recX.Fill.Color := TAlphaColors.Beige;

end;

function TfrmMain.CheckWinner(Achar : char): char;
begin
  if Achar = 'X' then
  begin
    if (lbl1.Text = 'X') and (lbl2.Text = 'X') and (lbl3.Text = 'X') then
      Result := 'X'
    else if (lbl1.Text = 'X') and (lbl4.Text = 'X') and (lbl7.Text = 'X') then
      Result := 'X'
    else if (lbl1.Text = 'X') and (lbl5.Text = 'X') and (lbl9.Text = 'X') then
      Result := 'X'
    else if (lbl2.Text = 'X') and (lbl5.Text = 'X') and (lbl8.Text = 'X') then
      Result := 'X'
    else if (lbl3.Text = 'X') and (lbl6.Text = 'X') and (lbl9.Text = 'X') then
      Result := 'X'
    else if (lbl3.Text = 'X') and (lbl5.Text = 'X') and (lbl7.Text = 'X') then
      Result := 'X'
    else if (lbl4.Text = 'X') and (lbl5.Text = 'X') and (lbl6.Text = 'X') then
      Result := 'X'
    else if (lbl7.Text = 'X') and (lbl8.Text = 'X') and (lbl9.Text = 'X') then
      Result := 'X'
    else if (lbl2.Text = 'X') and (lbl5.Text = 'X') and (lbl8.Text = 'X') then
      Result := 'X'
  end
  else
  begin
    if (lbl1.Text = 'O') and (lbl2.Text = 'O') and (lbl3.Text = 'O') then
      Result := 'O'
    else if (lbl1.Text = 'O') and (lbl4.Text = 'O') and (lbl7.Text = 'O') then
      Result := 'O'
    else if (lbl1.Text = 'O') and (lbl5.Text = 'O') and (lbl9.Text = 'O') then
      Result := 'O'
    else if (lbl2.Text = 'O') and (lbl5.Text = 'O') and (lbl8.Text = 'O') then
      Result := 'O'
    else if (lbl3.Text = 'O') and (lbl6.Text = 'O') and (lbl9.Text = 'O') then
      Result := 'O'
    else if (lbl3.Text = 'O') and (lbl5.Text = 'O') and (lbl7.Text = 'O') then
      Result := 'O'
    else if (lbl4.Text = 'O') and (lbl5.Text = 'O') and (lbl6.Text = 'O') then
      Result := 'O'
    else if (lbl7.Text = 'O') and (lbl8.Text = 'O') and (lbl9.Text = 'O') then
      Result := 'O'
    else if (lbl2.Text = 'O') and (lbl5.Text = 'O') and (lbl8.Text = 'O') then
      Result := 'O'
  end;
  FCountTurns := FCountTurns + 1;
end;

procedure TfrmMain.InsertXorO(sender: TObject);
var
  lwinner : char;
begin
  if FGameOver then
  begin
    if FGameOver then
      ShowMessage('Game Over!!');
    exit
  end;

  if FInitLetter <> #0 then
  begin
    (sender as TLabel).Text := FInitLetter;
    //check for winner
    lwinner := CheckWinner(FInitLetter);

    if lwinner <> #0 then
    begin
      if (lwinner = FPlayer1 )  then
        ShowMessage('Player 1 won!!')
      else
        ShowMessage('Player 2 won!!') ;
      FInitLetter := #0;
      FGameOver := true;
      exit
    end
    else
    begin
      if FInitLetter = 'X'  then
        FInitLetter := 'O'
      else
        FInitLetter := 'X';
      (Sender as TLabel).HitTest := false;
      recX.HitTest := false;
      recO.HitTest := false;
    end;

    //Check for draw game
    if FCountTurns = 9 then
    begin
       ShowMessage('Draw Game! Try Again!!');
       exit
    end;
  end
  else
    ShowMessage('Select your choice!!');
end;

procedure TfrmMain.lbl1Click(Sender: TObject);
begin
  InsertXorO(Sender);
end;

procedure TfrmMain.recOClick(Sender: TObject);
begin
  if recO.Fill.Color = TAlphaColors.Beige then
  begin
    recO.Fill.Color := TAlphaColors.Greenyellow;
    recX.Fill.Color := TAlphaColors.Beige;
    FInitLetter := 'O';
    FPlayer1 := FInitLetter;
  end;
end;

procedure TfrmMain.recXClick(Sender: TObject);
begin
  if recX.Fill.Color = TAlphaColors.Beige then
  begin
    recX.Fill.Color := TAlphaColors.Greenyellow;
    recO.Fill.Color := TAlphaColors.Beige;
    FInitLetter := 'X';
    FPlayer1 := FInitLetter;
  end;
end;

end.
