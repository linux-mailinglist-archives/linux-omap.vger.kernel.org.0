Return-Path: <linux-omap+bounces-3656-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A2AAAE51
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 04:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2738B3B24AA
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 02:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F76B2D8188;
	Mon,  5 May 2025 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQzONJye"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F536DD30;
	Mon,  5 May 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485200; cv=none; b=IdspDht9zgFQ8o2c7pFDqeKoVNIndHxoQQW2djezCWGl9VfyKH521ASmkBwEiLGNM1zSKzSwwQRGBE98NFUuC+YDbQNNKRLkUQsRN2oAzVTomP5EeLWxaWz54fUtcd0LWoSJFiFD2P+wlMJLsalrsls4w9TMIn4rh0CUJ+bTW4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485200; c=relaxed/simple;
	bh=kiINvKw8UeJPMKrVPPDdggBN7qCqrAgYNgQSm+tWCUc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LBZCQX2UTvwjHGB8o6mIFki1OsX5wno0EOYRMj11XrwSm5XrJUU3FpD8h8BqQ/+dtWI4PDniTLpE9yw7nw1duGilvyp5LVvmPehgRoWlVPCSo9ukOE38gBSDL8j/bFxKqt8sosVf/dvwaiFeeak117wv7G5W9PSpIpUycXJJJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQzONJye; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757A6C4CEE4;
	Mon,  5 May 2025 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485199;
	bh=kiINvKw8UeJPMKrVPPDdggBN7qCqrAgYNgQSm+tWCUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OQzONJyeDjey+4QTT7bKZeoAfEqUv9Z2v6E3x9k2Yb90MiCtn8R7VoATGs0RynkjQ
	 bg/F31D3EWHVNitXIxrwfE89C2cmnMBiyEjeODa87iWNP/hPhMtZ+DTfinNF3gfLk0
	 bK8UWT5LZWCPEQKiNkZX3JSRobSodpqd4b5xa6mBd8j34zeVZoRXmFVYD/LkeHgyKE
	 k+SoBTB4SghLkUnbtUY9ZRzVkasI/Wch2lYcW4QL+669AArdLf3TwXNAhQVnCTYEOU
	 6yEMj1Xnb+JDuD/8XY73vxY3x+yXVKgoi3lG0goB1wfWWlcMzxyYSrrFLtAzV97n00
	 PMqtrlDdL7mvg==
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
	u.kleine-koenig@baylibre.com,
	lorenzo@kernel.org,
	aleksander.lobakin@intel.com,
	nicolas.dichtel@6wind.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 206/486] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  5 May 2025 18:34:42 -0400
Message-Id: <20250505223922.2682012-206-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 557cc71b9dd22..0eee1a0527b5c 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1417,6 +1417,7 @@ static int cpsw_create_ports(struct cpsw_common *cpsw)
 		ndev->netdev_ops = &cpsw_netdev_ops;
 		ndev->ethtool_ops = &cpsw_ethtool_ops;
 		SET_NETDEV_DEV(ndev, dev);
+		ndev->dev.of_node = slave_data->slave_node;
 
 		if (!napi_ndev) {
 			/* CPSW Host port CPDMA interface is shared between
-- 
2.39.5


