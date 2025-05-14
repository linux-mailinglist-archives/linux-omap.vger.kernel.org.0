Return-Path: <linux-omap+bounces-3716-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F264FAB6AF4
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FBFB8C1166
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD47927A46A;
	Wed, 14 May 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOHchC2y"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE527A45A;
	Wed, 14 May 2025 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224282; cv=none; b=MvxOeNYKttXSyg1o86CYWMvUjo/bzwuXfcYzBab/QbGLKybcUf8m2vvmamgVvlrrSkRkr+pFC4M77Lacp74Tw14/LG4wIW1z3jqQteQo0VdSjN54VDZSwhzX84ztYgXMsoktwDBH+yEBNQ828EmMkL1WDwfcC3Pow2/koAxDVFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224282; c=relaxed/simple;
	bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=foxgmZcNASBwJ//7KX4eD5RspEWz6JfIPk0YZIY4x59Cc+0QhbYm77NOx/RehzOQsHFwKJHb0HShLHBLCiVPgeeOLFRQtJB5XYgTtTYYNTGTj7Fj78k5kGLSv72yxDVB2UZRLh9WvnSLDp8tZY9GuQlcsxukIzVhhHvLUpU4Jf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOHchC2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13872C4CEEF;
	Wed, 14 May 2025 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747224281;
	bh=7wsQp+uaWY2u0ja4R/dpHDQPnssNtRTBw5npmaUzg0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MOHchC2yoKnD6N2/T8ls9UgCI2vvVGk02/h2HpJoaDcdsmiFsaPQS3AocwqjQP+Sn
	 6d5Y3BqbZ9sUXIILTpVLEqCaZ0alaz5IK0zoqBPvfpd9zTdyg95IQMNVWm7AnzFWfd
	 AG8vEgXRd7SsyzvAftKg5hcev9Hy/sPFV4qP4K533NVDh3kQp6mRTAuyFhF+q11QQ9
	 +nSVqXcIKPWu61d80tyRH2h6eYz/n9dRZCz15O4Gu251vv4w0sZs9dvvStJuNeLl4w
	 GxXRootyqVQjr7+Jz13adhRfDFJS4C5z9gWL6G6zc9vGYJGtWUj8bEAe9XUCU7fgjh
	 ELrX2p1PivJcw==
From: Roger Quadros <rogerq@kernel.org>
Date: Wed, 14 May 2025 15:04:24 +0300
Subject: [PATCH net-next v4 4/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_ucast()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-am65-cpsw-rx-class-v4-4-5202d8119241@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
In-Reply-To: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
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
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBoJIbJOP4nWFsmWqWu4CgyBKC37Z3H89P3rSEyn
 q7oyxLVRu6JAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaCSGyQAKCRDSWmvTvnYw
 kzlbD/4zEnd8HDvHkxxm3C1gkgZpOf4MX37wW+nePovZhMGLQJbo7STPxvHWGczCIQNnrUXzR8o
 A+PT/KWBLMwgDRd3NhwTOewKTft/s/5tos8fM1+R9kWZ4G9KtOZX1dpcTuP04W2y8zC8PPEVyDE
 pQ7ph+VAQ4PaOv7dv+tZgorE9lk8uttDwRLetqot8rXmj34OpbufIt7L4R3gMApHv5z5Snnz5Fw
 LHTsSzBy5JS3QI0Eqf02Zg/hcJ9z2/U2MWe/bdWCgd6usBNpQrd6AYNumstL1CGMgSZqDsozhR7
 hzs5Pe2oeKa6PXK/L7SbTvwxr5UbOwbzrIKGi8/RQAeZsrNXUfjQBp1RF+oniqanB6SUIyOodCk
 Fu79MPtpFIUzo5xepPpw0Vn7g1aMWgz/DYpUh/C2MEgA4dnDiU8O9grjuGhvXJ0rTUliruK9IQR
 rPlQ2eiDiMLmc9QILZea5FPq72vAPenGunPBsoqUX4e/bmiTFc6cjZKL/4OJ0zySrXnAyU7qJBD
 WBMlxz3oLIAHn67+SzxmahFmbsoS12xEx2LcsqVzVci41+Ay+ShuD/h4PkDEfjwgiaK7NZ5bfCr
 s7oKPkouR182BmjAu7FVOdRZI5AXaSd5hRdohsnxRa5wsH9sbNvCL03U2uY1Iv2Da3v5uaZiO4Y
 KLqOrquaC3ipXSw==
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


