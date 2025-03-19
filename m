Return-Path: <linux-omap+bounces-3462-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A1A68E04
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 14:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0995A3A6A32
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 13:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C82258CE7;
	Wed, 19 Mar 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUD4S0Ek"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11631258CDB;
	Wed, 19 Mar 2025 13:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742391684; cv=none; b=a/6gTB35fX1vfCnA0TvTTwBnrzDmPQ8AgDNpdbHc9Zn5P1WopAhqOd1IH3QcgqqiwDsfDoxaxG+CrOK0+HNxKtHG8uO53pmYE5NtX/3q87GVzCcL3ldARnYMSYE+drDr/qYeJKaWy16SKF0DXWFTVkzxmlZShpIndhsCYo7CNho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742391684; c=relaxed/simple;
	bh=4DTSB2NrpMzqvwjvTdkFc2E+wxOzkKbrSgOx2lj0Rpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvuG1Ep5WOg3DcFC6wO1UnrqtxbwyO/JRj7M6fWCOrPgcnz4X/mcR9jTwMFtrp2o7qak+DD9HWbd1HvNt1MeOG+0IcnRmgPGIjIKcVoBd5rDSQRngei5eWTTdgJ62plahePLQQnnhv60d0SiRp9YueSVdQS0lbDzzJK/dAAIH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUD4S0Ek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4964C4CEF0;
	Wed, 19 Mar 2025 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742391683;
	bh=4DTSB2NrpMzqvwjvTdkFc2E+wxOzkKbrSgOx2lj0Rpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gUD4S0EkE/Iw9DoMIXv8BRvAAe2q8XzrmER3vmsaMEAxxMsqs2zt5pfTnXgrie5B0
	 HzO8FqzU42Gs0tr2YtuaYFxPjS7UNKxoiPe+NZobS8cEHmZDj/DvoXy+OwTdPJRpky
	 LNPuXUbcGukwnIQVllIK2Y5OsJgYuu/uxic+2EuDLW45RxtW/hrV7uvNMsrmxycDm0
	 E4pnMf+95mAwa3vPm5beDrf9i+9E0u2vAK1ML/ixN7h0XFN2LtVzPshXpaGzY1RWmP
	 UFGshpIPN7otSlWhi/9ItkxiOFNk0J+BYKA5BNqMhAE7jRg9y8so/xXsoVub6yZxqu
	 jJ+AHNvM6aMRA==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 19 Mar 2025 15:38:30 +0200
Subject: [PATCH net-next 4/9] net: ethernet: ti: cpsw_ale: return ALE index
 in cpsw_ale_add_ucast()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-am65-cpsw-rx-class-v1-4-2bfded07490e@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=4DTSB2NrpMzqvwjvTdkFc2E+wxOzkKbrSgOx2lj0Rpk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBn2slxYdnmf4Au1/HN4kwqUfqFMo7TPMCO7cN5Y
 EiLIb46fu6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZ9rJcQAKCRDSWmvTvnYw
 k3SrD/9E2eqQZOiGvlX7OlU7mgoX8LRdC5INnMGvoKZpA5zOmufsMKgJsmfamFq3V91u9ffUfHE
 7rAZkU9YfNJx7ctO/HhxtUNEfcH1tKW9zxPqv47P/5lyTwSHw266tiwlOpAwi6XxBIqEw+6Hahk
 KnFf6yOH0LIUJkACxPVrNQHpKnvYpsUddgaE7kGshX5zu81niRpyEclrSmZZVktyYyJfgn56loG
 tRkIOj4dJa+7CjihEK/D4MEP6yB61JAkOrGY+jAU3T3yOwgMGlnE2PEdEnh+fEB1TCcdyWtmaZO
 owFjfkIsKUgXHVjLp/47opRmGvCJVzO787U07RwYqyg1RVpxeqGMaGgfM0SS4br+Gy5eDcjGagv
 6Dhzp19UmUXzmJ8aFfopO5Us5cmEm3K9zn2Z5sNc+HYehWALBR65jwgSVdLAnSMgtlh2akMKASx
 UCBkFmUnDdGRbc9E2G9Zs2YAcsZkj8f6KEdWHQJUG62QHxW+zgyk5UFKZjikEtcYGkonhsjaA+R
 jz2oAM3jvDU97QczYrIN9mjZIuMre38PR7BryVGLxgVIZP+m5ixj7aCTii0J7zsy4iMU+7a5UiL
 jDUQciytgc3Z9uMIWT6PYITHGc5BagcOV7sLZdC+tah8t8YPoJPLREg6P8mJcMhUzf+9U4fyuN2
 6Ib1SvcFUeyhKOA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Policer helpers will need to know what ALE index was used for
the added unicast entry. So return the ALE index instead of zero
on success.

Modify existing users to check for less than zero as error case.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/cpsw.c     | 2 +-
 drivers/net/ethernet/ti/cpsw_ale.c | 2 +-
 drivers/net/ethernet/ti/cpsw_new.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 116ef3220458..11d6ff85f424 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1027,7 +1027,7 @@ static inline int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
 				 HOST_PORT_NUM, ALE_VLAN, vid);
-	if (ret != 0)
+	if (ret < 0)
 		goto clean_vid;
 
 	ret = cpsw_ale_add_mcast(cpsw->ale, priv->ndev->broadcast,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 262abdd3f1b7..2c780efed402 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -534,7 +534,7 @@ int cpsw_ale_add_ucast(struct cpsw_ale *ale, const u8 *addr, int port,
 		return -ENOMEM;
 
 	cpsw_ale_write(ale, idx, ale_entry);
-	return 0;
+	return idx;
 }
 
 int cpsw_ale_del_ucast(struct cpsw_ale *ale, const u8 *addr, int port,
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 24013c52555c..b80042518b95 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -418,7 +418,7 @@ static int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
 				 HOST_PORT_NUM, ALE_VLAN, vid);
-	if (ret != 0)
+	if (ret < 0)
 		goto clean_vid;
 
 	ret = cpsw_ale_add_mcast(cpsw->ale, priv->ndev->broadcast,

-- 
2.34.1


