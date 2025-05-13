Return-Path: <linux-omap+bounces-3704-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD8AB5470
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 14:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F08F862DA6
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC2A28DB6C;
	Tue, 13 May 2025 12:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCTxPgxY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85428EA42;
	Tue, 13 May 2025 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138405; cv=none; b=jA6ebabjJy7fRwe26asez3N6POMUxvjsRSZt2glyHtjEMoweVMkMmAVSZRvuqPxgoJOluurTFiYGVe3nSGUTUCG+es+oCE7COYIBcKOim5oVlguDOrpIiKmFLuGnAMeRz1KWnuyXZBqnLmEucCcx4jS+EevmGIkfQKl2J18zn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138405; c=relaxed/simple;
	bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGQTipQY2artUegVlXhDdZer/xbC4qdTCFJXzRLiBw7UwrwsnjNsVaTjAsn5MgZxVEeoz8shCN6ov88rdBsxJS8QIfap8UQ2n4WW2CFnWUjQxBn9weHAYbDVX4ql9kTNcLOpRY+yTGGX9tB2NnwtP4zU5q7TAEVXI7k/UAdAi2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCTxPgxY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19A9C4CEE9;
	Tue, 13 May 2025 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747138405;
	bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jCTxPgxY2Ep+4y3GZeO65nnVODtniLqng6IUn6R4NTuFpxXa9jDxCUfO3FdV1oxht
	 xwlS2cH3eDUo3/lyOkAdewjCoHKBMeSc1kUeZMT7eGlSojGSIsNynfQQH/46BVodER
	 Kx409AVDGXClpYY+fOXeV7kE8QILz3u/Y4SSqIBc/8X+Tdf14A39FJaR1e0aLoD7Ir
	 XZxfYlzs+JpSkbcDIkbKWNHPkF7nt9n/7e6ykBi3uTmCs6u3nHJT1F5O9zOiDBpnxt
	 Gl7RahqziB12eiNoYJ5acT5l6+9ePaR3IuQ+Xs0jk8SG/1QXhDrBJ1jD/7l6QgG8R8
	 cLL+tbp5Menlg==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 13 May 2025 15:13:08 +0300
Subject: [PATCH net-next v3 4/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_ucast()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-am65-cpsw-rx-class-v3-4-492d9a2586b6@kernel.org>
References: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
In-Reply-To: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoIzdUxoNSaPutkFDBr5PO78ZpocZsn3PhC9H9M
 /QSAtTDJlqJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCM3VAAKCRDSWmvTvnYw
 k2RzEACZx1NGXFXO4S5uRG5HmcDTApUFrR/l27nMHbtntvvtUmCswJ6PP8y0kg8Jzqb7lf/Lypw
 +zGOZal4G+jG1fe6BQscKAG4uEs9Qn/eQGi37B949kpSCNKnO7Zs2Ctgi9PpKtBEcc+FgeTiMyg
 pBhjgGObPKpSLQY4wBGeZDOPPmXc+btTJU+qFlVPDSESSMZn90i/4Aa687LGzw4p5TyVw+/Irjh
 4NFeZGlHZu/WZjH+k2vVgTaY1Cjzx2LEahHp11VzV+GFGvrbC8SMybtumA0DhZfe0bE8gc8ys7G
 XQwOpMh8VJdHx2s79HbUnJfRVFiOVZ0+QVWXMyhfMA38ed6k+tRyIpno3Dz8TLikRs3SX4jWCB5
 ZY6SsYxgs+FEwcz0VTOYU0NSvQ/QUePRBGyLsBNMuumvsFIPbCzcnfeG9e2eXwnoJUFHsJzRSWJ
 NrKyV/bDd+ovUIEggp/7iXEl7fAZCACm94ehIHeeWo7t9lOKZpAomYvyRsVbM1S/P4ZCsvku8HG
 nsN1JmGmwznAQ5/zt5aPkkdRcNOBHwbhR9y/VEiPD1zM+jB1G01zl0kXxkZlG63dH/OUBx+68vN
 NxFSqd0pluosaChQtVkXt9ggzQ49fbkfOjuTPOTKTEqHdEgqqtzNj+7ITuEeLTgocQuisvp+HdT
 S7T83X+hEWej3YA==
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
index 2d23cba557f3..d1abd2fb63c9 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1031,7 +1031,7 @@ static inline int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
 				 HOST_PORT_NUM, ALE_VLAN, vid);
-	if (ret != 0)
+	if (ret < 0)
 		goto clean_vid;
 
 	ret = cpsw_ale_add_mcast(cpsw->ale, priv->ndev->broadcast,
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 952444b0c436..74dc431f1c1b 100644
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
index 1516171352cd..944fa3db94a2 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -422,7 +422,7 @@ static int cpsw_add_vlan_ale_entry(struct cpsw_priv *priv,
 
 	ret = cpsw_ale_add_ucast(cpsw->ale, priv->mac_addr,
 				 HOST_PORT_NUM, ALE_VLAN, vid);
-	if (ret != 0)
+	if (ret < 0)
 		goto clean_vid;
 
 	ret = cpsw_ale_add_mcast(cpsw->ale, priv->ndev->broadcast,

-- 
2.34.1


