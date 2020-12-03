Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1922CE0E4
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 22:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387801AbgLCVg5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 16:36:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55355 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389381AbgLCVg5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 16:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607031330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OspxR8nxroXzKoAByQKtvrhTzOZb9bKKpD2rIyWg0Bw=;
        b=XwZ7EUK8pQEcGWjNXvUL3iWkUolFKwj4M3iifhAOEgNLQE0dF1PI8/ZH6R/IAA6pQkx0Gb
        cAt5uD5BqWjan3Z2+NifcsvCu31VPuV2sV5uF1JB5TRaWZfLGyeIAzK6GPy1eEKiZKSJHa
        +QdkboWhjcPQLvSfY0u4P2pyPFbn248=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-der5VV4OPZiFOaZIWrMwvA-1; Thu, 03 Dec 2020 16:35:29 -0500
X-MC-Unique: der5VV4OPZiFOaZIWrMwvA-1
Received: by mail-qt1-f199.google.com with SMTP id t17so2713941qtp.3
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 13:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OspxR8nxroXzKoAByQKtvrhTzOZb9bKKpD2rIyWg0Bw=;
        b=hnUELivhqi80FGMkEPKProrRYYxN3hqbh/SewMqfoj3fbfjt188+OITMc/8USxX6iJ
         dNklPD9W5myc1yUtAlMpqMTQlEr2obu2QH9EI5spxppw/t+eXEChODLBNtXowLqnpE2w
         0FMyprLvYxE36MMG/3c03G6K5ZcYZ5tc8aht2Ynu/Y0K45E47sH1WjT0trfuNjyFelHh
         v/IKh5vaPJNwLnpabhTFiDBJZ5YGt8ma7fE4/PpCSCuzyQ0ptW6hFPOsMosAtQP4q1gD
         5urZr6nuAuHBW65WNohJUYjQ2r6Ms+T2GLic87Fzuk3CbDGw3r21D1FgDnO9k7WHJnGp
         SKXA==
X-Gm-Message-State: AOAM532Dum6TBO0hE9LlCTd2q5uTfLRL8OOZDIvaDzeDhSZHPWQUamkP
        hb4ScX+rSxAf1qb2wpe3043X/Zph5L31OeMZDu69etuWimqkcWcFvcwc4nJnEMAAKJ7MZssyGOS
        N/bzWQHaUCrrvCq5lAWh3dg==
X-Received: by 2002:a37:4854:: with SMTP id v81mr5204186qka.20.1607031328687;
        Thu, 03 Dec 2020 13:35:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/SJA9fM5UcB2THmOJfZjkHU1sPRMmEkRZN3cfIodhNnsPMKTfttELv6baAorjBowVQySTyw==
X-Received: by 2002:a37:4854:: with SMTP id v81mr5204152qka.20.1607031328232;
        Thu, 03 Dec 2020 13:35:28 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id i3sm2468015qtv.23.2020.12.03.13.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:35:24 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 8744B1843EB; Thu,  3 Dec 2020 22:35:21 +0100 (CET)
Subject: [PATCH bpf 4/7] selftests/bpf/test_offload.py: only check verifier
 log on verification fails
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
Date:   Thu, 03 Dec 2020 22:35:21 +0100
Message-ID: <160703132146.162669.15903502405321937636.stgit@toke.dk>
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

Since 6f8a57ccf85 ("bpf: Make verifier log more relevant by default"), the
verifier discards log messages for successfully-verified programs. This
broke test_offload.py which is looking for a verification message from the
driver callback. Change test_offload.py to use the toggle in netdevsim to
make the verification fail before looking for the verification message.

Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 tools/testing/selftests/bpf/test_offload.py |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_offload.py b/tools/testing/selftests/bpf/test_offload.py
index 7afe259c785f..6f8ff2f27027 100755
--- a/tools/testing/selftests/bpf/test_offload.py
+++ b/tools/testing/selftests/bpf/test_offload.py
@@ -905,11 +905,18 @@ try:
 
     sim.tc_flush_filters()
 
+    start_test("Test TC offloads failure...")
+    sim.dfs["dev/bpf_bind_verifier_accept"] = 0
+    ret, _, err = sim.cls_bpf_add_filter(obj, verbose=True, skip_sw=True,
+                                         fail=False, include_stderr=True)
+    fail(ret == 0, "TC filter did not reject with TC offloads enabled")
+    check_verifier_log(err, "[netdevsim] Hello from netdevsim!")
+    sim.dfs["dev/bpf_bind_verifier_accept"] = 1
+
     start_test("Test TC offloads work...")
     ret, _, err = sim.cls_bpf_add_filter(obj, verbose=True, skip_sw=True,
                                          fail=False, include_stderr=True)
     fail(ret != 0, "TC filter did not load with TC offloads enabled")
-    check_verifier_log(err, "[netdevsim] Hello from netdevsim!")
 
     start_test("Test TC offload basics...")
     dfs = simdev.dfs_get_bound_progs(expected=1)
@@ -1026,6 +1033,15 @@ try:
     rm("/sys/fs/bpf/offload")
     sim.wait_for_flush()
 
+    start_test("Test XDP load failure...")
+    sim.dfs["dev/bpf_bind_verifier_accept"] = 0
+    ret, _, err = bpftool_prog_load("sample_ret0.o", "/sys/fs/bpf/offload",
+                                 dev=sim['ifname'], fail=False, include_stderr=True)
+    fail(ret == 0, "verifier should fail on load")
+    check_verifier_log(err, "[netdevsim] Hello from netdevsim!")
+    sim.dfs["dev/bpf_bind_verifier_accept"] = 1
+    sim.wait_for_flush()
+
     start_test("Test XDP offload...")
     _, _, err = sim.set_xdp(obj, "offload", verbose=True, include_stderr=True)
     ipl = sim.ip_link_show(xdp=True)
@@ -1033,7 +1049,6 @@ try:
     progs = bpftool_prog_list(expected=1)
     prog = progs[0]
     fail(link_xdp["id"] != prog["id"], "Loaded program has wrong ID")
-    check_verifier_log(err, "[netdevsim] Hello from netdevsim!")
 
     start_test("Test XDP offload is device bound...")
     dfs = simdev.dfs_get_bound_progs(expected=1)

