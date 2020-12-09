Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E561B2D40FB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Dec 2020 12:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730385AbgLILVR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Dec 2020 06:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55370 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730345AbgLILUO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Dec 2020 06:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607512727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rs0UkbehwBsDPQ8obfGEfwu5WvgJdipXIe4g7gP7tw8=;
        b=IU4e68LV5r57PTlmeHz9OW3ggdMZ8W/YA86gnKzrDqnIead6NVtwWmKPg+GIpSqLJiO3vF
        WhK9UlEO8R/ed0Go5TfBzKntnnHjN6QktkIUjFlRwZ06hJCZXtUPgqZh8ueAto4eHAyk2K
        andaOL+czplNVrcFfhFzmy1I9RveG64=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-OMfo7WNgNnmeY8udfhV79g-1; Wed, 09 Dec 2020 06:18:46 -0500
X-MC-Unique: OMfo7WNgNnmeY8udfhV79g-1
Received: by mail-wm1-f71.google.com with SMTP id k128so427464wme.7
        for <linux-omap@vger.kernel.org>; Wed, 09 Dec 2020 03:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rs0UkbehwBsDPQ8obfGEfwu5WvgJdipXIe4g7gP7tw8=;
        b=FrbbzyuajwLDYJaodh+IMxwIFRgA9V/4BQcP5nvgn95yPtbrOTJKg7XyhsbQp+oWOF
         MC/oj5i/h4lGgmWCyrR5pToTZ7r6HeELayEf0ltbcuMYY/SFtuVUAQ4oYnq4riYZiF1G
         36mAxCGm3ZN2/OGIYWOtWQyLJFfW9m7vwENS89YRQFoTUU9Snk2s4Mr3dF0zvb3VHBX4
         CpsuUo3KYVpGJD4hmZnOxmiVD3/TvuC3fOO8CNtizuOV5ruiSXyFV7Vh18urVobtDWj2
         rqVC7S4xoWca+eMHh30We62Ho4plLHkayJ+eofAy3AAa6jQ87rfHFkdsczUk5kkEajc0
         fywg==
X-Gm-Message-State: AOAM533V7FSUb5P3Hdb6f/mAEowEUm0wmT8/Kz1+9U7X91/Z8IccCP/0
        txook3Syqj0WlPFWAg6ygymsfesNKoRcVkiZEhJN3+euGC7TZ20iMpOr6CeLZu/u9cJpMkxHJPD
        M1ITo8rdv1OJ4V2bAyT222w==
X-Received: by 2002:a5d:510d:: with SMTP id s13mr2170600wrt.380.1607512724563;
        Wed, 09 Dec 2020 03:18:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUFTLJxM7MK6E7FYWlZphsYY3r5n+tLpJNDziNUu+XqdM68+jgoEImmuHFsl38M0dCcQR5CA==
X-Received: by 2002:a5d:510d:: with SMTP id s13mr2170585wrt.380.1607512724413;
        Wed, 09 Dec 2020 03:18:44 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id w17sm2785271wmk.12.2020.12.09.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 03:18:41 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 56A98180003; Wed,  9 Dec 2020 12:18:41 +0100 (CET)
Subject: [PATCH bpf v3 3/7] netdevsim: Add debugfs toggle to reject BPF
 programs in verifier
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
Date:   Wed, 09 Dec 2020 12:18:41 +0100
Message-ID: <160751272126.104774.9977428866761146011.stgit@toke.dk>
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

This adds a new debugfs toggle ('bpf_bind_verifier_accept') that can be
used to make netdevsim reject BPF programs from being accepted by the
verifier. If this toggle (which defaults to true) is set to false,
nsim_bpf_verify_insn() will return EOPNOTSUPP on the last
instruction (after outputting the 'Hello from netdevsim' verifier message).

This makes it possible to check the verification callback in the driver
from test_offload.py in selftests, since the verifier now clears the
verifier log on a successful load, hiding the message from the driver.

Fixes: 6f8a57ccf85 ("bpf: Make verifier log more relevant by default")
Acked-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 drivers/net/netdevsim/bpf.c       |   12 ++++++++++--
 drivers/net/netdevsim/netdevsim.h |    1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index 85546664bdd5..90aafb56f140 100644
--- a/drivers/net/netdevsim/bpf.c
+++ b/drivers/net/netdevsim/bpf.c
@@ -63,15 +63,20 @@ static int
 nsim_bpf_verify_insn(struct bpf_verifier_env *env, int insn_idx, int prev_insn)
 {
 	struct nsim_bpf_bound_prog *state;
+	int ret = 0;
 
 	state = env->prog->aux->offload->dev_priv;
 	if (state->nsim_dev->bpf_bind_verifier_delay && !insn_idx)
 		msleep(state->nsim_dev->bpf_bind_verifier_delay);
 
-	if (insn_idx == env->prog->len - 1)
+	if (insn_idx == env->prog->len - 1) {
 		pr_vlog(env, "Hello from netdevsim!\n");
 
-	return 0;
+		if (!state->nsim_dev->bpf_bind_verifier_accept)
+			ret = -EOPNOTSUPP;
+	}
+
+	return ret;
 }
 
 static int nsim_bpf_finalize(struct bpf_verifier_env *env)
@@ -595,6 +600,9 @@ int nsim_bpf_dev_init(struct nsim_dev *nsim_dev)
 			    &nsim_dev->bpf_bind_accept);
 	debugfs_create_u32("bpf_bind_verifier_delay", 0600, nsim_dev->ddir,
 			   &nsim_dev->bpf_bind_verifier_delay);
+	nsim_dev->bpf_bind_verifier_accept = true;
+	debugfs_create_bool("bpf_bind_verifier_accept", 0600, nsim_dev->ddir,
+			    &nsim_dev->bpf_bind_verifier_accept);
 	return 0;
 }
 
diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
index 827fc80f50a0..c4e7ad2a1964 100644
--- a/drivers/net/netdevsim/netdevsim.h
+++ b/drivers/net/netdevsim/netdevsim.h
@@ -189,6 +189,7 @@ struct nsim_dev {
 	struct dentry *take_snapshot;
 	struct bpf_offload_dev *bpf_dev;
 	bool bpf_bind_accept;
+	bool bpf_bind_verifier_accept;
 	u32 bpf_bind_verifier_delay;
 	struct dentry *ddir_bpf_bound_progs;
 	u32 prog_id_gen;

