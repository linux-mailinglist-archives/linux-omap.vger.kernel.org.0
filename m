Return-Path: <linux-omap+bounces-2163-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28196972A73
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 09:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61191F258CC
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2024 07:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B769F17D374;
	Tue, 10 Sep 2024 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HawU/jxz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466D17C7C2;
	Tue, 10 Sep 2024 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725952690; cv=none; b=R224IiePTCk5nkOaBl06xOp955tUpW9I6MPS1g5Rjm1RXQ0GTjBYwVXmjYC+EpOzXe9/iiqBsC3KN1VFoKMIv4oHxxqrVUIDtqYjszLt/wqib4mYgq5DHKRhhf1UJvnaWn54KJGel7k3w/jmJ1/OP7hoqSAwW4qiTNnf3w3JHOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725952690; c=relaxed/simple;
	bh=93mQsDnggXpHFKktvwHFNby5FJRB7qKVtHrKW8As46c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz0hqTS+FwZVow6o77vcjsccdL0+yu8VZiWK2vX4BWCC256AAsY6YhGhvzltQgThNdqZBIRJ9cZ1OKcyoDKYf4kBIFivmQTlzPwh0MH7fu9TpazPBrrWXRNlGSPl2lVGtgseNEAq2Wabiq8HR28qLh8OX4tCCgWIkRJZHF5Sl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HawU/jxz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D57FC4CECB;
	Tue, 10 Sep 2024 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725952690;
	bh=93mQsDnggXpHFKktvwHFNby5FJRB7qKVtHrKW8As46c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HawU/jxzaMUGb/G39ABOryiHwfvXo9i53NeLTUog66l0XRIR/PLWJMCVLp+VjnpA8
	 bFYiOjzum738hNcw49zd7T+AhUrQevEQ+b1UCULnkGuluUlaiQ5/PH7GdVg18sZXNj
	 M4CUqweKUBefEOwOkHxwtKEGmiCfaxoZQfE+h01h9GkbYd2LS0s/9ap02NVI6N8E+C
	 1hdO26Mkp87dPpKAb7jZYQSF6UDACEWojy/fsHQuvGNrdLY8kW+m4Fi1AnpW2rOmPN
	 Qa3P1znBPxl45Cr7JJ394WCHFBZ5z18F5zNFIvBUc2O5ewMiAcnM4UWYK5nmlUREai
	 6QNpEnMnR1ycQ==
From: Simon Horman <horms@kernel.org>
Date: Tue, 10 Sep 2024 08:17:56 +0100
Subject: [PATCH net-next 1/3] net: ethernet: ti: am65-cpsw: Address
 __percpu Sparse warnings
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-ti-warn-v1-1-afd1e404abbe@kernel.org>
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Roger Quadros <rogerq@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-omap@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.14.0

Sparse flags a mismatch between percpu stats data, and
it's use with actions which handle non-percpu data.

.../am65-cpsw-nuss.c:2658:55: warning: incorrect type in initializer (different address spaces)
.../am65-cpsw-nuss.c:2658:55:    expected struct am65_cpsw_ndev_stats [noderef] __percpu *stats
.../am65-cpsw-nuss.c:2658:55:    got void *data
.../am65-cpsw-nuss.c:2781:15: warning: incorrect type in argument 3 (different address spaces)
.../am65-cpsw-nuss.c:2781:15:    expected void *data
.../am65-cpsw-nuss.c:2781:15:    got struct am65_cpsw_ndev_stats [noderef] __percpu *stats

Address this using casts.

An alternate, approach would be to create a variant of
devm_add_action_or_reset() which expects __percpu data.  This would
avoid discarding the __percpu annotation, and any value it may have
between the casts added by this patch.  However, doing so appears to
require a significant amount of plumbing.  And, as far as I can see, the
code updated by this patch would be the only user of it.  So this patch
takes a simpler approach.

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index b7e5d0fb5d19..a4b0e4bb7529 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2671,9 +2671,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
 
 static void am65_cpsw_pcpu_stats_free(void *data)
 {
-	struct am65_cpsw_ndev_stats __percpu *stats = data;
-
-	free_percpu(stats);
+	free_percpu((void __percpu *)data);
 }
 
 static void am65_cpsw_nuss_phylink_cleanup(struct am65_cpsw_common *common)
@@ -2794,7 +2792,7 @@ am65_cpsw_nuss_init_port_ndev(struct am65_cpsw_common *common, u32 port_idx)
 		return -ENOMEM;
 
 	ret = devm_add_action_or_reset(dev, am65_cpsw_pcpu_stats_free,
-				       ndev_priv->stats);
+				       (__force void *)ndev_priv->stats);
 	if (ret)
 		dev_err(dev, "failed to add percpu stat free action %d\n", ret);
 

-- 
2.45.2


