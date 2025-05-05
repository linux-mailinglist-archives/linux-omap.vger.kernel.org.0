Return-Path: <linux-omap+bounces-3657-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0CDAAAABA
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 03:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CE884C1359
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 01:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23E02EE46E;
	Mon,  5 May 2025 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkVgLrrM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A1B38537D;
	Mon,  5 May 2025 23:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486040; cv=none; b=moaso+6fq2+24BYJedHwItmFc9T5WAvkIOhsI8JyZ3b4+E/96/HfnHbKFbpc5Vn+IEwJPoowlYpoDsgk0G1D8KU9E6XqsXELwuzBdd+UmVZLFmJ3Lqcj1eeVF68/KsuDbC4vOoRPef/YH4F73XpAp3OYBfEfWTL7FaPKreB1oNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486040; c=relaxed/simple;
	bh=01wiidAuzlRto34qRYL0NeZB/wjip2m8n3PeBjRuZ54=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y8oO5WCIBEDEc5Y98zhwjYhvjg2pz3AtrSflNdGB9BUnIMPq/ZtDqZxtVwC5RUgJixScpBYsUuXlfBPYasR3CEQXzhJ53SBGv5bnwFveVkjKAV48Uc7D/OgKLnVnrwPR1OAqgBpXLgS7QsTLDujP1twuPs4szeGGUz9slXaLveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkVgLrrM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20751C4CEE4;
	Mon,  5 May 2025 23:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486039;
	bh=01wiidAuzlRto34qRYL0NeZB/wjip2m8n3PeBjRuZ54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkVgLrrMn5s0UVwznnM6ytH/8S3S2FJ6li+RHtC1Y0MTZoqg3kkBwrLOA6PVMTCbE
	 SJIqrk12BKDt++cuExOzfBgobmif0Lsrb5kLMkWVwRdRGrj0kY4tVgq1pD8JNAtX/U
	 KWG1SlcYtg4u0CaSlHXpLqaTLLKBGx8y9OrwrSnG27BabryC0srAKqfE7u8CZOwBXj
	 5KeyjjlAfhHwVuf7cFk5wsIEcLYs6k7O1QStl/AkZBidTVBcJis1voVJ/+M1FDsKIc
	 gUY+elEmg662bJsIQ+Z6F3Hy8adl5TBtfo7yUMD+VGuTdDWGHnZRnwwLrKTDcKVuxr
	 NXuePmnwsQHHA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	alexander.sverdlin@gmail.com,
	u.kleine-koenig@baylibre.com,
	aleksander.lobakin@intel.com,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	nicolas.dichtel@6wind.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 122/294] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  5 May 2025 18:53:42 -0400
Message-Id: <20250505225634.2688578-122-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

[ Upstream commit 7ff1c88fc89688c27f773ba956f65f0c11367269 ]

So that of_find_net_device_by_node() can find CPSW ports and other DSA
switches can be stacked downstream. Tested in conjunction with KSZ8873.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Link: https://patch.msgid.link/20250303074703.1758297-1-alexander.sverdlin@siemens.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/ti/cpsw_new.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 9061dca97fcbf..1c1d4806c119b 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1416,6 +1416,7 @@ static int cpsw_create_ports(struct cpsw_common *cpsw)
 		ndev->netdev_ops = &cpsw_netdev_ops;
 		ndev->ethtool_ops = &cpsw_ethtool_ops;
 		SET_NETDEV_DEV(ndev, dev);
+		ndev->dev.of_node = slave_data->slave_node;
 
 		if (!napi_ndev) {
 			/* CPSW Host port CPDMA interface is shared between
-- 
2.39.5


