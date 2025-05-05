Return-Path: <linux-omap+bounces-3658-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A45BDAAAF5D
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 05:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24374166504
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 03:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06AC2FA812;
	Mon,  5 May 2025 23:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iY69dcXy"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101A381DF5;
	Mon,  5 May 2025 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486571; cv=none; b=BgKw0fW5RDFRNBfiUenER61kxR4odS2zNtiRyb5pp6oermC5Jsbe3Gf0uIA1TIMp7j/qGQD2Dvjq7OE9rFN7Eigw7uyMcD9xNrJMxp/qWzEpjKeCfxChozXSzmVHvjTXMiRKtxD3Tm1NNclcbGdp90DL6ct6oGGzhzv+zfdhtss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486571; c=relaxed/simple;
	bh=nzUV9tgjnukF7hG64rvR+C0pNLtSPqeM60qMohGRKDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b0GHi41rzUHUqdVO6bIgqBuOiVUtLBnHNu2NfK2S/iB8MDGw8CKYPliflKPJnhLHzwCuMlT2iCVdjGce5nKGcRrIVx4Ybsbp1SK2T2k7njykJGSOsPGteQXWnR5mn/wzepBlOez+EaB6AM+zYohFk4dsMhmzw+6nF20RwirZ2Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iY69dcXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ACBC4CEE4;
	Mon,  5 May 2025 23:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486569;
	bh=nzUV9tgjnukF7hG64rvR+C0pNLtSPqeM60qMohGRKDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iY69dcXyv2P9OsxFJIgxV9pC3E1XHqczc3a8sR//bi5f2vH69AB9CCVI8SHuO4tgU
	 ZeshqbNKaNeUWRbjRmJh5L77xfT9yJ6s2PYuiBZdTXCqvhUlVrHm6d7w4rUjoRnuKA
	 5/JXqPqtiMHb+lbS6NGPLhBVHeap98go4cwb+JKa8BcX7J3rCRDji8pt+bKfWPkD/m
	 eYjF/zInNGrQRLaKPzHgWGjFthl1JPb22Nwb5qSOZb55qmcGhQEUmzIk1s7xfRuffp
	 ev2Qw9c/S+j9+HQVAw0XdLfjbFCY4EfoqDABfscUQBcQfDv84uMLPOkLNU5z913Jna
	 KbhAY8AgjeKkQ==
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
	aleksander.lobakin@intel.com,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	u.kleine-koenig@baylibre.com,
	nicolas.dichtel@6wind.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 095/212] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  5 May 2025 19:04:27 -0400
Message-Id: <20250505230624.2692522-95-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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
index 6e70aa1cc7bf1..42684cb83606a 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1411,6 +1411,7 @@ static int cpsw_create_ports(struct cpsw_common *cpsw)
 		ndev->netdev_ops = &cpsw_netdev_ops;
 		ndev->ethtool_ops = &cpsw_ethtool_ops;
 		SET_NETDEV_DEV(ndev, dev);
+		ndev->dev.of_node = slave_data->slave_node;
 
 		if (!napi_ndev) {
 			/* CPSW Host port CPDMA interface is shared between
-- 
2.39.5


