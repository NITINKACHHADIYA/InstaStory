//
//  ViewController.swift
//  InstaStory
//
//  Created by Nitin Kachhadiya on 30/05/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var storyView: UICollectionView!
    private var stories:[Story] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        self.storyView.register(UINib(nibName: "StoryCell", bundle: nil), forCellWithReuseIdentifier: "StoryCell");
        
        stories.append(Story(storyId: 1, name: "Nitin", image: "profileImage5"));
        stories.append(Story(storyId: 2, name: "Fiona", image: "profileImage4"));
        stories.append(Story(storyId: 3, name: "John", image: "profileImage3"));
        stories.append(Story(storyId: 4, name: "Peter", image: "profileImage2"));
        stories.append(Story(storyId: 5, name: "Krunal", image: "profileImage1"));
        stories.append(Story(storyId: 6, name: "Nitin", image: "profileImage5"));
        stories.append(Story(storyId: 7, name: "Fiona", image: "profileImage4"));
        stories.append(Story(storyId: 8, name: "John", image: "profileImage3"));
        stories.append(Story(storyId: 9, name: "Peter", image: "profileImage2"));
        stories.append(Story(storyId: 10, name: "Krunal", image: "profileImage1"));
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.stories.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as? StoryCell else {
            return UICollectionViewCell();
        }
        
        let story = stories[indexPath.row];
        cell.setupCell(model: story)
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90.0, height: 105.0);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let story = self.stories[indexPath.row];
        story.animated = true;
        collectionView.reloadItems(at: [indexPath]);

        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { (_) in

            story.animated = false;
            story.statusViewed = true;
            collectionView.reloadItems(at: [indexPath]);
        }
        
    }
}
