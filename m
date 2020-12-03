Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173EB2CE0E8
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 22:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389276AbgLCVgy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 16:36:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34497 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729417AbgLCVgv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 16:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607031324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FOEQOBhWSpjeYwgvm7jnVQdC9SysAGqDTxCGYu9Ii/E=;
        b=Nh8rPoxl/mZtIBMvVsqshoy6iwxwprWXYhWXNABlWMiCMWdH1nTBL7aZXn8NjriCRlwi4i
        KRlAjGKl/xF7KIm/L3Z/e9DyaD8o19jsNdfnSZuSJPkpASPPfs2gvNpW0ogHO7WprjCnB1
        onAV5UhAa/fgx88UJMS2POqTrQV90DU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-AH36Nzi9O4CbDWZWtVoHDA-1; Thu, 03 Dec 2020 16:35:22 -0500
X-MC-Unique: AH36Nzi9O4CbDWZWtVoHDA-1
Received: by mail-qt1-f200.google.com with SMTP id x62so2696118qtd.11
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 13:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FOEQOBhWSpjeYwgvm7jnVQdC9SysAGqDTxCGYu9Ii/E=;
        b=NyxqUdb6aHtb3hTgI1wiXKG3CcKwNrNohDGAdG/I0T3b9ddnQpoXcRc9Ax+/z+pcte
         Lh3SuBoijgUlqRa/csCj+CegSpkO4v6Jr/PdsI6ObXI2gIkhsk6lAO9k7TnEF3pUEJq+
         6kNNfQf/NeiIUV0P5Q9LMWGMbVE2sCBSfxbVQ27M+mTZkcK/sA+XQmyqD29Ep6D8R7jX
         pTO7WouFNG67JD0ObZA2m2MZIq2+XLwkq6VXekfTJkeZ025cpPut6h9oXd2GcS7sdAqu
         KC6qsAasl/5FBHixzRkhj6t1Rpf0u/osjpHcBQyYABL9dx8WqnOk5Rbz2Ju37Mn/kS+e
         Tj7w==
X-Gm-Message-State: AOAM530GkFCkEclAB+/HXlRVv6t36jVCRK9TSDOoGmvWSnPqndiVd7PO
        nB8xp9kZK2jPoo9OV9ek9Yk5EnBSRzLvqZVd+nD1nWzMDK5ZI9KxmRQFtsOsaUUuAAqHrTh7nGF
        NATIphuhCl27nxlIZzbce1Q==
X-Received: by 2002:a37:a88f:: with SMTP id r137mr5123196qke.437.1607031320984;
        Thu, 03 Dec 2020 13:35:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx00VOq0ClX50AjGWa467GOWc3rLaYOdNTf+KrH8xHZ6cY5kBzdnkH7aaycznfV49wVXoyP+A==
X-Received: by 2002:a37:a88f:: with SMTP id r137mr5123158qke.437.1607031320769;
        Thu, 03 Dec 2020 13:35:20 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 64sm2795037qko.2.2020.12.03.13.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:35:20 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 43E051843EB; Thu,  3 Dec 2020 22:35:18 +0100 (CET)
Subject: [PATCH bpf 1/7] xdp: remove the xdp_attachment_flags_ok() callback
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
Date:   Thu, 03 Dec 2020 22:35:18 +0100
Message-ID: <160703131819.162669.2776807312730670823.stgit@toke.dk>
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

Since commit 7f0a838254bd ("bpf, xdp: Maintain info on attached XDP BPF
programs in net_device"), the XDP program attachment info is now maintained
in the core code. This interacts badly with the xdp_attachment_flags_ok()
check that prevents unloading an XDP program with different load flags than
it was loaded with. In practice, two kinds of failures are seen:

- An XDP program loaded without specifying a mode (and which then ends up
  in driver mode) cannot be unloaded if the program mode is specified on
  unload.

- The dev_xdp_uninstall() hook always calls the driver callback with the
  mode set to the type of the program but an empty flags argument, which
  means the flags_ok() check prevents the program from being removed,
  leading to bpf prog reference leaks.

Since we offloaded and non-offloaded programs can co-exist there doesn't
really seem to be any reason for the check anyway, and it's only used in
three drivers so let's just get rid of the callback entirely.

Signed-off-by: Toke Høiland-Jørgensen <toke@redhat.com>
---
 .../net/ethernet/netronome/nfp/nfp_net_common.c    |    6 ------
 drivers/net/ethernet/ti/cpsw_priv.c                |    3 ---
 drivers/net/netdevsim/bpf.c                        |    3 ---
 include/net/xdp.h                                  |    2 --
 net/core/xdp.c                                     |   12 ------------
 5 files changed, 26 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index b150da43adb2..437226866ce8 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -3562,9 +3562,6 @@ static int nfp_net_xdp_setup_drv(struct nfp_net *nn, struct netdev_bpf *bpf)
 	struct nfp_net_dp *dp;
 	int err;
 
-	if (!xdp_attachment_flags_ok(&nn->xdp, bpf))
-		return -EBUSY;
-
 	if (!prog == !nn->dp.xdp_prog) {
 		WRITE_ONCE(nn->dp.xdp_prog, prog);
 		xdp_attachment_setup(&nn->xdp, bpf);
@@ -3593,9 +3590,6 @@ static int nfp_net_xdp_setup_hw(struct nfp_net *nn, struct netdev_bpf *bpf)
 {
 	int err;
 
-	if (!xdp_attachment_flags_ok(&nn->xdp_hw, bpf))
-		return -EBUSY;
-
 	err = nfp_app_xdp_offload(nn->app, nn, bpf->prog, bpf->extack);
 	if (err)
 		return err;
diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 31c5e36ff706..424e644724e4 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -1265,9 +1265,6 @@ static int cpsw_xdp_prog_setup(struct cpsw_priv *priv, struct netdev_bpf *bpf)
 	if (!priv->xdpi.prog && !prog)
 		return 0;
 
-	if (!xdp_attachment_flags_ok(&priv->xdpi, bpf))
-		return -EBUSY;
-
 	WRITE_ONCE(priv->xdp_prog, prog);
 
 	xdp_attachment_setup(&priv->xdpi, bpf);
diff --git a/drivers/net/netdevsim/bpf.c b/drivers/net/netdevsim/bpf.c
index 2e90512f3bbe..85546664bdd5 100644
--- a/drivers/net/netdevsim/bpf.c
+++ b/drivers/net/netdevsim/bpf.c
@@ -190,9 +190,6 @@ nsim_xdp_set_prog(struct netdevsim *ns, struct netdev_bpf *bpf,
 {
 	int err;
 
-	if (!xdp_attachment_flags_ok(xdp, bpf))
-		return -EBUSY;
-
 	if (bpf->command == XDP_SETUP_PROG && !ns->bpf_xdpdrv_accept) {
 		NSIM_EA(bpf->extack, "driver XDP disabled in DebugFS");
 		return -EOPNOTSUPP;
diff --git a/include/net/xdp.h b/include/net/xdp.h
index 3814fb631d52..9dab2bc6f187 100644
--- a/include/net/xdp.h
+++ b/include/net/xdp.h
@@ -240,8 +240,6 @@ struct xdp_attachment_info {
 };
 
 struct netdev_bpf;
-bool xdp_attachment_flags_ok(struct xdp_attachment_info *info,
-			     struct netdev_bpf *bpf);
 void xdp_attachment_setup(struct xdp_attachment_info *info,
 			  struct netdev_bpf *bpf);
 
diff --git a/net/core/xdp.c b/net/core/xdp.c
index 491ad569a79c..d900cebc0acd 100644
--- a/net/core/xdp.c
+++ b/net/core/xdp.c
@@ -403,18 +403,6 @@ void __xdp_release_frame(void *data, struct xdp_mem_info *mem)
 }
 EXPORT_SYMBOL_GPL(__xdp_release_frame);
 
-bool xdp_attachment_flags_ok(struct xdp_attachment_info *info,
-			     struct netdev_bpf *bpf)
-{
-	if (info->prog && (bpf->flags ^ info->flags) & XDP_FLAGS_MODES) {
-		NL_SET_ERR_MSG(bpf->extack,
-			       "program loaded with different flags");
-		return false;
-	}
-	return true;
-}
-EXPORT_SYMBOL_GPL(xdp_attachment_flags_ok);
-
 void xdp_attachment_setup(struct xdp_attachment_info *info,
 			  struct netdev_bpf *bpf)
 {

