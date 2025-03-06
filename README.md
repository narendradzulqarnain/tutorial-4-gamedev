# **Desain Level Baru: Parkour dan Rintangan Baru**

Level yang baru dirancang memiliki banyak *obstacle* jurang, sehingga *player* perlu melakukan **parkour**. Saya menambahkan rintangan **bomb** yang berjatuhan setiap **1 detik** di tempat yang acak.  

Implementasinya tidak jauh berbeda dengan **ikan** pada tutorial. Namun, saya menambahkan **animasi ledakan** sederhana. Ketika **bomb** bertabrakan dengan objek lain, *texture sprite* diubah dari **bomb** menjadi **fire particle**.

## **Kode Implementasi Bomb**  
```gdscript
func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
	else:
		$Sprite2D.texture = explosion
		await get_tree().create_timer(0.1).timeout()
		queue_free()
```

---

## **Penambahan Obstacle Blue Slime**  

Agar level ini berbeda dari sebelumnya, saya menambahkan *obstacle* baru berupa **entitas**, yaitu **Blue Slime**.  
- **Blue Slime** bergerak **mondar-mandir**.  
- **Berbalik arah** ketika bertabrakan dengan objek lain.  
- **Player kalah** jika bersentuhan dengan **slime**.  

### **Penggunaan Root Node: `CharacterBody2D`**  
*Root node* yang digunakan adalah `CharacterBody2D` karena pergerakannya lebih mudah diatur. Implementasinya mirip dengan *player*, tetapi **tidak menerima input** (pergerakannya tetap/fixed).

### **Kode Implementasi Blue Slime**  
```gdscript
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_wall():
		speed *= -1  
	sprite.play("default")
	velocity.x = speed  
	move_and_slide()
```

### **Pemberian Animasi pada Blue Slime**  
Untuk menyesuaikan **arah gerak karakter**, **sprite slime** akan **dibalik (flip)** berdasarkan kecepatan (`velocity`).

```gdscript
func _process(_delta):
	if velocity.x != 0:
		if velocity.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
```

---

## **Transisi Level dan Restart Level**  
Terakhir, saya menambahkan *script* pada *scene* **Win** dan **Lose** untuk mengatur transisi antar level serta *restart* level.  

```gdscript
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")
```
*Script* ini akan mengganti scene saat tombol spacebar ditekan.  
Bentuknya dapat disesuaikan sesuai **kondisi/level**.

---

## **Referensi**  
📖 [Godot Documentation](https://docs.godotengine.org/en/stable/)  
🎥 [Sprite Animation Tutorial](https://www.youtube.com/watch?v=Vwj_hX9h4zo)  

---



