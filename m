Return-Path: <linux-omap+bounces-3644-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC8AA98D0
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E913BC4ED
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EFE26139C;
	Mon,  5 May 2025 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVAo6evf"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295325DCEC;
	Mon,  5 May 2025 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462405; cv=none; b=N9DF3fI7RmPg4fjf74Vg8+5QrhvV0lc61j+ms6euWwvGr+sLdGC1MyXz7G88FuYdYQ4BDlHp0oK3429xtbi1cPAYGR1IdMI4eOSiNr+pVvhStSqTHmnNigypHPRG1FClvFaMFn0Gk9G9Duhad9rVo5Rs46kA4Fzz0rafKg9nFMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462405; c=relaxed/simple;
	bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCNK4sLeT5YG1XSUvyXawwST6j932taY3bFDmlSGysTJCwu6Dxk6lbbcXYEoVwr/WolN3pvIqTS/AwhZljbQ9tSrTIJsNRiofqQiITCgl1K4CQSdoY76TcI/HD61Io8dFivukrUTzEdTgSTK3ifukWVV0PMkxU9UGZCgFH7/JKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVAo6evf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB87C4CEEE;
	Mon,  5 May 2025 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462405;
	bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EVAo6evfK8FfO5wWdHDh9OStIv0JZRQEFxT39XalB16nJQqh2sKBQhp6cXHNDA/5R
	 PvkXvpgXTqoBcrF5dYbSSY4UagNogEkLKCDXNOqKdyvCf2xqyl5ZRxMqpiUc0WPTuw
	 UrBwRbHHX9izJHWBfgr+weU4ErBUGRX1HZ+RllpoCwhObUEEkLPW1LIYCu5oiB0nK/
	 TBCbJx/1Q7TizDYjH7qVVHwEU4zOWff1VaIw76LccPYwmjWPHV+JzjsRXvhsHnn4gc
	 B1YQCfgCAtyywh8gIU8ZKOlx7eynkm8G7SDgn3/NmRw0klg7Wo4xujgiAH34G5c8fI
	 b60ThL4zqDFeg==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:32 +0300
Subject: [PATCH net-next v2 2/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_vlan()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-2-5359ea025144@kernel.org>
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa6TQt6aiPNyp839anENScUA0fz9kZx8hXM6
 6KPV9mhAGWJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmugAKCRDSWmvTvnYw
 k6HLEADILWBsl/ODdlvVbpq71DOfdKVCgrMrAwaOPiOcSK2BplMNYjE1LKvyQJi+S6KFjn38mJv
 CILD2gIivEqh4XHiMToDJFswZ2L/LuPr+7ZvEcO1n5SnOufSIih5P8oemMeWEPUWUFACe76VfFY
 lB3uhknLDzmvdytTRVFbkYooGC8SVVibpZpWacp4Bzmj7OS7DTIpy5ymfEgbgxgbyN1zh2N6ZjO
 kkqh+laUImVcebSGwKPNq6bV5L9Xsz06Gxb2hmoLzICCUCP1trloIhRS3owBOtQTk6RpkAUuCcq
 MNUuTAJuzaM0ua81xj0pYyzOh/jTonWxTlMeuMP1QiEhm8t5Htw1PvU5z77iXazM6jDmrIz/t1d
 xw1pHzW+z8OeUrgMzXH3zFZyVKdaKOG1KmjPcBctnImeSw0Aoy7TsCh8YpOzGwOi+2Co7mskzT1
 YpzY2uJCiCfeBNfgKHLRmbUir5TOGzyQ9UMfcb95yB77ULYvPKUUXSgx35pbtD/3IoguB9uLsXw
 tWUIaCSssA7MK/10hhnp7vZOEVUHtqOl6+dWmH6SKbM4QMCmE7zTnWaotMEp/aRheNLfCkt35G8
 MTmntHPSdtr2zrJGltg/lpmvfYDLi0d/Ya2BR++JUq/DBMzlucVom+/pzWkN1rTCRjTx1+tGXmQ
 8BvhDVaPjf+34xQ==
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
index a984b7d84e5e..2d23cba557f3 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1026,7 +1026,7 @@ static inline int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_vlan(cpsw->ale, vid, port_mask, 0, port_mask,
 				unreg_mcast_mask);
-	if (ret != 0)
+	if (ret < 0)
 		return ret;
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 7bb63aad7724..0bdc95552410 100644
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
index 5b5b52e4e7a7..1516171352cd 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -417,7 +417,7 @@ static int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_vlan(cpsw->ale, vid, port_mask, 0, port_mask,
 				unreg_mcast_mask);
-	if (ret != 0)
+	if (ret < 0)
 		return ret;
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,

-- 
2.34.1


