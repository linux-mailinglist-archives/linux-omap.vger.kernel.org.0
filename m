Return-Path: <linux-omap+bounces-3661-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB0AAB5A9
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 07:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034CE1B674B3
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 05:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6004A3C22;
	Tue,  6 May 2025 00:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrkPNUPO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909E828AB0C;
	Mon,  5 May 2025 23:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487191; cv=none; b=sodoKnWLa/qoG793oOT0MAnt9QFp7DDGF8Wsmyv4n0czrxJaO+7UzbuYUIjqRBC818R29rFHrmWWuIN3wi71RmjwpX6bjnEx5rvQ4tk73bKON63TEOSqNu5W/NA8c1sRIKNhXP89t82muSeuDYvZHoqLZUs/FWy9G9qOixJe/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487191; c=relaxed/simple;
	bh=5z5mejJ4lJQ7xauFMS3AH3ERPz0KEqrovqj9Hs4PAZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PCSHrziEcnE6CyIZkmOZJ2q7sh73BdtKczJRicl64jJl702RDHRrLQRKqG05ZTlkbN+s4ZefEDCverSKOMfAf6o2FCGSY+4fuQcZdrLj3dJA7+2oeOtM/eKZjKCo1neG7528RwTfUXzbkANhroQQOsFUga8u++og7nmrDQRmjM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrkPNUPO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4EEC4CEED;
	Mon,  5 May 2025 23:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487191;
	bh=5z5mejJ4lJQ7xauFMS3AH3ERPz0KEqrovqj9Hs4PAZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VrkPNUPOCtZ6dCkl6z24q8eK1cIdNziaaeoRdo+iMkTwMGa0M6wMW5CbwBiDAXGtb
	 SkZSKfNg3xjaxQFfSA4E2OuRUqjEU83HX4Sk6cSqNPFDH7+qVntrQ/qr4x5u8wp7bU
	 Orsj3TV/7GWgTZg/TfxCxsfuztc761hqU2lWNHGK2iDjoW8Pj4djneXSU53xq7DbxQ
	 uxUKwRyWbbkc4OAd2XI0XydKg8Vtp6NyhsJT2eCW+YY8c8Gujz8WJPa11jkyfFutZg
	 /JVqhyl74tyQuSeipjvC057m2FYj/bF/bcTozEHSoAzi6XH/OTIl7xYttsfhj8JATc
	 YdFzo9LU/kjlg==
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
	hkallweit1@gmail.com,
	lorenzo@kernel.org,
	nicolas.dichtel@6wind.com,
	aleksander.lobakin@intel.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 049/114] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  5 May 2025 19:17:12 -0400
Message-Id: <20250505231817.2697367-49-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
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
index a1ee205d6a889..d6f8d3e757a25 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1427,6 +1427,7 @@ static int cpsw_create_ports(struct cpsw_common *cpsw)
 		ndev->netdev_ops = &cpsw_netdev_ops;
 		ndev->ethtool_ops = &cpsw_ethtool_ops;
 		SET_NETDEV_DEV(ndev, dev);
+		ndev->dev.of_node = slave_data->slave_node;
 
 		if (!napi_ndev) {
 			/* CPSW Host port CPDMA interface is shared between
-- 
2.39.5


