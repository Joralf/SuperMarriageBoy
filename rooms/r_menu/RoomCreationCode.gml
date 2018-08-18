audio_stop_sound(sound_level)
if !audio_is_playing(sound_smb_intro_music)
{
	audio_play_sound(sound_smb_intro_music, 12, true);
}