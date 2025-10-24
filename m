Return-Path: <linux-omap+bounces-4758-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B53E1C081D6
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2648A4027A9
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B780B2FABE5;
	Fri, 24 Oct 2025 20:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSSPyRyc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF422FD66F;
	Fri, 24 Oct 2025 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761338783; cv=none; b=KZvPQyzJ4r7KdHvt1kVzUf05kt1cnBlcduU0r256yvhnRzozNV5+3RQEvqydz35h7LN1d3CmDKWEoJguto4VwIccoZ6NfDvHmXpUjMQSxYK6cFmw52lint8qgpAy4Ghy784SGj2TqUJThgpbWS5tzqiE6Esd6ud8jz6kTbR2FPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761338783; c=relaxed/simple;
	bh=wqXdV4rD2eGMQ2gQ3K5CQxSUeggPo9nfI+UKAsg4OGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GM0oLX8jr3X3XrhrCR1mFPcJs/dUdN1eiYgsE12U0JwqelqO5k23eVsAFmcVrk/qQ3MirynngzLips2KlqErsYgEve661WDdYSJ28I/t7B+Qb76T6tYvk85k1m/CeqKaD/1ScWJpoZ6WzZAjlFkeEs2xAj3N/uuKhJ7hPPK7XQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSSPyRyc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210FFC4CEF7;
	Fri, 24 Oct 2025 20:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338782;
	bh=wqXdV4rD2eGMQ2gQ3K5CQxSUeggPo9nfI+UKAsg4OGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HSSPyRycf6/TMTmmH47r/b4hc3rRjerIbVkxdJVpqO7a/pWK8cBiF8y5ooP+SeK6g
	 9KmvsMCQid9CBiHYhy8unWuL4EJihEfdqIw5NjniDgbVlejXI7o7dejuy8f2ozyZTS
	 RBf77eJf5sgKbGYC5zX1YFuAo3DCbQ3C198ouxBb/z6wPPXjBcWoDIajco9sIZ0r9u
	 X/gtZZTVYvYQMJgOXz0ltihkwJibTSD9nfNqBcLnjZfZSLn4NoJDc/BKxxdq7jWsYs
	 pTLrG+NrXEIKzWdq8Cja2DIzI56fHvKVx0T7s4DAGC0wjkdNtp7qHxDFK6Jgd6tAdS
	 APVqpJ1YTCzcA==
From: Roger Quadros <rogerq@kernel.org>
Date: Fri, 24 Oct 2025 23:46:03 +0300
Subject: [PATCH net-next v5 4/9] net: ethernet: ti: cpsw_ale: return ALE
 index in cpsw_ale_add_ucast()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-am65-cpsw-rx-class-v5-4-c7c2950a2d25@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=wqXdV4rD2eGMQ2gQ3K5CQxSUeggPo9nfI+UKAsg4OGs=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBo++WOzTDEExucxTIX0/NRf51IHNKnGt3NyPQb4
 Ptwh7ucnCWJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCaPvljgAKCRDSWmvTvnYw
 kw/wD/9kOIxb0zaNHsALX8sioxIkjjnrQR0QQ26Is/YfzVqvEnZFfjkC2OWNm4nCUckxuKAmgv1
 JfDadvkp/PZmcb/hCBk7WMGS8Ewp494BeRPJjOmEdm/PoYsuTg2rBfkaPdgqiJIweB5s9s+v+Ao
 CK9BHs4Nv2epdkf5VCiA39RE7H45UvrxsHr4yzNh7o2yEx/Vg0pS8PSb/kagijMArVBNxDNx1lh
 bJsNk5xAYVuOgn+rLbaWuVsaJgRketSX6jwuBkZ8lj4rVjpvp+I0/h1eDIZicTmcA/Fvz13T/tp
 U4AGG58Stkn9aK/ScI0fk298guvjIZw3S9N5FlnUZ+ZeYTejkrLb3ZJepJf5GUXu5p1s0YElN5N
 sGZFKcKPH31Bn8F7NvKw72I/N+fwx+YItzVltos14rgm4KWO5Q6SH3qw7q/MN9m/T1wY/Bv++qP
 5wIQFLdnzYFqTG8y5nQ8DN160MwxuzNGd8M96dGWhSpoTe01gdVH44Sd4ohs4aKJqrDPAD05j68
 EIyti3s/PCYXdnOnBC16UzVbYUrpxYHM6sbMXhI10hHAgTu3t6qW7MxgaofJfmN8g6lkxQRQ9IO
 pUdZ/wMkMr8aOByrPWIO+xIM3nP7JPVSVon2qAvIY/Go7imrVrWA0wOBSrbTxqbLW/DVUcTgIyi
 Dc7G9HoBNt5jnOw==
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
index 11ee08b52cc102673187ac921a7e23b1cb9e631d..4d0141b63b1760b33fa670d9c00addb7ab816738 100644
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
index d46b14e87d836c9da190b5a27dde3fb85760080e..f0cd6a9b1700fa061f7042a81c073d835cc5cb87 100644
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
index adde50e7731d16af1a7f68bf3f8f8626fbe8b037..77bd34a8821d3044f5cee7d9c2343f960a4cbc64 100644
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


