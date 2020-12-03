Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9474B2CE0DE
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 22:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387762AbgLCVgv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 16:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20617 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729394AbgLCVgv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 16:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607031324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2hjENq5PBqAj5ZyDy1YdPKW4hQcF6Bo4mZqU9xYjYxs=;
        b=YBUbAyYyCnBqeT0+ujfI2WEM+jX8P684kCclbNH4UfuCp4cN27J4iRmFG6ogylg78R2ipy
        MnaWpNzLPnDUVTyh4Vy7PsL90jEANcjyVvRU+sZ+AxY/Nk89MqctVRaefaa5c1alrie0vx
        vm2Td8avl4CgoLga3ExZ4WeB/FTp0Gw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-2hY4P80BPRSoo-5UdzhJuA-1; Thu, 03 Dec 2020 16:35:20 -0500
X-MC-Unique: 2hY4P80BPRSoo-5UdzhJuA-1
Received: by mail-qv1-f71.google.com with SMTP id 102so2833640qva.0
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 13:35:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=2hjENq5PBqAj5ZyDy1YdPKW4hQcF6Bo4mZqU9xYjYxs=;
        b=ptnH5HiVlRrrd3/ZPc4t8QLJ3HykX7thU5kZjIkgtPIaL3gNaECAllfawaoEPqmRUv
         2PkXXiqZraZDoGFlCAi9622tNZsiivpcX5q7eDDnGWkyB9RSqTsK1GHN7zKfPAq/rbTf
         JrPiw1di7jH/jMhsPUaoMVk1ejR704Ea1pRBmNUcyhrAk5FmOk+rrlcOPKSxmezJHpX9
         Hns6CNpgn8h/ur+MeEHaUR+lrigUjT0VCABBrSJ+XoHBf6WxA1xSvCE6tJ3pH+Ar612c
         H8AS+h6bMPuDDTR01fA02iQOUJOOsdUoHIMdQwwC0TRmD42YZj+8JAPsmesAqkcJziaI
         LGzA==
X-Gm-Message-State: AOAM532QZYsUBsMC0RdFGhnBLbbU7UfogEWUZl/YNRE3OpCq1EGf17NF
        H5hsBzz6F/Sn872M4okybeJBHxpwCDjlwJ9mAYAk0B5SnLtM4mSyYmdE9Sgkgu9FoxKAq7Vb9NN
        htUsRa6iEqVUt44GU6veiAQ==
X-Received: by 2002:a05:620a:990:: with SMTP id x16mr5154609qkx.316.1607031320135;
        Thu, 03 Dec 2020 13:35:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2l9NcgawV3L4H9UBAIhZxeD2lOOgRBccfU64KRJt4/85GYNO8Fo05jgzrW/YvPq6hpfuiqw==
X-Received: by 2002:a05:620a:990:: with SMTP id x16mr5154584qkx.316.1607031319859;
        Thu, 03 Dec 2020 13:35:19 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id y189sm3019686qka.30.2020.12.03.13.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:35:19 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 2D1C3181CF8; Thu,  3 Dec 2020 22:35:17 +0100 (CET)
Subject: [PATCH bpf 0/7] selftests/bpf: Restore test_offload.py to working
 order
From:   =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andriin@fb.com>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <apais@linux.microsoft.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Simon Horman <simon.horman@netronome.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Jiri Benc <jbenc@redhat.com>, oss-drivers@netronome.com,
        linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Date:   Thu, 03 Dec 2020 22:35:17 +0100
Message-ID: <160703131710.162669.9632344967082582016.stgit@toke.dk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series restores the test_offload.py selftest to working order. It seems a
number of subtle behavioural changes have crept into various subsystems which
broke test_offload.py in a number of ways. Most of these are fairly benign
changes where small adjustments to the test script seems to be the best fix, but
one is an actual kernel bug that I've observed in the wild caused by a bad
interaction between xdp_attachment_flags_ok() and the rework of XDP program
handling in the core netdev code.

Patch 1 fixes the bug by removing xdp_attachment_flags_ok(), and the reminder of
the patches are adjustments to test_offload.py, including a new feature for
netdevsim to force a BPF verification fail. Please see the individual patches
for details.

---

Toke Høiland-Jørgensen (7):
      xdp: remove the xdp_attachment_flags_ok() callback
      selftests/bpf/test_offload.py: Remove check for program load flags match
      netdevsim: Add debugfs toggle to reject BPF programs in verifier
      selftests/bpf/test_offload.py: only check verifier log on verification fails
      selftests/bpf/test_offload.py: fix expected case of extack messages
      selftests/bpf/test_offload.py: reset ethtool features after failed setting
      selftests/bpf/test_offload.py: filter bpftool internal map when counting maps


 .../ethernet/netronome/nfp/nfp_net_common.c   |  6 ---
 drivers/net/ethernet/ti/cpsw_priv.c           |  3 --
 drivers/net/netdevsim/bpf.c                   | 15 ++++--
 drivers/net/netdevsim/netdevsim.h             |  1 +
 include/net/xdp.h                             |  2 -
 net/core/xdp.c                                | 12 -----
 tools/testing/selftests/bpf/test_offload.py   | 49 +++++++++----------
 7 files changed, 35 insertions(+), 53 deletions(-)

