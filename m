Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4612CED92
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 12:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387903AbgLDLxm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 06:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45293 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730110AbgLDLxh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 06:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607082730;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Iu5eEQc6BVw7sLLw73HclvN8HnJfR2XuNo4UCs27Raw=;
        b=OpNVUNDgLf234v9qh7WwqbcTx3/eFKspLHm8fbR8D2Cd35nrbMvsh6ZS7L5KnE4V+zZLqd
        K1SYph/KQRuj94YCyg0UHR8AWpLKOIVHjTWP1KA+Ow6ozOjzM+P5JBPzJGSiZCNcs/JwUo
        ggBb8tHM7gZYz6PL/qbmYmZPvJ9ybtU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-Wj3aAz4VN8aDE-iJW6p6hw-1; Fri, 04 Dec 2020 06:52:09 -0500
X-MC-Unique: Wj3aAz4VN8aDE-iJW6p6hw-1
Received: by mail-ej1-f70.google.com with SMTP id u25so1975754ejf.3
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 03:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Iu5eEQc6BVw7sLLw73HclvN8HnJfR2XuNo4UCs27Raw=;
        b=GgmJ/oMIHiyTwDlNjcOq4NLRUzM/zmqbDWcaFTU1tBpF/6Q7snEZZWXBtZfryOS0c9
         PYQM0SQdu8k+AHN92MAUFg6eTd4zixsHvjwW9G7asN3SyGDt4vXraUxxXlt4chs8ws97
         02hX4nRUNrgS5qNepOz+1Sb+Ap0Ze0hDROuX+v2TMrv5CrmWd87Qqi2LNYSIk+aTaBF4
         MJ4EN6DESSMdg8uOnbOycJSMafhWboehOOBtlIYyS3E3VypyR3nSo1BqIn8BgxNZ9ZQ/
         od1apaIpW9N9ouf2Ffnt4osdVDGE76jgN8yOTbR5/WtpQavU8lRjwGm2NFEGYyC4T+Bw
         IHzg==
X-Gm-Message-State: AOAM531+xFD7IfZHTkIawH4JEq4C34ONeZoeGw4/g/4AtGqzqFN0k2IR
        8x16qrq4dlBBWvHi5v/IT4T2yDwrau0kFh9lrz/G2u7iXNdo65gUnEBdwUAYiZDsKYbVD8XwHZa
        KWdjvzJNdbse+8oSAFM/QuA==
X-Received: by 2002:a17:906:caa:: with SMTP id k10mr6536561ejh.204.1607082727934;
        Fri, 04 Dec 2020 03:52:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyugoXBC4ufUudPvLnR2Mz8lAS3J/eeuYSbtUpzdXzh3Ra4AwosKXY4UlzD5sCZCi55C7YXvA==
X-Received: by 2002:a17:906:caa:: with SMTP id k10mr6536537ejh.204.1607082727607;
        Fri, 04 Dec 2020 03:52:07 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id qp16sm2890378ejb.74.2020.12.04.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 03:52:07 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 9B1E81843EF; Fri,  4 Dec 2020 12:52:06 +0100 (CET)
Subject: [PATCH bpf v2 4/7] selftests/bpf/test_offload.py: only check verifier
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
Date:   Fri, 04 Dec 2020 12:52:06 +0100
Message-ID: <160708272654.192754.14360138626200913557.stgit@toke.dk>
In-Reply-To: <160708272217.192754.14019805999368221369.stgit@toke.dk>
References: <160708272217.192754.14019805999368221369.stgit@toke.dk>
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
index becd27b2f4ba..61527b43f067 100755
--- a/tools/testing/selftests/bpf/test_offload.py
+++ b/tools/testing/selftests/bpf/test_offload.py
@@ -911,11 +911,18 @@ try:
 
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
@@ -1032,6 +1039,15 @@ try:
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
@@ -1039,7 +1055,6 @@ try:
     progs = bpftool_prog_list(expected=1)
     prog = progs[0]
     fail(link_xdp["id"] != prog["id"], "Loaded program has wrong ID")
-    check_verifier_log(err, "[netdevsim] Hello from netdevsim!")
 
     start_test("Test XDP offload is device bound...")
     dfs = simdev.dfs_get_bound_progs(expected=1)

