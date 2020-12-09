Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD4D2D40E9
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 12:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgLILUT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Dec 2020 06:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45445 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730586AbgLILUS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Dec 2020 06:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607512731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rdg7j0aoyv9xFKjTcy/3BS13uPnBUVbkHjhjaK6AxE0=;
        b=S2108bF0cDW7RKHlAK5M0foap1uuDcDBnqQAqkeL227qJqN/RpEan2nhYYIL9B83aKfmNn
        GOVgTw8bT3qtfCjygcy2hV1p99VuRASoZAB/+HLfpBSR8gpSr3q3ZCevcpV4G+yrG7fdFx
        2w2915SF3YL0WrG0hT3AZv56pRXxspU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-ojNM6W_KOeaOdd8ElDKIeg-1; Wed, 09 Dec 2020 06:18:49 -0500
X-MC-Unique: ojNM6W_KOeaOdd8ElDKIeg-1
Received: by mail-wr1-f72.google.com with SMTP id o4so523187wrw.19
        for <linux-omap@vger.kernel.org>; Wed, 09 Dec 2020 03:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rdg7j0aoyv9xFKjTcy/3BS13uPnBUVbkHjhjaK6AxE0=;
        b=ggeOzlf+UXgazIjgxjewk5PjCZoY/c+npkn6yxHzsejv3OmUppR36fEEADbAuVHYB0
         mqXqrEUvzI5A4omIoBRDvkBlS5EkObX+V7RlSmOwxWnzr/01YiOV4WdIeSoqbvA72qeY
         DMorDZ+IifT6Yj2PbDIsfWNzjC4JTXvL7vYJeNCCshMDQvUJ+Kl/qqh6vVgk1MDDBTau
         5wUQZ6Yfv90PtdtJi64Z7H4rUklk3HEFgurXHKBv9vt5PLJ/leFRzi9vFH+UZb8WVEZl
         VgdzSAuStqD4qrDjIVUe0WXXOxWXkKg/6XQL2r40uyFmtDHFUPywMELCNZTNy6Wq1I9f
         coxA==
X-Gm-Message-State: AOAM533JIwNnUu1eu/+tG5cP31Nw7CmwG297IySH641bz36PUeOE2U2h
        4mRj+CpK+U+7askteah6cEADAeAqWjeyPra7IRBZBna88/ImlHJuaBh8SCMuwqRIQ3Yufqo3Joi
        Y4fZbxQ8OeASQI/bkdQuRkg==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr2051397wrr.423.1607512728445;
        Wed, 09 Dec 2020 03:18:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzByUzK4whQvOkVhb3u3QIf2WOJnMrhMKCWhHgegG+om0p+KZUQ0AX0otTOa/8uQfiNtIENbA==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr2051355wrr.423.1607512728038;
        Wed, 09 Dec 2020 03:18:48 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id y2sm2663184wma.6.2020.12.09.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 03:18:47 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id AF47A180004; Wed,  9 Dec 2020 12:18:45 +0100 (CET)
Subject: [PATCH bpf v3 7/7] selftests/bpf/test_offload.py: filter bpftool
 internal map when counting maps
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
Date:   Wed, 09 Dec 2020 12:18:45 +0100
Message-ID: <160751272562.104774.12715774646876868194.stgit@toke.dk>
In-Reply-To: <160751271801.104774.5575431902172553440.stgit@toke.dk>
References: <160751271801.104774.5575431902172553440.stgit@toke.dk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Toke Høiland-Jørgensen <toke@redhat.com>

A few of the tests in test_offload.py expects to see a certain number of
maps created, and checks this by counting the number of maps returned by
bpftool. There is already a filter that will remove any maps already there
at the beginning of the test, but bpftool now creates a map for the PID
iterator rodata on each invocation, which makes the map count wrong. Fix
this by also filtering the pid_iter.rodata map by name when counting.

Fixes: d53dee3fe013 ("tools/bpftool: Show info for processes holding BPF map/prog/link/btf FDs")
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 tools/testing/selftests/bpf/test_offload.py |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_offload.py b/tools/testing/selftests/bpf/test_offload.py
index 2128fbd8414b..b99bb8ed3ed4 100755
--- a/tools/testing/selftests/bpf/test_offload.py
+++ b/tools/testing/selftests/bpf/test_offload.py
@@ -184,9 +184,7 @@ def bpftool_prog_list(expected=None, ns=""):
 def bpftool_map_list(expected=None, ns=""):
     _, maps = bpftool("map show", JSON=True, ns=ns, fail=True)
     # Remove the base maps
-    for m in base_maps:
-        if m in maps:
-            maps.remove(m)
+    maps = [m for m in maps if m not in base_maps and m.get('name') not in base_map_names]
     if expected is not None:
         if len(maps) != expected:
             fail(True, "%d BPF maps loaded, expected %d" %
@@ -770,6 +768,9 @@ ret, progs = bpftool("prog", fail=False)
 skip(ret != 0, "bpftool not installed")
 base_progs = progs
 _, base_maps = bpftool("map")
+base_map_names = [
+    'pid_iter.rodata' # created on each bpftool invocation
+]
 
 # Check netdevsim
 ret, out = cmd("modprobe netdevsim", fail=False)

