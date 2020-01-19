Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA559141D28
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jan 2020 10:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgASJnN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jan 2020 04:43:13 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:48557 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgASJnM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Jan 2020 04:43:12 -0500
Received: by mail-il1-f197.google.com with SMTP id u14so22806832ilq.15
        for <linux-omap@vger.kernel.org>; Sun, 19 Jan 2020 01:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=BRczTDviaeDTYez7KOKQz91MPq0sq1Vv8zv+kc9CGFY=;
        b=PSt1jXMF9fmsmPkjXaNsVIW8NNPaTr458Rm+aQARd1COnMhX8YAfIEpWRIu6nw/Mk1
         mfDKsVL3tCJYbZGnK+yipHyyTAVwwmUjSm0cW+M/z2wNdpc824MboEgIyRVfRNIQkUOq
         RBsZJ3pHzxPYYtNtWrX27Zzgl8myr8aOG3BmNAhItt20rxVBt5oQUhcuBJwZjGlmIN4u
         bz6xPoMAIj2Y6nwwqkQUZmP49w0/AxOLUdLhBgo2bCOiI5vsG39SOKp8lzAwm7asTndR
         lYOV64rnK2jlK+cayHYjHbxvtsDf5DcuX0SvcfHcrHsyRZEeFlkhRtld6V8RJCJ+5hJZ
         PN7Q==
X-Gm-Message-State: APjAAAUkBSvo8/fCE+SSsPWxGxNhG+Bvjnf1iMyg/dGMg5B1NiJZcxKX
        12YOUru+Q3UBGwOE7GYGtpk/S48A3oV/QGL4JxAnOtDNu+WZ
X-Google-Smtp-Source: APXvYqxRJpvjM5JY3HPtw4SSeYYGyt3BTK2lm+dpjQSdSGFX2T4NMrq384OFBw8/ldl/wdX6vviEk7HiCqq+7oDPg/j/rBdVYNKH
MIME-Version: 1.0
X-Received: by 2002:a6b:731a:: with SMTP id e26mr36446343ioh.254.1579426501752;
 Sun, 19 Jan 2020 01:35:01 -0800 (PST)
Date:   Sun, 19 Jan 2020 01:35:01 -0800
In-Reply-To: <000000000000e0ab4c059c79f014@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000095fe43059c7ae3f9@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in bitmap_port_ext_cleanup
From:   syzbot <syzbot+7b6206fb525c1f5ec3f8@syzkaller.appspotmail.com>
To:     a@unstable.cc, andrew@lunn.ch, b.a.t.m.a.n@lists.open-mesh.org,
        coreteam@netfilter.org, davem@davemloft.net,
        florent.fourcot@wifirst.fr, fw@strlen.de, grygorii.strashko@ti.com,
        j-keerthy@ti.com, jeremy@azazel.net, johannes.berg@intel.com,
        kadlec@netfilter.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, mareklindner@neomailbox.ch,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, sw@simonwunderlich.de,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

syzbot has bisected this bug to:

commit 2f9b0d93a9d3ec64558537ab5d7cff820886afa4
Author: Keerthy <j-keerthy@ti.com>
Date:   Mon Jun 24 05:16:19 2019 +0000

    net: ethernet: ti: cpsw: Fix suspend/resume break

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17fcf959e00000
start commit:   e02d9c4c Merge branch 'bnxt_en-fixes'
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1402f959e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1002f959e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e89bd00623fe71e
dashboard link: https://syzkaller.appspot.com/bug?extid=7b6206fb525c1f5ec3f8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16551cc9e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14a04966e00000

Reported-by: syzbot+7b6206fb525c1f5ec3f8@syzkaller.appspotmail.com
Fixes: 2f9b0d93a9d3 ("net: ethernet: ti: cpsw: Fix suspend/resume break")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
