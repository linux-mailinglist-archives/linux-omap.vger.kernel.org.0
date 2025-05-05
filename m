Return-Path: <linux-omap+bounces-3654-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A049DAAA411
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 01:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8678B7AC765
	for <lists+linux-omap@lfdr.de>; Mon,  5 May 2025 23:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7528F284B36;
	Mon,  5 May 2025 22:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pq/IE7Np"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27C2F6648;
	Mon,  5 May 2025 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483902; cv=none; b=GwJjsyc2D6GzSr1FkcWGlBbGeN2QwCNl8frY+Ld39zKJVefJVdGnrobXV9JMb/AMlIu675RvDWeGQ7/ikluUBFe/rBKjATdm//x+Y9XVjtOWJSIGrvKXZrVhMyDJWR3CS/w609FLOxk+/A2TO/kGQ0UO/FjHGN44X/bKPviKb48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483902; c=relaxed/simple;
	bh=hPGDMPxI4Jtk67vaUVuzunpBf/jA19y2TKrx0ghs468=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gQyaGwmOkQ0AjAt/u0SDAzw4tvRsfWxS9I12vvJGB3Th5XIvnGVRZe4cimziQxFKFQ3Zx5B+KgRs8VRS60ZSACPK4o7dpKZ97qQZ0OhhMfpnCBCaL12ifUAvmuo5/Z0h+Puw6OjhBCW7BrDyn0X+Q9VzyY40PeHZZelyMBpy7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pq/IE7Np; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3E8C4CEE4;
	Mon,  5 May 2025 22:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483901;
	bh=hPGDMPxI4Jtk67vaUVuzunpBf/jA19y2TKrx0ghs468=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pq/IE7Np334Ee6zTRsZKi5jjXy6S5Qgl0BWuZ1hzQ48vL8KIlixDH4KrJfMK8GZJc
	 ByCCUtjU24vcs6H7+ZmR9083bxV2JnZDkIQMlTSz7eTbiz+tbbsUiS4cCK8/6XKz6J
	 3b4SoaXGKj9G6gD/YVVIzodTLUGHfxX6aFa5TVK0lr+t0e6yi6WzhykmcsR3nk9HtN
	 8Yu7b2F4ovqXwM6DVJGf3QJTAgXf5mdcHfvObw1PLeR0DxecxH6gbCBFCrsGPNnVim
	 NYjqqm/YvtKUM33uddjcUj8sMA5Z07fKyjvF1WzuT5rfNW7nelnnSCWiDxteAW8Zyv
	 g77zKObhQ/1kg==
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
	michal.kubiak@intel.com,
	nicolas.dichtel@6wind.com,
	lorenzo@kernel.org,
	u.kleine-koenig@baylibre.com,
	aleksander.lobakin@intel.com,
	hkallweit1@gmail.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 261/642] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  5 May 2025 18:07:57 -0400
Message-Id: <20250505221419.2672473-261-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index cec0a90659d94..66713bc931741 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1418,6 +1418,7 @@ static int cpsw_create_ports(struct cpsw_common *cpsw)
 		ndev->netdev_ops = &cpsw_netdev_ops;
 		ndev->ethtool_ops = &cpsw_ethtool_ops;
 		SET_NETDEV_DEV(ndev, dev);
+		ndev->dev.of_node = slave_data->slave_node;
 
 		if (!napi_ndev) {
 			/* CPSW Host port CPDMA interface is shared between
-- 
2.39.5


