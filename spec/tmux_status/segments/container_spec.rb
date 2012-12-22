require 'spec_helper'

describe TmuxStatus::Segments::Container do
  let(:segments)  { [ stub(to_s: '[1]'), stub(to_s: '[2]') ] }
  let(:options)   { { direction: @direction } }
  let(:direction) { :left }
  subject { described_class.new(segments, options) }

  before { @direction = :left }

  describe '#output' do
    it 'returns nil when no segments visible' do
      subject.stubs(any_visible?: false)

      expect(subject.output).to be_nil
    end

    it 'returns joined segments with glues if any segment visible' do
      subject.stubs(segments_with_glues: ['a', 'b', 'c'])
      subject.stubs(any_visible?: true)

      expect(subject.output).to eq('abc')
    end
  end

  describe '#segments_with_glues' do
    it 'zips glues with visible_segments if direction is left' do
      @direction = :left
      subject.stubs(glues: %w(g g))
      subject.stubs(visible_segments: %w(s s))

      expect(subject.segments_with_glues).to eq(%w(g s g s))
    end

    it 'zips visible_segments with glues if direction is right' do
      @direction = :right
      subject.stubs(glues: %w(g g))
      subject.stubs(visible_segments: %w(s s))

      expect(subject.segments_with_glues).to eq(%w(s g s g))
    end
  end

  describe '#glues' do
    before do
      subject.stubs(visible_segments: %w(a b))
    end

    let(:glues) { subject.glues }

    context 'when direction is left' do
      before do
        @direction = :left
        subject.stubs(left_edge_glue: '[left]')
      end

      it 'first glue should be left edge glue' do
        expect(glues[0]).to eq('[left]')
      end

      it 'second glue should be glue for 1st and 2nd segment' do
        expect(glues[1].segments).to eq(%w(a b))
        expect(glues[1].direction).to eq(:left)
      end
    end

    it 'when direction is right'
  end

  describe '#visible_segments' do
    let(:visible)  { stub(blank?: false) }
    let(:blank)    { stub(blank?: true) }
    let(:segments) { [visible, blank] }

    it 'returns only present segments' do
      expect(subject.visible_segments).to eq([visible])
    end
  end

  context 'with some non-blank segments' do
    let(:first) { stub_everything(blank?: false) }
    let(:last)  { stub_everything(blank?: false) }
    let(:segments) { [first, last] }

    %w(left right).map(&:to_sym).each do |direction|
      context "when direction is #{direction}" do
        before { @direction = direction }

        it '#right_edge_glue returns glue last visible segment and container' do
          glue = subject.right_edge_glue

          expect(glue.segments.first).to eq(last)
          expect(glue.segments.last).to eq(subject)
        end

        it '#left_edge_glue returns glue of container and first visible segment' do
          glue = subject.left_edge_glue

          expect(glue.segments.first).to eq(subject)
          expect(glue.segments.last).to eq(first)
        end
      end
    end

  end
end
