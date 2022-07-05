//
//  JYReaderManager.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

@objc public protocol JYReaderChapterData: AnyObject {
    var chapterText: String {get}
    
    var chapterPageTexts: [String] {get set}
}

@objc public protocol JYReaderDatasource: AnyObject {
    func nextChapterData() -> String?
}

@objc public protocol JYReaderViewSource: AnyObject {
    var chapterData: [JYReaderChapterData] {get set}
 
}

@objc public enum JYReaderScrollType: Int {
    /// 滚动
    case scroll
    
    /// 平移
    case pan
    
}

protocol JYReaderManagerDetectAction: AnyObject {
    func turnReaderScrollType(type: JYReaderScrollType)
}

@objc public class JYReaderManager: NSObject {
    
    static let shared = JYReaderManager()
    
    weak var delegate: JYReaderManagerDetectAction?
    
    var readerController: JYReaderViewSource?
    
    @objc public var chapterData: [JYReaderChapterData] = [] {
        didSet {
            //TODO: reload data
            readerController?.chapterData = chapterData
        }
    }
    @objc public var scrollType: JYReaderScrollType = .scroll {
        didSet {
            //TODO: reload data
            self.delegate?.turnReaderScrollType(type: scrollType)
        }
    }
}

@objc extension JYReaderManager {
    /// 生成阅读器主控制器
    @objc public func generateReaderView() -> JYReaderController {
        return JYReaderController(readerManager: self)
    }
}


class ChapterData: JYReaderChapterData {

    var content: String = ""
   
    init(content: String) {
        self.content = content
    }
    var chapterText: String {
        content
    }
    var chapterPageTexts: [String] = []
    
    
    static let chapterDatas: [ChapterData] = chapterTexts.map {
        ChapterData(content: "-----------\n\($0)")
    }
}


let chapterTexts = [
"""
It was a five-hour trip. He dined aboard the train with little desire for food, the July evening being oppressive, and a thunder storm brewing1 over the Hudson. It burst in the vicinity of Fishkill with a lively display of lightning, deluging2 the Catskills with rain. And when he changed to a train on the Mohawk division the cooler air was agreeably noticeable.

He changed trains again at Orangeville, and here the night breeze was delightful3 and the scent4 of rain-soaked meadows came through the open car window.
 
It was nearly ten o’clock and already, ahead, he caught sight of the lights of Neeland’s Mills. Always the homecoming was a keen delight to him; and now, as he stepped off the train, the old familiar odours were in his nostrils—the unique composite perfume of the native place which never can be duplicated elsewhere.
 
All the sweet and aromatic5 and homely6 smells of earth and land and water came to him with his first deep-drawn breath. The rank growth of wild flowers and weeds were part of it—the flat atmosphere of the mill pond, always redolent of water weed and lily pads, tinctured it; distant fields of buckwheat added heavier perfume.
 
Neither in the quaint7 brick feed mill nor in the lumber8 mill were there any lights, but in his own home, almost buried among tall trees and vines, the light streamed from the sitting-room9 windows.158
 
From the dark yard two or three dogs barked at him, then barked again in a different key, voicing an excited welcome; and he opened the picket10 gate and went up the path surrounded by demonstrative setters and pointers, leaping and wagging about him and making a vast amount of noise on the vine-covered verandah as he opened the door, let himself into the house, and shut them out.
 
“Hello, dad!” he said, crossing swiftly to where his father sat by the reading lamp.
 
Their powerful grip lingered. Old Dick Neeland, ruddy, white-haired, straight as a pine, stood up in his old slippers11 and quilted smoking coat, his brier pipe poised12 in his left hand.
 
“Splendid, Jim. I’ve been thinking about you this evening.” He might have added that there were few moments when his son was not in his thoughts.
 
“Are you all right, dad?”
 
“Absolutely. You are, too, I see.”
 
They seated themselves.
 
“Hungry, Jim?”
 
“No; I dined aboard.”
 
“You didn’t telegraph me.”
 
“No; I came at short notice.”
 
“Can’t you stay?”
 
“Dad, I have a drawing-room reserved for the midnight tonight, and I am sailing on the Volhynia tomorrow at nine in the morning!”
 
“God bless me! Why, Jim?”
 
“Dad, I’ll tell you all I know about it.”
 
His father sat with brier pipe suspended and keen blue eyes fixed13 on his son, while the son told everything he knew about the reason for his flying trip to Paris.
 
“You see how it is, don’t you, dad?” he ended. “The 159Princess has been a good and loyal friend to me. She has used her influence; I have met, through her, the people I ought to know, and they have given me work to do. I’m in her debt; I’m under real obligation to her. And I’ve got to go, that’s all.”
 
Old Dick Neeland’s clear eyes of a sportsman continued to study his son’s face.
 
“Yes, you’ve got to go,” he said. He smoked for a few moments, then: “What the devil does it mean, anyway? Have you any notion, Jim?”
 
“No, I haven’t. There seems to be some military papers in this box that is mentioned. Evidently they are of value to somebody. Evidently other people have got wind of that fact and desire to obtain them for themselves. It almost seems as though something is brewing over there—trouble of some sort between Germany and some other nation. But I haven’t heard of anything.”
 
His father continued to smoke for a while, then:
 
“There is something brewing over there, Jim.”
 
“I hadn’t heard,” repeated the young man.
 
“I haven’t either, directly. But in my business some unusual orders have come through—from abroad. Both France and Germany have been making inquiries14 through agents in regard to shipments of grain and feed and lumber. I’ve heard of several very heavy rush orders.”
 
“What on earth could cause war?”
 
“I can’t see, Jim. Of course Austria’s attitude toward Servia is very sullen15. But outside of that I can see no trouble threatening.
 
“And yet, the Gayfield woollen mill has just received an enormous order for socks and underwear from the French Government. They’re running all night now. 160And another thing struck me: there has been a man in this section buying horses for the British Government. Of course it’s done now and then, but, taking this incident with the others which have come to my personal knowledge, it would seem as though something were brewing over in Europe.
""",
"""
Jim’s perplexed16 eyes rested on his father; he shook his youthful head slightly:
 
“I can’t see why,” he said. “But if it’s to be France and Germany again, why my sympathy is entirely17 for France.”
 
“Naturally,” nodded his father.
 
Their Irish ancestors had fought for Bonaparte, and for the Bourbons before him. And, cursed with cousins, like all Irish, they were aware of plenty of Neelands in France who spoke18 no English.
 
Jim rose, glanced at his watch:
 
“Dad, I’ll just be running over to Brookhollow to get that box. I haven’t such a lot of time, if I’m to catch the midnight train at Orangeville.”
 
“I should say you hadn’t,” said his father.
 
He was disappointed, but he smiled as he exchanged a handclasp with his only son.
 
“You’re coming right back from Paris?”
 
“Next steamer. I’ve a lot of work on hand, thank goodness! But that only puts me under heavier obligations to the Princess Mistchenka.”
 
“Yes, I suppose so. Anything but ingratitude19, Jim. It’s the vilest20 vice21 of ’em all. They say it’s in the Irish blood—ingratitude. They must never prove it by a Neeland. Well, my boy—I’m not lonesome, you understand; busy men have no time to be lonesome—but run up, will you, when you get back?”
 
“You bet I will.”161
 
“I’ll show you a brace22 of promising23 pups. They stand rabbits, still, but they won’t when the season is over.”
 
“Blue Bird’s pups?”
 
“Yes. They take after her.”
 
“Fine! I’ll be back for the shooting, anyway. Many broods this season?”
 
“A fair number. It was not too wet.”
 
For a moment they lingered, smiling at each other, then Jim gave his father’s hand a quick shake, picked up his suitcase, turned.
 
“I’ll take the runabout, dad. Someone from the Orangeville garage will bring it over in the morning.”
 
He went out, pushed his way among the leaping dogs to the garage, threw open the doors, and turned on the electric light.
 
A slim and trim Snapper runabout stood glistening24 beside a larger car and two automobile25 trucks. He exchanged his straw hat for a cap; placed hat and suitcase in the boot; picked up a flash light from the work-table, and put it into his pocket, cranked the Snapper, jumped in, ran it to the service entrance, where his father stood ready to check the dogs and close the gates after him.
 
“Good-bye, dad!” he called out gaily26.
 
“Good-bye, my son.”
""",
"""
From the road, just before he descended1 to cross the bridge into Brookhollow, he caught a gleam of light straight ahead. For a moment it did not occur to him that there was anything strange in his seeing a light in the old Carew house. Then, suddenly, he realised that a light ought not to be burning behind the lowered shades of a house which was supposed to be empty and locked.
 
His instant impulse was to put on his brakes then and there, but the next moment he realised that his car must already have been heard and seen by whoever had lighted that shaded lamp. The car was already on the old stone bridge; the Carew house stood directly behind the crossroads ahead; and he swung to the right into the creek2 road and sped along it until he judged that neither his lights nor the sound of his motor could be distinguished3 by the unknown occupant of the Carew house.
 
Then he ran his car out among the tall weeds close to the line of scrub willows4 edging the creek; extinguished his lights, including the tail-lamp; left his engine running; stood listening a moment to the whispering whirr of his motor; then, taking the flash light from his pocket, he climbed over the roadside wall and ran back across the pasture toward the house.
 
As he approached the old house from the rear, no crack of light was visible, and he began to think he 163might have been mistaken—that perhaps the dancing glare of his own acetylenes on the windows had made it seem as though they were illuminated5 from within.
 
Cautiously he prowled along the rear under the kitchen windows, turned the corner, and went to the front porch.
 
He had made no mistake; a glimmer6 was visible between the edge of the lowered shade and the window casing.
 
Was it some impudent7 tramp who had preëmpted this lonely house for a night’s lodging8? Was it, possibly, a neighbour who had taken charge in return for a garden to cultivate and a place to sleep in? Yet, how could it be the latter when he himself had the keys to the house? Moreover, such an arrangement could scarcely have been made by Rue10 Carew without his being told of it.
 
Then he remembered what the Princess Mistchenka had said in her cable message, that somebody might break into the house and steal the olive-wood box unless he hastened to Brookhollow and secured it immediately.
 
Was this what was being done now? Had somebody broken in for that purpose? And who might it be?
 
A slight chill, not entirely11 agreeable, passed over Neeland. A rather warm sensation of irritation12 succeeded it; he mounted the steps, crossed the verandah, went to the door and tried the knob very cautiously. The door was locked; whoever might be inside either possessed13 a key that fitted or else must have entered by forcing a window.
 
But Neeland had neither time nor inclination14 to prowl around and investigate; he had a duty to fulfil, a train to catch, and a steamer to connect with the next morning. Besides, he was getting madder every second.164
 
So he fitted his key to the door, careless of what noise he made, unlocked and pushed it open, and started to cross the threshold.
 
Instantly the light in the adjoining room grew dim. At the same moment his quick ear caught a sound as though somebody had blown out the turned-down flame; and he found himself facing total darkness.
 
“Who the devil’s in there!” he called, flashing his electric pocket lamp. “Come out, whoever you are. You’ve no business in this house, and you know it!” And he entered the silent room.
 
His flash light revealed nothing except dining-room furniture in disorder15, the doors of a cupboard standing16 open—one door still gently swinging on its hinges.
 
The invisible hand that had moved it could not be far away. Neeland, throwing his light right and left, caught a glimpse of another door closing stealthily, ran forward and jerked it open. His lamp illuminated an empty passageway; he hurried through it to the door that closed the farther end, tore it open, and deluged17 the sitting-room18 with his blinding light.
 
Full in the glare, her face as white as the light itself, stood a woman. And just in time his eyes caught the glitter of a weapon in her stiffly extended hand; and he snapped off his light and ducked as the level pistol-flame darted19 through the darkness.
 
The next second he had her in his grasp; held her writhing20 and twisting; and, through the confused trample21 and heavy breathing, he noticed a curious crackling noise as though the clothing she wore were made of paper.
 
The struggle in pitch darkness was violent but brief; she managed to fire again as he caught her right arm and felt along it until he touched the desperately22 165clenched pistol. Then, still clutching her closed fingers, he pulled the flash light from his side pocket and threw its full radiance straight into her face.
 
“Let go your pistol,” he breathed.
 
She strove doggedly23 to retain it, but her slender fingers slowly relaxed under his merciless grip; the pistol fell; and he kicked the pearl-handled, nickel-plated weapon across the dusty board floor.
 
They both were panting; her right arm, rigid24, still remained in his powerful clutch. He released it presently, stepped back, and played the light over her from head to foot.
 
She was deathly white. Under her smart straw hat, which had been pushed awry25, the contrast between her black hair and eyes and her chalky skin was startling.
 
“What are you doing in this house?” he demanded, still breathing heavily from exertion26 and excitement.
 
She made an effort:
 
“Is it your house?” she gasped27.
 
“It isn’t yours, is it?” he retorted.
 
She made no answer.
 
“Why did you shoot at me?”
 
She lifted her black eyes and stared at him. Her breast rose and fell with her rapid breathing, and she placed both hands over it as though to quiet it.
 
“Come,” he said, “I’m in a hurry. I want an explanation from you––”
 
The words died on his lips as she whipped a knife out of her bosom28 and flew at him. Through the confusion of flash light and darkness they reeled, locked together, but he caught her arm again, jerking it so violently into the air that he lifted her off her feet.
 
“That’s about all for tonight,” he panted, twisting the knife out of her helpless hand and flinging it 166behind him. Without further ceremony, he pulled out his handkerchief, caught her firmly, reached for her other arm, jerked it behind her back, and tied both wrists. Then he dragged a chair up and pushed her on it.
 
Her hat had fallen off, and her hair sagged29 to her neck. The frail30 stuff of which her waist was made had been badly torn, too, and hung in rags from her right shoulder.
 
“Who are you?” he demanded.
 
As she made no reply, he went over and picked up the knife and the pistol. The knife was a silver-mounted Kurdish dagger31; the engraved32 and inlaid blade appeared to be dull and rusty33. He examined it for a few moments, glanced inquiringly at her where she sat, pale and mute on the chair, with both wrists tied behind her.
 
“You seem to be a connoisseur34 of antiques,” he said. “Your dagger is certainly a collector’s gem9, and your revolver is equally out of date. I recommend an automatic the next time you contemplate35 doing murder.”
 
Walking up to her he looked curiously36 into her dark eyes, but he could detect no expression in them.
 
“Why did you come here?” he demanded.
 
No answer.
 
“Did you come to get an olive-wood box bound with silver?”
 
A slight colour tinted37 the ashy pallor under her eyes.
 
He turned abruptly38 and swept the furniture with his searchlight, and saw on a table her coat, gloves, wrist bag, and furled umbrella; and beside them what appeared to be her suitcase, open. It had a canvas and leather cover: he walked over to the table, turned back the cover of the suitcase and revealed a polished box 167of olive wood, heavily banded by some metal resembling silver.
 
Inside the box were books, photographs, a bronze Chinese figure, which he recognised as the Yellow Devil, a pair of revolvers, a dagger very much like the one he had wrested39 from her. But there were no military plans there.
 
He turned to his prisoner:
 
“Is everything here?” he asked sharply.
 
“Yes.”
 
He picked up her wrist bag and opened it, but discovered only some money, a handkerchief, a spool40 of thread and packet of needles.
 
There was a glass lamp on the table. He managed to light it finally; turned off his flash light, and examined the contents of the box again thoroughly41. Then he came back to where she was seated.
 
“Get up,” he said.
 
She looked at him sullenly42 without moving.
 
“I’m in a hurry,” he repeated; “get up. I’m going to search you.”
 
At that she bounded to her feet.
 
“What!” she exclaimed furiously.
 
But he caught hold of her, held her, untied43 the handkerchief, freeing her wrists.
 
“Now, pull out those papers you have concealed44 under your clothing,” he said impatiently. And, as she made no motion to comply: “If you don’t, I’ll do it for you!”
 
“You dare lay your hand on me!” she flamed.
 
“You treacherous45 little cat, do you think I’ll hesitate?” he retorted. “Do you imagine I retain any respect for you or your person? Give me those papers!”
 
“I have no papers!”168
 
“You are lying. Listen to me once for all; I’ve a train to catch and a steamer to catch, and I’m going to do both. And if you don’t instantly hand out those papers you’ve concealed I’ll have no more compunction in taking them by force than I’d have in stripping an ear of corn! Make up your mind and make it up quick!”
 
“You mean you’d strip—me!” she stammered46, scarlet47 to her hair.
 
“That’s what I mean, you lying little thief. That’s just what I mean. Kick and squall as you like, I’ll take those papers with me if I have to take your clothing too!”
 
Breathless, infuriated, she looked desperately around her, caught sight of the Kurdish dagger, leaped at it; and for the third time found herself struggling in his arms.
 
“Don’t!” she gasped. “Let me go! I—I’ll give you what you want––”
 
“Do you mean it?”
 
“Yes.”
 
He released the dishevelled girl, who shrank away from him. But the devil himself glowed in her black eyes.
 
“Go out of the room,” she said, “if I’m to get the papers for you!”
 
“I can’t trust you,” he answered. “I’ll turn my back.” And he walked over to the olive-wood box, where the weapons lay.
 
Standing there he heard, presently, the rustle48 of crumpling49 papers, heard a half-smothered sob50, waited, listening, alert for further treachery on her part.
 
“Hurry!” he said.169
 
A board creaked.
 
“Don’t move again!” he cried. The floor boards creaked once more; and he turned like a flash to find her in her stocking feet, already halfway51 to where he stood. In either hand she held out a bundle of papers; and, as they faced each other, she took another step toward him.
 
“Stand where you are,” he warned her. “Throw those papers on the floor!”
 
“I––”
 
“Do you hear!”
 
Looking him straight in the eyes she opened both hands; the papers fell at her feet, and with them dropped the two dagger-like steel pins which had held her hat.
 
“Now, go and put on your shoes,” he said contemptuously, picking up the papers and running over them. When he had counted them, he came back to where she was standing.
 
“Where are the others?”
 
“What others?”
 
“The remainder of the papers! You little devil, they’re wrapped around your body! Go into that pantry! Go quick! Undress and throw out every rag you wear!”
 
She drew a deep, quivering breath, turned, entered the pantry and closed the door. Presently the door opened a little and her clothing dropped outside in a heap.
 
There were papers in her stockings, papers stitched to her stays, basted52 inside her skirts. A roll of drawings traced on linen53 lay on the floor, still retaining the warmth of her body around which they had been wrapped.170
 
He pulled the faded embroidered54 cover from the old piano and knocked at the pantry door.
 
“Put that on,” he said, “and come out.”
 
She emerged, swathed from ankle to chin, her flushed face shadowed by her fallen mass of dark hair. He turned his flash light on the cupboard, but discovered nothing more. Then he picked up her hat, clothes, and shoes, laid them on the pantry shelf, and curtly55 bade her go back and dress.
 
“May I have the lamp and that looking glass?”
 
“If you like,” he said, preoccupied56 with the papers.
 
While she was dressing57, he repacked the olive-wood box. She emerged presently, carrying the lamp, and he took it from her hurriedly, not knowing whether she might elect to throw it at his head.
 
While she was putting on her jacket he stood watching her with perplexed58 and sombre gaze.
 
“I think,” he remarked, “that I’ll take you with me and drop you at the Orangeville jail on my way to town. Be kind enough to start toward the door.”
 
As she evinced no inclination to stir he passed one arm around her and lifted her along a few feet; and she turned on him, struggling, her face convulsed with fury.
 
“Keep your insolent59 hands off me,” she said. “Do you hear?”
 
“Oh, yes, I hear.” He nodded again toward the door. “Come,” he repeated impatiently; “move on!”
 
She hesitated; he picked up the olive-wood box, extinguished the lamp, opened his flash, and motioned with his head, significantly. She walked ahead of him, face lowered.
 
Outside he closed and locked the door of the house.
 
“This way,” he said coldly. “If you refuse, I’ll pick 171you up and carry you under my arm. I think by this time you realise I can do it, too.”
 
Halfway across the dark pasture she stopped short in her tracks.
 
“Have I got to carry you?” he demanded sharply.
 
“Don’t have me locked up.”
 
“Why not?”
 
“I’m not a—a thief.”
 
“Oh! Excuse me. What are you?”
 
“You know. Don’t humiliate60 me.”
 
“Answer my question! What are you if you’re not a lady crook61?”
 
“I’m employed—as you are! Play the game fairly.” She halted in the dark pasture, but he motioned her to go forward.
 
“If you don’t keep on walking,” he said, “I’ll pick you up as I would a pet cat and carry you. Now, then, once more, who are you working for? By whom are you employed, if you’re not a plain thief?”
"""
]
