Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4482D43AF
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 15:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgLIN7H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Dec 2020 08:59:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27674 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726508AbgLIN7H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Dec 2020 08:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607522260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=DeJICkmUhNlMDPR60YNJsvyrM89/RB2B3sOMO3Orpnc=;
        b=jM5bbl2NMOz5cGGsAa3q++GW3BkSK2ONnTD4bo3bquYt4AagruggRu9+ZAfFEka2rb5X40
        vxSJL1S5o5TVWAam5a5AH1l43oiOu+uGiAGgJ6+M5BhjL4sCD2HnmqYa7omFTCogB5KBI5
        DUCBOA3BCMq/anKgxbOmmL6db2Gun3E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-yVAlDy5RNHCI-tqfcMQleQ-1; Wed, 09 Dec 2020 08:57:39 -0500
X-MC-Unique: yVAlDy5RNHCI-tqfcMQleQ-1
Received: by mail-wr1-f72.google.com with SMTP id w8so682937wrv.18
        for <linux-omap@vger.kernel.org>; Wed, 09 Dec 2020 05:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=DeJICkmUhNlMDPR60YNJsvyrM89/RB2B3sOMO3Orpnc=;
        b=gIGX0OKWAa7bUlByBPAgMi81OzRlmregXg65B12txo5tFh4xRDTOM8YoMxOGr+DXZR
         PCLKXR/ZvIL7daOaxwkcKtb+wjvC7tPHiJ3erTEAbNttREgo4wDzIET6qH+9XawL++Xk
         PO4Yst/17qVGWGTCSVw3unWG+kksfJTE9JkJ/82P3DkSGq2og4wYeL45toEA4S91TQo7
         obgz0fgb74C4ttsLqLNPCy9xffJI8O4dl9UtS0FR3sHUii4RryUPhAh3vO9ulaSFKtuf
         oI5A3YIIMm1GZI7K3hKALtsRB/TqoRqTSjqUUSD5pWgo9XfZvnl+mxcS5PqAthR2KOXV
         O/gg==
X-Gm-Message-State: AOAM532n44x/X+yARwB/++m87usL0cyShVv8OjpbkW83jfbWYxm/ix5D
        E+HsDGxuj6hzxHA7zSS3bJ/hPJaKtexa2QavUbQfRE+Gq20nrwJ1ta5+vMKe35dcVtF9YrSiVde
        4QdM21LmGty0J8afNPzQiHw==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr2809532wrv.427.1607522257604;
        Wed, 09 Dec 2020 05:57:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyidXDr7AGB88RVIa+qRbPwe75cFxUfdyia554wfcWfHyTBhIc9MtCkfrARVIyBxhWAKdS3PQ==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr2809518wrv.427.1607522257401;
        Wed, 09 Dec 2020 05:57:37 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id m21sm3556677wml.13.2020.12.09.05.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 05:57:36 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 7C78F180003; Wed,  9 Dec 2020 14:57:36 +0100 (CET)
Subject: [PATCH bpf v4 0/7] selftests/bpf: Restore test_offload.py to working
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
Date:   Wed, 09 Dec 2020 14:57:36 +0100
Message-ID: <160752225643.110217.4104692937165406635.stgit@toke.dk>
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

Changelog:

v4:
- Accidentally truncated the Fixes: hashes in patches 3/4 to 11 chars

v3:
- Add Fixes: tags

v2:
- Replace xdp_attachment_flags_ok() with a check in dev_xdp_attach()
- Better packing of struct nsim_dev

---

Toke Høiland-Jørgensen (7):
      xdp: remove the xdp_attachment_flags_ok() callback
      selftests/bpf/test_offload.py: Remove check for program load flags match
      netdevsim: Add debugfs toggle to reject BPF programs in verifier
      selftests/bpf/test_offload.py: only check verifier log on verification fails
      selftests/bpf/test_offload.py: fix expected case of extack messages
      selftests/bpf/test_offload.py: reset ethtool features after failed setting
      selftests/bpf/test_offload.py: filter bpftool internal map when counting maps


 drivers/net/netdevsim/bpf.c                 | 12 ++++-
 drivers/net/netdevsim/netdevsim.h           |  1 +
 tools/testing/selftests/bpf/test_offload.py | 53 +++++++++++----------
 3 files changed, 40 insertions(+), 26 deletions(-)

