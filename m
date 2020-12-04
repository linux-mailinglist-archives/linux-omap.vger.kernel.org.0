Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE89D2CEDA7
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 13:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgLDMA5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 07:00:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53964 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726322AbgLDMA4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 07:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607083170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fo4CkmHc3jtGL0IOPisn+w0CsTqAMCL3b0L5UdSE4ls=;
        b=biV+3dzoNJavgCvo1zJhHYpTe+Ij59fP+EghJaQAaxx539hcWVJc5GCloIqnkUxsBrd995
        ki2+LG3VQLkWAxA5HQnp4lQ5A3Jm/Bf6mzkqdWl1rTIfkFbVMThStNB+dDmy5CuhbO6ycq
        hLdAZM+QC68VTxcPx5M+L2mELj3Fc1U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Vkqr1ZUyOEqPK3yivcjQ8g-1; Fri, 04 Dec 2020 06:59:28 -0500
X-MC-Unique: Vkqr1ZUyOEqPK3yivcjQ8g-1
Received: by mail-ej1-f69.google.com with SMTP id f21so1982695ejf.11
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 03:59:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fo4CkmHc3jtGL0IOPisn+w0CsTqAMCL3b0L5UdSE4ls=;
        b=HysC6kltePkQBRbTyegbE0aLUSSVtRBDX7TcHOgXqj1VWa5vemZMTyx3zEmHZd671R
         6waC4cHaWFUH/Dbxz0P1W81Gq9sz97BallRj7VzTkYMS0fTFjaM7hDq22QJ6cOG+BrJO
         7MqoU8IIW/Xh0WU7O3uqy83UHNRKAO4ScpYTGcMskh+Q+4E55frDIuALmkedltsrI8yC
         WPdYCpnU3PMCuolBk36+YjY/jtBqJZfgJJoD1afTwkic3tgV0wWchM4b/UY61iRxVK89
         ZDhVKRt0bG/hImxCPG1ZduazqMIQFF8/xitMScUfyliGzOUi0cTKkx68UondR6Nkj8qh
         8qMw==
X-Gm-Message-State: AOAM531M4VqoLxm1PGZfStIOzcVcFILjA35HCy8v0FO6xl2iN5f3VoEm
        diz8ukDnG/if/HIlXmsHsrSDA2Kxcl2O8rFqrrJpXaQEzuHyd0Olz0DpI1ISw4GM5ljpksgchKI
        QbjW2pNSzhfTok5AGYI2qcw==
X-Received: by 2002:a17:906:4016:: with SMTP id v22mr6890787ejj.266.1607083166795;
        Fri, 04 Dec 2020 03:59:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywrOY+L6uvg7IiDMqj6/eVEC18v1AA+ShmEGuxMXdvUnzdfACpA0kSCLjZwLRBvQn0LMGt5w==
X-Received: by 2002:a17:906:4016:: with SMTP id v22mr6890759ejj.266.1607083166302;
        Fri, 04 Dec 2020 03:59:26 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id gl2sm2878911ejb.29.2020.12.04.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 03:59:25 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 6FF4E182EEA; Fri,  4 Dec 2020 12:52:04 +0100 (CET)
Subject: [PATCH bpf v2 2/7] selftests/bpf/test_offload.py: Remove check for
 program load flags match
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
Date:   Fri, 04 Dec 2020 12:52:04 +0100
Message-ID: <160708272436.192754.11519287849839028664.stgit@toke.dk>
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

Since we just removed the xdp_attachment_flags_ok() callback, also remove
the check for it in test_offload.py, and replace it with a test for the new
ambiguity-avoid check when multiple programs are loaded.

Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 tools/testing/selftests/bpf/test_offload.py |   22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_offload.py b/tools/testing/selftests/bpf/test_offload.py
index 43c9cda199b8..becd27b2f4ba 100755
--- a/tools/testing/selftests/bpf/test_offload.py
+++ b/tools/testing/selftests/bpf/test_offload.py
@@ -716,13 +716,11 @@ def test_multi_prog(simdev, sim, obj, modename, modeid):
     fail(ret == 0, "Replaced one of programs without -force")
     check_extack(err, "XDP program already attached.", args)
 
-    if modename == "" or modename == "drv":
-        othermode = "" if modename == "drv" else "drv"
-        start_test("Test multi-attachment XDP - detach...")
-        ret, _, err = sim.unset_xdp(othermode, force=True,
-                                    fail=False, include_stderr=True)
-        fail(ret == 0, "Removed program with a bad mode")
-        check_extack(err, "program loaded with different flags.", args)
+    start_test("Test multi-attachment XDP - remove without mode...")
+    ret, _, err = sim.unset_xdp("", force=True,
+                                fail=False, include_stderr=True)
+    fail(ret == 0, "Removed program without a mode flag")
+    check_extack(err, "More than one program loaded, unset mode is ambiguous.", args)
 
     sim.unset_xdp("offload")
     xdp = sim.ip_link_show(xdp=True)["xdp"]
@@ -1001,16 +999,6 @@ try:
     check_extack(err,
                  "native and generic XDP can't be active at the same time.",
                  args)
-    ret, _, err = sim.set_xdp(obj, "", force=True,
-                              fail=False, include_stderr=True)
-    fail(ret == 0, "Replaced XDP program with a program in different mode")
-    check_extack(err, "program loaded with different flags.", args)
-
-    start_test("Test XDP prog remove with bad flags...")
-    ret, _, err = sim.unset_xdp("", force=True,
-                                fail=False, include_stderr=True)
-    fail(ret == 0, "Removed program with a bad mode")
-    check_extack(err, "program loaded with different flags.", args)
 
     start_test("Test MTU restrictions...")
     ret, _ = sim.set_mtu(9000, fail=False)

