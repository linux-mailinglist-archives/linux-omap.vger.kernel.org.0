Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A56A2CE0E0
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 22:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389381AbgLCVg6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 16:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46596 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389348AbgLCVg4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 16:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607031330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PTgt64JimZPJAfS0azcJyT5Hi69osAbP/LoiBoFsy8w=;
        b=QAQw3DHS8txGJo/wq4GcYt+mfLKRUl4XTypDgDu78jEURp7yjN1Vv9wQfjq4usBq/X3mQ9
        ooJrJZmIZxFa9RwydTiNpf0uKPxRItERkW7NEYel1MatR/6TcnRGAHuBdSJCVrfeES4nu9
        HbgcDHOfjJ2qSG3DG0qNdQBkXAWhtT0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-HhsRrbp5PiixGPloZcjqww-1; Thu, 03 Dec 2020 16:35:26 -0500
X-MC-Unique: HhsRrbp5PiixGPloZcjqww-1
Received: by mail-qv1-f71.google.com with SMTP id i2so2831803qvb.2
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 13:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PTgt64JimZPJAfS0azcJyT5Hi69osAbP/LoiBoFsy8w=;
        b=eA1/ZPg8TWCosSuv8Hu1LnA+vltcYILLph4Q1ARIzZq9vxHrLJYxUQ6WcWnnuEuXed
         sOSCylAKXc+clIkBtsbLkn9v93vtSBdyntfjWm8z2C96ExOHwUNOC92CzterGh+zhkXT
         SqoyhgPS1A05spm4SzXzvsHJmZVgrmtIoXBIQcv8n2WbYL6n4kSn2/dSBX17cyL8nEy4
         0Ztr+UU9PNVP5xmePSE+tBtkiPCTUlro24D75EZ9UzGA2VuxhPDXprSHERFcEDe87//W
         lJ/mEaVcEv53Wi8DStVK6ODxVDM7md9Pr5tfKRTK5dMFi8rF+KznGDhwIDbLSsrDx3BU
         ztIQ==
X-Gm-Message-State: AOAM530CXMi7EY2x9SoqYSDlPNkwh5oYsvuUQDsbQCNC+9v7PHe/RAoo
        f6QKo55T8bgn9g85z+yIgu2/vafE9eOvhlcbnnd8RBPfM6Me4sV0GWebldEDejfSO1gaYZRmfo1
        c7tSee2eStVebJ3XSSnUymg==
X-Received: by 2002:a05:620a:10a3:: with SMTP id h3mr5238082qkk.459.1607031326257;
        Thu, 03 Dec 2020 13:35:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzy9GQDy+cijqSCW+9W5nUJfm+RHoN1wNqylY2fwJyS9UHaqVAcN4FgNBoHUM9SzN0bMGGmUA==
X-Received: by 2002:a05:620a:10a3:: with SMTP id h3mr5238025qkk.459.1607031325675;
        Thu, 03 Dec 2020 13:35:25 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id f8sm2339143qtp.91.2020.12.03.13.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:35:24 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 9ED7D1843EF; Thu,  3 Dec 2020 22:35:22 +0100 (CET)
Subject: [PATCH bpf 5/7] selftests/bpf/test_offload.py: fix expected case of
 extack messages
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
Date:   Thu, 03 Dec 2020 22:35:22 +0100
Message-ID: <160703132255.162669.6025526680043801946.stgit@toke.dk>
In-Reply-To: <160703131710.162669.9632344967082582016.stgit@toke.dk>
References: <160703131710.162669.9632344967082582016.stgit@toke.dk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Toke Høiland-Jørgensen <toke@redhat.com>

Commit 7f0a838254bd ("bpf, xdp: Maintain info on attached XDP BPF programs
in net_device") changed the case of some of the extack messages being
returned when attaching of XDP programs failed. This broke test_offload.py,
so let's fix the test to reflect this.

Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 tools/testing/selftests/bpf/test_offload.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_offload.py b/tools/testing/selftests/bpf/test_offload.py
index 6f8ff2f27027..5b0fe8e0b2d2 100755
--- a/tools/testing/selftests/bpf/test_offload.py
+++ b/tools/testing/selftests/bpf/test_offload.py
@@ -998,7 +998,7 @@ try:
                               fail=False, include_stderr=True)
     fail(ret == 0, "Replaced XDP program with a program in different mode")
     check_extack(err,
-                 "native and generic XDP can't be active at the same time.",
+                 "Native and generic XDP can't be active at the same time.",
                  args)
 
     start_test("Test MTU restrictions...")
@@ -1029,7 +1029,7 @@ try:
     offload = bpf_pinned("/sys/fs/bpf/offload")
     ret, _, err = sim.set_xdp(offload, "drv", fail=False, include_stderr=True)
     fail(ret == 0, "attached offloaded XDP program to drv")
-    check_extack(err, "using device-bound program without HW_MODE flag is not supported.", args)
+    check_extack(err, "Using device-bound program without HW_MODE flag is not supported.", args)
     rm("/sys/fs/bpf/offload")
     sim.wait_for_flush()
 

