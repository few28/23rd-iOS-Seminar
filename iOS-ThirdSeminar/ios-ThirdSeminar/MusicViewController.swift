//
//  MusicViewController.swift
//  ios-ThirdSeminar
//
//  Created by Leeseungsoo on 2018. 10. 27..
//  Copyright © 2018년 Leess. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet var musicTable: UITableView! //인터페이스 빌더에 있는 테이블뷰 아울렛입니다!
    @IBOutlet var editButton: UIBarButtonItem! //네비게이션바의 우측에 있는 버튼입니다. UIkit 스니펫 중에서 Bar Button Item을 끌어와서 네비게이션바에 추가할수있습니다.
    
    //테이블뷰에 들어가게 될 Music모델 타입의 배열을 하나 선언합니다.
    //Music 모델은 Music.swift에 선언되어 있습니다!
    var musicList: [Music] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setMusicData()
        
        //피커뷰와 같이 테이블뷰도 delegate와 dataSource를 위임받는 작업을 해줍니다.
        musicTable.delegate = self
        musicTable.dataSource = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //이 부분은 아래 부분의 didSelectRowAt 부분을 먼저 읽고 다시 와주세요!
        
        //didSelectRowAt 함수에서 해당 셀을 선택하고 음악 상세정보 뷰로 전환되었다가 다시 돌아오면
        //그 셀이 선택된 상태로 남아있는 현상을 해결해줍니다.
        //viewWillAppear안에 선언되어 뷰가 다시 나타날 때 아래 코드가 실행이 되고
        //현재 선택된 row의 인덱스를 가져와 그 인덱스에 해당하는 row를 이용해 deselect를 해줍니다.
        if let index = musicTable.indexPathForSelectedRow {
            musicTable.deselectRow(at: index, animated: true)
        }
    }
    
    //이 IBAction 함수는 네비게이션바에 있는 edit 버튼을 눌렀을 때 실행되는 함수입니다.
    @IBAction func setEditingModeTableView(_ sender: Any) {
        //현재 테이블 뷰가 editing mode인지 isEditing 상태를 통하여 확인하고
        //그에 따라서 테이블뷰의 editing mode를 설정합니다.
        if musicTable.isEditing {
            editButton.title = "edit"
            musicTable.setEditing(false, animated: true)
        } else {
            editButton.title = "done"
            musicTable.setEditing(true, animated: true)
        }
        
    }
    
}

//UITableViewDataSource를 채택합니다.
//앞에서 피커뷰를 공부하였다면 이제 delegate와 dataSource는 이해가 가겠죠?!
extension MusicViewController: UITableViewDataSource {
    
    //numberOfRowsInSection은 한 섹션에 해당하는 row의 개수를 설정해줍니다.
    //섹션이 한개라면 섹션 별로 다르게 처리할 필요없이 아래와 같이 바로 모델의 데이터 개수로 설정하면 됩니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    //cellForRowAt은 테이블뷰의 각 row에 cell 객체를 반환합니다.
    //강의자료에서 설명하였듯이 Reusable cell을 이용하여 cell객체를 관리합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell 객체를 선언합니다. reusable identifier를 제대로 설정해주는거 잊지마세요!
        let cell = musicTable.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        
        //각 row에 해당하는 cell의 데이터를 넣어주기위해 모델에서 music 데이터 하나를 선언합니다.
        let music = musicList[indexPath.row]
        
        //위에서 가져온 데이터를 각 cell에 넣어줍니다.
        cell.albumImg.image = music.albumImg
        cell.musicTitle.text = music.musicTitle
        cell.singer.text = music.singer
        
        //위의 과정을 마친 cell 객체를 반환합니다.
        return cell
    }
    
    
}

extension MusicViewController: UITableViewDelegate {
    
    //didSelectRowAt은 셀을 선택했을때 어떤 동작을 할지 설정해 줄 수 있습니다.
    //여기서는 셀을 선택하면 그에 해당하는 음악 상세페이지로 화면전환을 합니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //아래의 과정들은 화면전환에서 데이터 전달을 하는 방법과 동일합니다.
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        let music = musicList[indexPath.row]
        nextVC.albumImg = music.albumImg
        nextVC.musicTitle = music.musicTitle
        nextVC.singer = music.singer
        navigationController?.pushViewController(nextVC, animated: true)
    } //여기까지 보셨다면 잠깐 다시 위의 viewWillApear로!
    
    //canMoveRowAt은 테이블뷰의 row의 위치를 이동할 수 있는지 없는지 설정합니다.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //moveRowAt은 테이블뷰의 row의 위치가 변화하였을 때, 원하는 작업을 해줄 수 있습니다.
    //지금 이 프로젝트에서는 editing mode에서 row를 변화 시킴에 따라 이 함수가 실행됩니다.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //테이블뷰 의 row를 변화시키면 그에 따라 대응되는 모델(데이터)도 변화시켜주어야 합니다.
        //sourceIndexPath와 destinationIndexPath를 통해
        //이동을 시작한 index와 새롭게 설정된 index를 가져올 수 있습니다.
        let movingIndex = musicList[sourceIndexPath.row]
        musicList.remove(at: sourceIndexPath.row)
        musicList.insert(movingIndex, at: destinationIndexPath.row)
    }
    
    //commit editingStyle은 테이블뷰가 edit되어진 스타일에 따라 이벤트를 설정할 수 있습니다.
    //여기서는 editing mode에서 한개의 row를 delete 하였을 경우에 대한 동작을 설정하였습니다.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            musicList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//임의로 모델에 데이터를 넣어주는 작업입니다.
//실제로는 서버에서 데이터를 받아와 모델에 할당합니다.
extension MusicViewController {
    func setMusicData() {
        let music1 = Music(title: "삐삐", singer: "아이유", coverName: "album_iu")
        let music2 = Music(title: "가을 타나봐", singer: "바이브", coverName: "album_vibe")
        let music3 = Music(title: "고백", singer: "양다일", coverName: "album_yangdail")
        let music4 = Music(title: "하루도 그대를 사랑하지 않은 적이 없었다", singer: "임창정", coverName: "album_im")
        let music5 = Music(title: "Save (Feat. 팔로알토)", singer: "루피(Loopy)", coverName: "album_smtm7")
        let music6 = Music(title: "멋지게 인사하는 법 (Feat. 슬기)", singer: "Zion.T", coverName: "album_ziont")
        let music7 = Music(title: "IDOL", singer: "방탄소년단", coverName: "album_bts")
        let music8 = Music(title: "시간이 들겠지 (Feat. Colde)", singer: "로꼬", coverName: "album_loco")
        let music9 = Music(title: "모든 날, 모든 순간", singer: "폴킴", coverName: "album_paul")
        let music10 = Music(title: "Way Back Home", singer: "숀(SHAUN)", coverName: "album_shaun")
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
}
