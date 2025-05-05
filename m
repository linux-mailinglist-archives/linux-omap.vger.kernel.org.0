Return-Path: <linux-omap+bounces-3646-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E4AA98E1
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 18:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7776E1899318
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 16:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BC426C3B0;
	Mon,  5 May 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj2aZOo4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6226C39B;
	Mon,  5 May 2025 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462412; cv=none; b=gCe170ZQNc/lX+rYksa89yP25QDO1lWWaTQ47pHJpnhRNZTtYrqUnMiRZEdfa3u8avuQ737Ltfcvd2/Wz5dqV8EfPSxmyXjS+uXwj2uogqWaBWFGZu0IY257qu/gNp+kIo+vaP0gZvS/WRZDd1s3oylEO5ZtdKlhXtYWDscFuKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462412; c=relaxed/simple;
	bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CB65QQqEvDhBTbxx0rzy7WutNZP/reirpaeVI2qjC360H2/2xgdTjlSm03FLL0QRfkqk93jxcyjBUnG5RtRfgfoHbAA7xJACCNF8NLNOFt91ZJcu+2L9BU3DehI6s9dtPT1nOv922fEVqopYlo0hOk6N8xq6jtUtPN9eJU88HQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj2aZOo4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA480C4CEEF;
	Mon,  5 May 2025 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462411;
	bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gj2aZOo4MghVr6PTzgSlY9bCgmt9o/7awBC/+9hoIixc/6EyWXan/Tv4P90oDaBST
	 aS5dpBxuY++WZKMjSaPqshLXoJkBw0vnQSHx2zvmufuVjBn08j0K/Tcec1YRmKff2B
	 uFhRb56vyXQoz7euov9Fckr1iNMRtvNBz3AOPkG37TTSd1b5S28EkT2r/uN7btwyBN
	 U/9PpyIHB4iM3JKayvDMYQdJlYlHIC8DyHVuBlyB00e87gfUgPqWD4NqM9orS0Ka9t
	 R6sT/qHqsp6I2CbpzZjAcoyGFbzo0yjwJ6r7zPQe31zY8/iii2PXHroxNQgq0zi6WQ
	 dXz3ekFSzLT9A==
From: Roger Quadros <rogerq@kernel.org>
Date: Mon, 05 May 2025 19:26:34 +0300
Subject: [PATCH net-next v2 4/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_ucast()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-am65-cpsw-rx-class-v2-4-5359ea025144@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoGOa6yvThunF18TA8PcqL2OmM0u/QrmdXDtTqP
 bgjjBlfg+iJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaBjmugAKCRDSWmvTvnYw
 k9KyEADDMfoT/r0h/Sk73TNq9pb3xg58b+6J7Uw66LJka/0DdFijL40nn8j0U0Au+GhPjhJzAyx
 XBgp/Im/QXLJadyXfK/CRDirYIAJds2Hkr5uwdBerfM009o/OLQf59Np/IVMFYqTIh+X9fu11SM
 iN7HrASNogzvSN6X8Ho6RCGMxZyWPlc4PHRyMDN6kYg3+h0r2pNfrVRcsyGtyStFEH8glABGn2Z
 Y5WWCAikWUghqgukCcekv3/uUPPiUa9N7byH91LYV83P/v5JV0iJpZKuZOtzbKttfDlIKzdsDCs
 0meNw2rMkuHuMZd0fXa2kdNMUX9F1YMy1c37vQmw/kYpU6kvOwgfZJKb1lRPfGZsuS2jy6Yo8sW
 3D8BQj09I3M7DdyMFQa3YpXwMpx7TYaw+DC0c7uphuydBJMwqwzP4wWcWY+sRjsNRul5uvi9Bbn
 f7RIRquMgdgKP2xIlL1Qva/uq/Z5wAYQbI5npbAjIhSkl3bxms45NwfCAcCh//dZoBrunV5xLRn
 sSHTBaxAgd9JwkQClCdRXscRDaxxa3E2co8cj9JoTbrx2H0ahx9Bcq6gmxkApKmlZ64jle5QBG/
 ytDJfHu6AENeq/4JgOKOf6bqEIuUrUENIJAfleF4s5MgF8tMRD337qzlyCI52uApCe11DSQTtiH
 E5XIy7+fJtNgAHg==
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


