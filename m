Return-Path: <linux-omap+bounces-1490-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B21D8FE632
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 14:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 308661C251EF
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F59196DAB;
	Thu,  6 Jun 2024 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlynfY2f"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92581195B2F;
	Thu,  6 Jun 2024 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675813; cv=none; b=Iva2ZvKIvBtCPWPWTMR9XwK9lfVg9A2Po3LXQ8rs4Y0CbHfsMkxC74EOOfAiwNi53UNxgtVvot5rNF3fpHfiuj+qAZo2QPWcE69kK1tolbW74ZYii5EwWxKlHEIPHolEWqHWqEZWoKtdWrkowByme7N/EQdx5tNV+FgX+TvpLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675813; c=relaxed/simple;
	bh=9gvRWld+0F7eOJkm5HDn0iZvrcoNruU+wwvFd26mihw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5cm038rWE48G1AXXM/9n92yw2hQo23g2OxgOGYJUukxG4mVGKL+41rhf0ANUER+SCwzQJeilvaAHyU+yWtYpiB4dYYNFQQPbVOandYc4ItaAD2UkV/uDaPBzHov1IqBXcu6ZVo9uwyuEp9tNAD+1GEvHmsm7hznFNMN9a6nifI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlynfY2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FF0C2BD10;
	Thu,  6 Jun 2024 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675813;
	bh=9gvRWld+0F7eOJkm5HDn0iZvrcoNruU+wwvFd26mihw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MlynfY2frYY4bCzmSpFENjNTXNGdiXXaXA7dlcKqKms99ZisDhXgbj9Ecjo5iHM7f
	 Wx0UPnnAbvRu6/gUB8WsNAQ2M1KFHo7JNIuwWASoYIRwmHJJCL7l6HA+G57rJCJSYL
	 E+MolKgcmxNXUujUcTQLYUj1DK8v1gqp0RxPts3jSx7Wh/6oaJonY/72JfMCc/61X/
	 xDx1UgcQTl46KUhbG3Iv4Qg7P1t0fEV3JG6NZ8h897CkQ+KA4/aRJT+P1sqOt+cOLV
	 M9O8g7u8trPJF8x+nmrMEgrosII9Ki/DW5XyiMDmzsXXJ86CbhCdhyj8Seu0gCM3K0
	 M5cKGU8Zcrygg==
From: Roger Quadros <rogerq@kernel.org>
Date: Thu, 06 Jun 2024 15:09:23 +0300
Subject: [PATCH RFC net-next 7/7] net: ethernet: ti: am65-cpsw: setup
 priority to flow mapping
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-am65-cpsw-multi-rx-v1-7-0704b0cb6fdc@kernel.org>
References: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
In-Reply-To: <20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew@lunn.ch>, srk@ti.com, vigneshr@ti.com, 
 danishanwar@ti.com, pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Roger Quadros <rogerq@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=rogerq@kernel.org;
 h=from:subject:message-id; bh=9gvRWld+0F7eOJkm5HDn0iZvrcoNruU+wwvFd26mihw=;
 b=owEBbQKS/ZANAwAIAdJaa9O+djCTAcsmYgBmYacIOrfYYLF3V/R88Xdvg4iwQBkvTvEvF1jGG
 93WvlCbY9WJAjMEAAEIAB0WIQRBIWXUTJ9SeA+rEFjSWmvTvnYwkwUCZmGnCAAKCRDSWmvTvnYw
 k17lEAC3C+yCYk4I8XKIhjG//nL3J80N2xjxzMnP2EvvBo+sMF4C6TAZsC/k3dqJCQ4IOk6X9kE
 /cuGdyTh24Fqg41+W4ZHArrSb7XyG3rRra9Wbr8doZL5zRsJq1afdqv4e/uYF/EZPmUxSpmu4h1
 AJaAJ3oMWgNhGPDnTA21d/9V/Eh+amFhSTb9+a0mi29f7u3U99HrpqNbSMSQ6VSknp7CUhUIwO/
 USgvoZ9a60UWMvi0D9JN+/ISrUmPQnl/INyOWy/eWeb3B9ZcOihYPUXBXNNwrHTKt2K53Q09yP1
 oWfNIQJeoptQYrt8APKU2GUnZNDq/94p2GpjJ/HvYCBOBdlTA9k3FFWEYS+QKcIsP9ioQnVpuH8
 P1vMimYmwx4Pm68QE5jXEGhBoLqVMfC66r7dWYOcTmhnbb4Z4dGQFssQfd1DoOg9qFg3YQLlkcS
 O0AhT9pM9JQYZB1GZvZh4FHQODLs8H/nupXyiAPzjFslIvmRvy/+xCeMbIzOet4qI1cL2EaSu9P
 3so6H902XSMbQGZoCsc6sO3RidRSutoAwZAiqnfUok2WnNtJfQpFOa0mz6wvZlUiXOQmplc4OcI
 FeQ0aEbSru0hf8KGt8ldEExTIqsRdyrLKZ0tOkZos6mL4HsCpVaxtVSvvcQH4QAMz/9f+TEFLXt
 z1/FKod1W+HP9AA==
X-Developer-Key: i=rogerq@kernel.org; a=openpgp;
 fpr=412165D44C9F52780FAB1058D25A6BD3BE763093

Now that we support multiple RX queues, enable default priority
to flow mapping so that higher priority packets come on higher
channels (flows).

The Classifier checks for PCP/DSCP priority in the packet and
routes them to the appropriate flow.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 1e718d4671c9..7d810b143248 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1952,6 +1952,9 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 		}
 	}
 
+	/* setup classifier to route priorities to flows */
+	cpsw_ale_classifier_setup_default(common->ale, common->rx_ch_num_flows);
+
 err:
 	i = devm_add_action(dev, am65_cpsw_nuss_free_rx_chns, common);
 	if (i) {

-- 
2.34.1


