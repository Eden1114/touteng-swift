//
//  PostListView.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/6.
//

import SwiftUI

struct PostListView: View {
    @State var postlist:PostList
    
    func loadList(category:String, request_type: String, response_extra:String) -> Void {
        
        NetworkAPI.getList(parameters:
                            ["category":category,
                             "request_type": request_type,
                             "response_extra":response_extra]) { result in
            switch result {
            case let .success(postlist):
                self.postlist = postlist
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        return NavigationView {
            List {
                ForEach(self.postlist.data.indices) { index in NavigationLink(
                    destination: FullArticleView(webViewStore: WebViewStore(), url: postlist.data[index].article_url)
                    ) {
                        ArticleView(article: postlist.data[index])
                }
                }
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        let postlistData:Data = """
        {"code":0,"message":"success","tips":"推荐引擎有10条更新","extra":"123","has_more":true,"data":[{"article_url":"https://m.toutiao.com/a6951333674851942950","author_info":{"avatar":"http://p1-dy.bytexservice.com/origin/pgc-image/acce69d4feb44235852525655ca958e0","user_name":"魏医生在线"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/14eddd01aa824a8695e1833ca69b532c~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/14eddd01aa824a8695e1833ca69b532c~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/29f9742328484fe0bae682b6153854a8~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/29f9742328484fe0bae682b6153854a8~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/883f0619e414444a953b0f93823930c1~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/883f0619e414444a953b0f93823930c1~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951333674851942950","publish_time":1618488177,"title":"脑梗来临，睡觉先知？医生提醒：睡觉出现“5个异常”，小心脑梗"},{"article_url":"https://m.toutiao.com/a6951552891010187790","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/4120003d07666f0b34b","user_name":"电影烂番茄"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/83b8d2f2c2324ea2ba1d2bfb47ff2ab5~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/83b8d2f2c2324ea2ba1d2bfb47ff2ab5~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/a19120c33bf743278573c42484f8282a~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/a19120c33bf743278573c42484f8282a~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/9a604ee7c354447f85ea6725827e5a93~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/9a604ee7c354447f85ea6725827e5a93~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951552891010187790","publish_time":1618541644,"title":"王思聪拱手，罗志祥拜服，杭州女海王的花式劈腿让我三观碎地"},{"article_url":"https://m.toutiao.com/a6951394811794424333","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/db0500148a500abba2e4","user_name":"环球风云弹"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/7b94a0cab2ea4ba8bbc127911829b281~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/7b94a0cab2ea4ba8bbc127911829b281~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/7700029b4c2e4d4a87a234fa84cb329f~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/7700029b4c2e4d4a87a234fa84cb329f~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/cd2dcac6f4ed41b98240a88544f4e7c3~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/cd2dcac6f4ed41b98240a88544f4e7c3~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951394811794424333","publish_time":1618498981,"title":"今天，美国四路并进，集中火力针对中国"},{"article_url":"https://m.toutiao.com/a6951568080451568136","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/pgc-image/2f20f58aab044201a1008d922b7b4b18","user_name":"中国网"},"cell_type":0,"covers":[{"height":540,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SKS0j0C6E8rGJU~tplv-tt-cs0:960:540.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SKS0j0C6E8rGJU~tplv-tt-shrink:1080:0.image?from=feed","width":960}],"gid":"6951568080451568136","publish_time":1618538070,"title":"澳媒8连发揭露美西方涉疆诡计，赵立坚：写得非常好"},{"article_url":"https://m.toutiao.com/a6951331814422151684","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/tos-cn-i-0813/3c28a213b5af40768cc7ef5e1f02008c","user_name":"环球调查局"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/3c93818b352b46b4a6da57eec61d62f6~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/3c93818b352b46b4a6da57eec61d62f6~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/daadb5057ab14a67bf4eb06f66e20661~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/daadb5057ab14a67bf4eb06f66e20661~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/9044b2f8dda149c4b4baee3741d95684~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/9044b2f8dda149c4b4baee3741d95684~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951331814422151684","publish_time":1618483982,"title":"不支持乌克兰了？美军舰“临阵脱逃”，英法德选边站，俄转变态度"},{"article_url":"https://m.toutiao.com/a6951597834114286087","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/ff12000064157fe339f4","user_name":"极昼plus"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/94242b1e0068436292d6590b0bec780e~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/94242b1e0068436292d6590b0bec780e~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/596d1ae1a13548668d26e1f84fb7a1dc~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/596d1ae1a13548668d26e1f84fb7a1dc~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/abfb31b9bed0488d96f555ce343e66d8~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/abfb31b9bed0488d96f555ce343e66d8~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951597834114286087","publish_time":1618545552,"title":"64名中国船员被困海上赌船一年：有人身上长癣，女孩拿刀追人"},{"article_url":"https://m.toutiao.com/a6951276420219814439","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/pgc-image/bc1e393dbbfb43e3bc8372a5d9e0f756","user_name":"奇闻观察室"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/3cf1a1aabe15488ba67398d8dbbe8300~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/3cf1a1aabe15488ba67398d8dbbe8300~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/ef87968a50264f25878caf037943a0af~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/ef87968a50264f25878caf037943a0af~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/26c29fb31dac4e05865577a63ff3e929~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/26c29fb31dac4e05865577a63ff3e929~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951276420219814439","publish_time":1618496525,"title":"亚裔女子在豪宅内死亡，美国警方表示：从来没见过如此离奇的案件"},{"article_url":"https://m.toutiao.com/a6951335074499707423","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/pgc-image/775445e90f87495eae38d28525a5b873","user_name":"津云锋声"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/354fbd909e954dfa8e212613b55be45d~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/354fbd909e954dfa8e212613b55be45d~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/56f310de01ad48c0b7cb45ce2f54d41a~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/56f310de01ad48c0b7cb45ce2f54d41a~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/f7f412ad168c4e0abc086b41cd2fb12f~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/f7f412ad168c4e0abc086b41cd2fb12f~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951335074499707423","publish_time":1618486168,"title":"湖北男子返乡扫墓遇害：嫌犯曾认罪并供述不为人知细节，家属质疑为何被判无罪"},{"article_url":"https://m.toutiao.com/a6951385787833254413","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/ca2000539631fc1d01d","user_name":"南方周末"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhLfHs0z3Hh~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhLfHs0z3Hh~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhMYbFpHJv~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhMYbFpHJv~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhNHGTrydHV~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhNHGTrydHV~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951385787833254413","publish_time":1618495627,"title":"河南首富“豪赌”世界养猪工厂"},{"article_url":"https://m.toutiao.com/a6951649641809330726","author_info":{"avatar":"http://p1-dy.bytexservice.com/large/pgc-image/05c3cd5569b944fd8727790baae04aa4","user_name":"利刃号"},"cell_type":0,"covers":[{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/6549db88da2c469f8252a26f36ca7641~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/6549db88da2c469f8252a26f36ca7641~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/d93b4132c1d74462b1017cf38da58c75~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/d93b4132c1d74462b1017cf38da58c75~tplv-tt-shrink:1080:0.image?from=feed","width":300},{"height":196,"url":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/5efc4280e9c94eb6945e027e989a00aa~tplv-tt-cs0:300:196.image?from=feed","url_large":"http://p1-tt-ipv6.byteimg.com/img/pgc-image/5efc4280e9c94eb6945e027e989a00aa~tplv-tt-shrink:1080:0.image?from=feed","width":300}],"gid":"6951649641809330726","publish_time":1618557551,"title":"俄防长：已做好与西方全面开战的准备！美英法德：千万别冲动"}]}

        """.data(using: String.Encoding.utf8)!
        let postlist = try! JSONDecoder().decode(PostList.self, from: postlistData)
        PostListView(postlist: postlist)
//        ArticleView(article: postlist.data[0])
    }
}
