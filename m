Return-Path: <linux-omap+bounces-3460-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16302A68DFE
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C5B3174EF0
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD74F2580C2;
	Wed, 19 Mar 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j74UdYnN"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3192571B1;
	Wed, 19 Mar 2025 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391678; cv=none; b=KZFsszN9XxUwY5avX9cg7rmRWBMde09ABaSm60blK8tTtTH1mw/ZevMvF16lkm7PncZTk2Qqo7pfixQL5SCbnkJYadOakzlWDjx5FDdqoWnILQG7rqQjEfsOoC9rbd2RSlq3v4M/+f3qe5yoXCJOylgvjdNGCm45wDE6/Ef/CaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391678; c=relaxed/simple;
	bh=uzzDSnP/9DcDwO/FbX9nZmA22EYtH9spiHEMmle3uHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNYELK4oryRfYlNjX6jZarybljdlOlRIeiPfXOzjg7CQ3GzeVglWqeg+tlomPtmDoNU2Rj7ahBmeUaBCsGGFP7IKyn7k4HVvJIxBEj6y8wE4mMuTBFzd2y3I9G4+NHAHpmYqOT5jT2b+IoEQkgGDEkcI2OWTk6G2g0UqjzrvPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j74UdYnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0BEC4CEEA;
	Wed, 19 Mar 2025 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391676;
	bh=uzzDSnP/9DcDwO/FbX9nZmA22EYtH9spiHEMmle3uHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j74UdYnNdWr98JZlujlQGSObb89nuuQYRXcWm/MPiOwYnboTyLT4QYQQihStQNyOk
	 M2V3souWKpN05sOwYDCjJDMTsa00wT3AbWlwN8KcA7epmM3gpXrXii1hHwtSbI/tPl
	 T5uYxajNRyOgxSeme0FAzVd2t1CZFJ5zL9RopGbQ/kwulnpQ7nWpHsAAMWY6V+y19P
	 V3kE3k3oI9Px1T+em/aB/dA5hQUQ2hx6lkz3LOcHsPkJgMMHR4V7BcC8UMLwgy4P74
	 bc7of/fNQQPY7vUlGwOy1w2Q6tSDBv5XyiV/oLUlBJI0M725UD3WVlA3R+K5SEiY3N
	 eSObHCU3R1gJg==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:28 +0200
Subject: [PATCH net-next 2/9] net: ethernet: ti: cpsw_ale: return ALE index
 in cpsw_ale_add_vlan()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-2-2bfded07490e@kernel.org>
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
In-Reply-To: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=uzzDSnP/9DcDwO/FbX9nZmA22EYtH9spiHEMmle3uHg=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slwtAxYCCY4c09MyX9JnNMzVpg8LFuhFpLCa
 T+ZdhF7XUmJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcAAKCRDSWmvTvnYw
 k9JzD/49R0YGwgsMTAIle64/WE7EvidKqGQOZma7NbP7pV9FwQdloJgKtYAZKNGxb98s8NR+rSF
 PA+IFTjkn3OyHpjdR0GBqi04KwZf/gUudxAjDr0UOT3PhT1U6rrboLG2No90c3CZmAgFZw8c4Wh
 EVO6vS+mQJMQApjCwhKVhH44mSVGA7U7A9Gix+lyJ14t1NrYIA004s3fvXWW8kqOD4CGBk64Mwx
 hMJPg/smsZe6FGtCrL4JEynYMSQrI8JyaMYaeNVQ8vqy7Vzm1DEadBLS6D3QTnUEddD+Efq8qsc
 gCY/TByDs8cxHWzua0LmQQujIe4qLYKeilGxPvmSw2AtHib2imr+D5UjjDR6vv57Yehi3o0LRU7
 RL01U4tACxG6W82KoGSfA6GkKysa2D1EcwhefYhZ8IDtuGBMUCoW0amwhl89yw5moQZY8iNVWwp
 NNs0hl83j+U+iJxyhS7XvNll1oF+hFxNTzAz86j44XkZV5baRJ49rGJdZ8bMmY99bTwT7Xt+553
 aauEJgG0lbf+RCfHG5xU0GUTC1ISxwdMe+juL5etdGhYvv8YMIaAhQ6gdLnOoOskdfv15RWkrxf
 bHQfows55fRAfJ/Y83m9q5QRsqAundMrkDTQk0X2vsHmoDMdSVnhB1vcQVflOjgP0x0apdBjtSg
 pIyKWObJ3fITewA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Policer helpers will be interested to know what ALE index was used
for the added VLAN entry. So return the ALE index instead of zero
on success.

Modify existing users to check for less than zero as error case.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw.c     | 2 +-
 drivers/net/ethernet/ti/cpsw_ale.c | 6 +++---
 drivers/net/ethernet/ti/cpsw_new.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 0cb6fa6e5b7d..116ef3220458 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1022,7 +1022,7 @@ static inline int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_vlan(cpsw->ale, vid, port_mask, 0, port_mask,
 				unreg_mcast_mask);
-	if (ret != 0)
+	if (ret < 0)
 		return ret;
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 50d0340f83dd..16b523e33e47 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -680,7 +680,7 @@ int cpsw_ale_add_vlan(struct cpsw_ale *ale, u16 vid, int port_mask, int untag,
 		return -ENOMEM;
 
 	cpsw_ale_write(ale, idx, ale_entry);
-	return 0;
+	return idx;
 }
 
 static void cpsw_ale_vlan_del_modify_int(struct cpsw_ale *ale,  u32 *ale_entry,
@@ -803,14 +803,14 @@ int cpsw_ale_vlan_add_modify(struct cpsw_ale *ale, u16 vid, int port_mask,
 
 	ret = cpsw_ale_add_vlan(ale, vid, vlan_members, untag_members,
 				reg_mcast_members, unreg_mcast_members);
-	if (ret) {
+	if (ret < 0) {
 		dev_err(ale->params.dev, "Unable to add vlan\n");
 		return ret;
 	}
 	dev_dbg(ale->params.dev, "port mask 0x%x untag 0x%x\n", vlan_members,
 		untag_mask);
 
-	return ret;
+	return 0;
 }
 
 void cpsw_ale_set_unreg_mcast(struct cpsw_ale *ale, int unreg_mcast_mask,
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 3da1c131335d..24013c52555c 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -413,7 +413,7 @@ static int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_vlan(cpsw->ale, vid, port_mask, 0, port_mask,
 				unreg_mcast_mask);
-	if (ret != 0)
+	if (ret < 0)
 		return ret;
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,

-- 
2.34.1


