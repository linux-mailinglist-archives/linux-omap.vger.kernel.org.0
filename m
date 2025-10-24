Return-Path: <linux-omap+bounces-4756-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A1C081AC
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205143A03F0
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764DD2FC002;
	Fri, 24 Oct 2025 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfEkBc30"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070D82FBDF4;
	Fri, 24 Oct 2025 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338777; cv=none; b=a5ymNkcZTl+ZyujktwJtctrZboK1tmuSjyiuhuVg99Vrxh/UHLB7Sv7wcv2ADWzmI37C1u6KpP/yb0GqWaI3OpV7Cd0EZ22XaiNcN47Dnm9xDZlUEeirygSXrl2N2tfS8exO05Rs+ub13NdmTKr/vNJ3rU8c55ThLHQPFr7WItE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338777; c=relaxed/simple;
	bh=i8q7dEZiiJ1a8p5k8OATPXo0h7mF6Jxue5/RExPUox4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gmUwyBNIxaRoft8i3AEIefGXWE1WuyvXZVYIVShszZGCQFIyfQws+aiVYLEe7jaSCguo5jr8OaSxbXOhlpjAJGXfyqyoPzW/q0617ZA2uFWz3NHEXwvCBmV2gTDiWVPf77OZIhHX56G6qwbmN6Wrf+Yz3PlKqiYXhvNoorECsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfEkBc30; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00FFC4CEF7;
	Fri, 24 Oct 2025 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338776;
	bh=i8q7dEZiiJ1a8p5k8OATPXo0h7mF6Jxue5/RExPUox4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qfEkBc30K9+0dbZqW3Ui8NAhVLLLz7mtf6XFgtAF58m6uudiibxxSm7CvehppUsuR
	 PsvC/ldR9uA0t5D+bBvRp8nnayMZiwOIgFs+q8LPA1KAYdteGM0SUxaFzq7l8ho0GK
	 SoE0HMo8pJOzWCtKnj/TPFfKRIX3Cc6nCZqaPe7kXhFXC57dWHVRkR+RcVfMOEcibo
	 AhumJx3mZa6jQrhzc47XCALB7kX0B7YkeLQYupixOY9ZP7etVL+eKQOyxU5qAgZCP7
	 Tzbh7tMhb+BR/CiUFSGo/KoX5lnCvq46I3Ic0V/9N3lC0FNqmaK9jbsu0XhfmzW1Em
	 lmwxdcQ54/ryg==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:01 +0300
Subject: [PATCH net-next v5 2/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_vlan()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-2-c7c2950a2d25@kernel.org>
References: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
In-Reply-To: <20251024-am65-cpsw-rx-class-v5-0-c7c2950a2d25@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2642; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=i8q7dEZiiJ1a8p5k8OATPXo0h7mF6Jxue5/RExPUox4=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOZU6NYoEgZFZRjNhjRf12CJAM5dxtC8Bv5
 DXjte3EeXOJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 kxrBD/4x5h9nj3jUS8NUCxgsDPL3K4zNZ3u2XZVwya1/zVXSi5fFQpHqkA7sZMah6c2YNsEya3m
 vrY/efWwZit4Mvkk5Bqu7beGOIrgjOM8/XpOHx2nLx1W+FtOY4bHdPffxPiGkQeIvb9TPE5JKuY
 ymoIHqspA60yroyzWIbpmZrMPOhg4CXi8DcfgMx+QNod6/lCvcix0odA3fE5dtzvxDI3IKgXWHO
 CcS+zf6nIS7XqTiN/m125fJaHnbU7i5GKqeC+US9/NIGWVvWkuQOvLU78ffGZ5LkCaRcQe9q2eO
 uzwEPist8x2vOLBsHf3MYX9lnEjwgqR7PM0eUqjd/lvnh9nctVVioM02mrmxv0/nj6t2yU3QnkB
 EZGNda98kXxJEsM8KBR0wm4xaNcCC6+fLHgQRFn5LwAhs2fUbVcQqI1UMtnhMPujUf/4g/kH6tM
 OzDuUMMWS50MYuaDr8GQwobqe7mHmhcl6n0+BX1jXK/QQwIEcSW6SmEbWaTvTvDiT2EnZoHIa5S
 fDy6K1iMrmH4EvifUTN8zhHZX/rSUqXhQIoJ0YOe0Ufc+EvaFW1W0hjNMZE7UID4Zm60s1M6i+p
 y8RlqhyqmFL8/IcdVW3JDXXxhpPVmlxzbqd240/9pYv0arvyQ+7QYtS9NCS57PM7m4+8KSVRfSB
 tjLa7iNNcehaHzQ==
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
index 54c24cd3d3be639c90111856efaf154cd77f7ee4..11ee08b52cc102673187ac921a7e23b1cb9e631d 100644
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
index 2e294fea999f3ba9545a68f6884c313feb35c587..166de524d22a78a93d2f8c995f62e8c93b145943 100644
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
index 8b9e2078c6025a099e0f90d4d80395b7622cf0f6..adde50e7731d16af1a7f68bf3f8f8626fbe8b037 100644
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


