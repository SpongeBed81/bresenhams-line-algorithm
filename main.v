import math

fn main() {
	mut max_x := 0
	mut max_y := 0
	mut table := ""
	//x , y
	inps := [3, 2, 15, 5]
	max_x = math.max(inps[0], inps[2])
	max_y = math.max(inps[1], inps[3])
	//y represents the height of the table
	//x represents the width of the table
	for _ in 0 .. max_y {
		for _ in 0 .. max_x {
			table += "#"
		}
		table += "\n"
	}
        table = bresenham(inps, table)
	println(table)
}

fn put(x int, y int, board string) string {
	mut splitb := board.split("\n")
	splitb = splitb.filter(it.len > 0)
	mut last := splitb[splitb.len - y]
	mut split_chars := last.split("")
	split_chars[x-1] = "."
	splitb[splitb.len - y] = split_chars.join("")
	return splitb.join("\n")
}

fn bresenham(inp []int, boardz string) string {
	mut board := boardz.clone()
	x1 := inp[0]
        y1 := inp[1]
	x2 := inp[2]
	y2 := inp[3]
	mut m_new := 2 * (y2	- y1)
	mut slope_error	:= m_new - (x2 - x1)
	mut y := y1
	for x in x1 .. x2+1 {
		board = put(x, y, board)
		slope_error += m_new
		if slope_error >= 0 {
			y = y + 1
			slope_error -= 2 * (x2 - x1)
		}
	}
	return board
}

