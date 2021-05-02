from mrjob.job import MRJob


class MRDiabeticRetinopathyCount(MRJob):
    def mapper(self, _, line):
        image, stage = line.split(',')
        if image == 'image':
            return

        num, image = image.split('_')
        has_dr = 'both' if int(stage) > 0 else 'none'

        yield has_dr, int(num)
        yield image + ' ' + stage, 1
        yield 'Mean', int(stage)
        yield 'Tot', 1

    def reducer(self, key, values):
        if key == 'Mean':
            val_sum = 0
            tot = 0
            for p in values:
                val_sum += p
                tot += 1
            yield key, val_sum/tot
        elif key in ['both', 'none']:
            values = list(values)
            non_unique_ids = [
                i for i in values if values.count(i) > 1
            ]
            yield key, int(len(non_unique_ids)/2)
        else:
            yield key, sum(values)


if __name__ == '__main__':
    MRDiabeticRetinopathyCount.run()
