Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 664272D43B1
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 15:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732688AbgLIN7T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Dec 2020 08:59:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43922 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732677AbgLIN7N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Dec 2020 08:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607522266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F6j87v8m01F5+XL82dKusuzQwgigWkkuNon5Yi6Vf20=;
        b=XknOaLsyzE03OX/1pxcw/xDn4CA42fN/Ue8SfdXCiyPrgzG5unBdK2cN4gbp9nKo78OiDA
        Q0yAdKl6GREjVukOKpcPK9U6IRIvC3pCyg3BF4jIkoBUT9j4/OuhZtCHLeOSJI9YHzEO4G
        T+U2HmCBPvqrt9eX8hbPe7C9NmUhHeE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-siB7XOjINP2qfjbeWQ1KJw-1; Wed, 09 Dec 2020 08:57:44 -0500
X-MC-Unique: siB7XOjINP2qfjbeWQ1KJw-1
Received: by mail-wm1-f69.google.com with SMTP id r5so598746wma.2
        for <linux-omap@vger.kernel.org>; Wed, 09 Dec 2020 05:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=F6j87v8m01F5+XL82dKusuzQwgigWkkuNon5Yi6Vf20=;
        b=Uth7Q0qvkzQTMhq1YDFsQ6+ooUJAjGyaBAFKP7TNTdyVHoSKILCzywhhmhvzI9uhJB
         htP3oY5h7ekgpoU3yepcHY6w3bkdt1PdMoCoWmTZy5YHmxb9v8KkHYg0W9LvE9S3MXmj
         5tpf/SHP8izrNimrcxOn09HAyE6m9q92K/vOD22eFd+yVFJabVLaFOyw690HcOpRiigl
         z952zYKWIrlG0qOJi7m7yNy06MARBJGn2DAwkdUIG18wvrs/Akc7k0FoM2KjsX1sQnHg
         pcZwziYpwBQK/tqEvF0FKUyrx3d0tvJr81XkDrumHQK30sxbBeQ4b/h3JSXYnbPpxbae
         xOhQ==
X-Gm-Message-State: AOAM531FPeNmQyYiRty5xjhQrHkGZODauascOnyoZcyutiX8BKWn56zk
        4BuPclt/65OkZPl2k/BjyvQdaZlIC5Bfxzif53vYFvKj1Zm/0TQH08+h2wava3jVcv16+SUvgRL
        CqVrLp85ygrtviXa/gGyu+A==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr2863017wrr.342.1607522263116;
        Wed, 09 Dec 2020 05:57:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0HU6Sbm6S/sbv6PCHpQWYWeVVxzjm1vFx9jsWOXOOClpmJeQ5cFGikTqFUjFth8AvnJEkLw==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr2862917wrr.342.1607522261937;
        Wed, 09 Dec 2020 05:57:41 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id m17sm4014088wrn.0.2020.12.09.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 05:57:41 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id B6BAE180004; Wed,  9 Dec 2020 14:57:40 +0100 (CET)
Subject: [PATCH bpf v4 4/7] selftests/bpf/test_offload.py: only check verifier
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
Date:   Wed, 09 Dec 2020 14:57:40 +0100
Message-ID: <160752226069.110217.12370824996153348073.stgit@toke.dk>
In-Reply-To: <160752225643.110217.4104692937165406635.stgit@toke.dk>
References: <160752225643.110217.4104692937165406635.stgit@toke.dk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Toke Høiland-Jørgensen <toke@redhat.com>

Since commit 6f8a57ccf851 ("bpf: Make verifier log more relevant by
default"), the verifier discards log messages for successfully-verified
programs. This broke test_offload.py which is looking for a verification
message from the driver callback. Change test_offload.py to use the toggle
in netdevsim to make the verification fail before looking for the
verification message.

Fixes: 6f8a57ccf851 ("bpf: Make verifier log more relevant by default")
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

