extends Area2D  # Thay đổi thành StaticBody2D nếu bạn dùng StaticBody2D

# Thay đổi tên của signal nếu cần thiết
signal player_entered

func _ready():
	# Đảm bảo cánh cổng có thể phát hiện va chạm
	self.connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("player"):  # Kiểm tra xem đối tượng va chạm có thuộc nhóm "player" không
		get_tree().quit()  # Thoát game
