Return-Path: <linux-omap+bounces-3702-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40435AB5465
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 14:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B348C7B25B8
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 12:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB6C28DF3E;
	Tue, 13 May 2025 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGu/rpH1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7228DEF8;
	Tue, 13 May 2025 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138399; cv=none; b=oiW2KoOhd+KkyYOW/Kn+0K8/08aG1QrRrJzYLumTGbqyUcEEhuQBnVOX2kSR4JYcYdV/5B7qdwf5gjSJuwu6MJSzU6lsiuW7F+m/0q/mmeehNhQDBksot0yQMjwNdvOiKqcBBKkigxxJKLmStlvIZEH5yebILCEWOmdvadccUso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138399; c=relaxed/simple;
	bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNODnFY17LuLCoyajGMkMFjSoMhwjPo0Tol77PGQZaafO/AopJm6Ug3irGpIzl24CRoaBCjk/c9RJbkW2nY/UHd9CGgzUTXtfdzayefsfmKrR6Q8HgRysf0bZ3X4xajxiegB9e+DrkLih2mQyUI4tbQ9sXIWUwT+IXuSnsnEx38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGu/rpH1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2682AC4CEE9;
	Tue, 13 May 2025 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747138398;
	bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rGu/rpH1MA164QuK0ou2pWRpUgfE8nHm0/S+vkfGUXEojYgwFCBX7UA0FJdpHp5h4
	 pfUXoH+olTdcGU6FcFuIXcDoBE6BaXU3T9C5Ln2BU/SJORHmixFatvIrYO70nlMqXy
	 zzTawTnN/vdjd+8CCPlQJM9Hqk90gbqrfrgXIzPYoTMyMKoN4/k+XmwORCWmJg3kOm
	 dEuoHRKo/+6HCZucD/4LBtBrv7MP1lnn5K1f/eub/tlDPjxYJu66oVReS9lv0cz0Uo
	 a2SBdo0rV/S949rzCpqV9cdd+KLxgd/Pt9hdJM8QcPoA5MUL//thycZ2pXZ0MsBOtz
	 Zp4Iaa8HOnF8A==
From: Roger Quadros <rogerq@kernel.org>
Date: Tue, 13 May 2025 15:13:06 +0300
Subject: [PATCH net-next v3 2/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_vlan()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-am65-cpsw-rx-class-v3-2-492d9a2586b6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2474; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=YbtaSFXvEqscgWdaWU4X/6cPyfGpueE1ti1NCjiITjk=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoIzdU/MV48zcLrqcUBwzsULKToR4Nu+mp0Js7t
 j+Z3zXuA2uJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCM3VAAKCRDSWmvTvnYw
 k0S0D/sF9ukm9/9KfGdv+nlLyLExnkQR27fsvEdETZFKMEUnE7Ddldd34VTawbOtj22D3sbdGSy
 q20NRvbzh9in17YTCTsUzKNSfmmtI1m5NJu55tnVeVvLzPaali5+bLl38MYUCYcz+u1c4YT9Crx
 5of7fYd/VMQ2scdAN8YgIW8SSMnlXCByGW904e0Z1kjgwBd1ic5YU3GNJh/y1AcYnRpBdFoHtsQ
 QX8Xvc5O7CURbX5kWsPGJ9O1mQfJ211nPGUrNLBgYiriGuvl8OPqxXMl50hFfSyWPi3JdYZSy07
 UNgAXXqV0cCsQoB1kVmpXBpQe2uMPgVD0qJqleJOXj9DE7qr00hsH6ckacb58peR5MVsg0ZD6rX
 AeoXYK2JNlk/KyhSCZ2zIJ8ueKmYL8KoKF78POlPLUMV14fhKHMg4s3SK41gvO+txhAPpQaDcdc
 gsbGd9YmEXp7bJlLK0nGRlzCsucDNM0Km5zl64gp4frnHSXgRg9Ysb/SngnodBz+McYBNvo3CKR
 3YfaPUifYXdZ9rHWBUVQdg2q9VsVjmN2YYUYFKM3KxzVD1nDuQ/K9PWPXCwJrGtpxonJs0pbl3G
 VeytGcQeZ23ITMoNpZ5AxUvjISEVR7jIyNtMuWC0yBYRrUzp/5wv6th17a2DFGSJvN6wA/i68yw
 z2leyUOuY6MRbbw==
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


