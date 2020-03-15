Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB7B185AAC
	for <lists+linux-omap@lfdr.de>; Sun, 15 Mar 2020 06:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgCOFtF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sun, 15 Mar 2020 01:49:05 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:50659 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbgCOFtF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Mar 2020 01:49:05 -0400
Received: by mail-io1-f69.google.com with SMTP id d16so9486246iop.17
        for <linux-omap@vger.kernel.org>; Sat, 14 Mar 2020 22:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:content-transfer-encoding;
        bh=FJOATGVgF+RB8AvqptT57xQBCVKN+MlPkIh/jxrUb5Y=;
        b=cCkuJLibb1gKcUa9X/ZuIDXp2ChBjVxMQ2AIQbKRRiiRKdJnq8jSPgtFqrOnH9s7Jd
         FyUYwCt25WfF8s8arWC7UoF7NmyDy8vvkKiQfSuTueI+ABCtmozTjcKhjToJZxNzgtGP
         /gSI7ZoiT1GPkvf8+NQCcgESHqzy6tOsXvnWYpCb3L7x0AkyfrLdE72cs8/trMn/ZhZa
         bh8xPQbnxX6SnFxDBNcsAnZSGYE31MVaO5mmbt53zcb+V9MopWm8i99+x4qNivMCP3uE
         emlkqMxg/b+F4rllLOZmVckcN/IEyR0D3Wh95BdWjfgBN70D4plP0madNibq8xZZPTef
         0t+g==
X-Gm-Message-State: ANhLgQ3FnMeofQ0JDk01QOz0EJRBg8KoN6JrajKpwQ7dknQO93ClII6V
        5KAkWrfEryOhAQryN5+0iNBf3gBeQCQJMfFhQ24fVYk1fXHB
X-Google-Smtp-Source: ADFU+vtjWrHuYWHmtJ+7R/F21gT5LEveKjWUsRf8UObsGMOlzh5S+x+bzsUNrMqUqBppbPPWer/sA+tMDrmnP8e3gzLvu8ysJS2P
MIME-Version: 1.0
X-Received: by 2002:a92:5e14:: with SMTP id s20mr101812ilb.101.1584251342473;
 Sat, 14 Mar 2020 22:49:02 -0700 (PDT)
Date:   Sat, 14 Mar 2020 22:49:02 -0700
In-Reply-To: <000000000000e0ab4c059c79f014@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000080d06405a0de4277@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bitmap_port_ext_cleanup
From:   syzbot <syzbot+7b6206fb525c1f5ec3f8@syzkaller.appspotmail.com>
To:     a@unstable.cc, andrew@lunn.ch, b.a.t.m.a.n@lists.open-mesh.org,
        coreteam@netfilter.org, davem@davemloft.net,
        florent.fourcot@wifirst.fr, fw@strlen.de, grygorii.strashko@ti.com,
        j-keerthy@ti.com, jeremy@azazel.net, johannes.berg@intel.com,
        kadlec@blackhole.kfki.hu, kadlec@netfilter.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        mareklindner@neomailbox.ch, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, pablo@netfilter.org,
        sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit 32c72165dbd0e246e69d16a3ad348a4851afd415
Author: Kadlecsik József <kadlec@blackhole.kfki.hu>
Date:   Sun Jan 19 21:06:49 2020 +0000

    netfilter: ipset: use bitmap infrastructure completely

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=122e7c1de00000
start commit:   d5d359b0 Merge branch 'for-linus' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=cf8e288883e40aba
dashboard link: https://syzkaller.appspot.com/bug?extid=7b6206fb525c1f5ec3f8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15909f21e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=141a1611e00000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: netfilter: ipset: use bitmap infrastructure completely

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
