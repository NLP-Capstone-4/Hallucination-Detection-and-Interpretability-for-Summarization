import re
import amrlib
from datasets import load_dataset


def main():
    which_bart = 'large'
    samsum_test = load_dataset('samsum', split='test[:10]')
    stog = amrlib.load_stog_model(f'amr_models/model_parse_xfm_bart_{which_bart}-v0_1_0')
    
    print('parsing... whole dialog')
    parse_whole_dialogue(samsum_test, stog, which_bart)
    print('parsing... by utterance')
    parse_by_utterance(samsum_test, stog, which_bart)
    print('parsing... by utterance with mod')
    parse_by_utterance_with_mod(samsum_test, stog, which_bart)

def parse_whole_dialogue(samsum_test, stog, which_bart):
    f = open(f'samsum10/samsum-amr-whole-bart-{which_bart}.txt', 'w')
    dialog_graphs = stog.parse_sents(samsum_test['dialogue'])
    summary_graphs = stog.parse_sents(samsum_test['summary'])
    for dg, sg in zip(dialog_graphs, summary_graphs):
        f.write(str(dg))
        f.write('\n')
        f.write(f"{'*' * 30}\n")
        f.write(str(sg))
        f.write('\n\n')
        f.write(f"{'-' * 60}\n")
    f.close()

def parse_by_utterance(samsum_test, stog, which_bart):
    f = open(f'samsum10/samsum-amr-by-utterance-bart-{which_bart}.rb', 'w')
    summary_graphs = stog.parse_sents(samsum_test['summary'])
    for idx, dialogue in enumerate(samsum_test['dialogue']):
        speaker_sents = re.split(r'\r?\n', dialogue)
        speaker_sents = [sent.strip() for sent in speaker_sents]
        dialog_graphs = stog.parse_sents(speaker_sents)
        f.write(f'#{idx}\n')
        for speaker_sent_graph in dialog_graphs:
            f.write(f"{str(speaker_sent_graph)}\n")
        f.write(f"#{'*' * 30}\n")
        f.write(f"{str(summary_graphs[idx])}\n")
        f.write(f"#{'-' * 60}\n")
    f.close()

def parse_by_utterance_with_mod(samsum_test, stog, which_bart):
    f = open(f'samsum10/samsum-amr-by-utterance-mod-bart-{which_bart}.rb', 'w')
    summary_graphs = stog.parse_sents(samsum_test['summary'])
    for idx, dialogue in enumerate(samsum_test['dialogue']):
        speaker_sents = re.split(r'\r?\n', dialogue)
        speaker_sents = [sent.strip() for sent in speaker_sents]
        mod_speaker_sents = []
        for speaker_sent in speaker_sents:
            if len(speaker_sent) < 3:
                continue
            mod_speaker_sents.append(mod(speaker_sent))
        dialog_graphs = stog.parse_sents(mod_speaker_sents)
        f.write(f'#{idx}\n')
        for speaker_sent_graph in dialog_graphs:
            f.write(f"{str(speaker_sent_graph)}\n")
        f.write(f"#{'*' * 30}\n")
        f.write(f"{str(summary_graphs[idx])}\n")
        f.write(f"#{'-' * 60}\n")
    f.close()

def mod(speaker_sent):
    special_m = re.search(r'<\w+_?\w+>', speaker_sent)  # search special tokens e.g. <file_gif>
    m = re.match(r'(\w+.{0,2}\w+)\s?:\s?(.+)', speaker_sent)  # match speaker and utterance
    if special_m:
        match special_m.group():
            case '<file_gif>':
                return f'{m.group(1)} sends a GIF.'
            case '<file_photo>':
                return f'{m.group(1)} sends a photo.'
            case '<file_other>':
                return f'{m.group(1)} sends a file.'
            case '<file_video>':
                return f'{m.group(1)} sends a video.'
            case '<link>' | '<file_link>':
                return f'{m.group(1)} sends a link.'
            case _:
                return f'{m.group(1)} sends a file.'
    return f'{m.group(1)} says, \"{m.group(2)}\"'


if __name__ == '__main__':
    main()
