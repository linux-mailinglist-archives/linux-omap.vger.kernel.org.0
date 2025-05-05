Return-Path: <linux-omap+bounces-3659-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0CFAAAC9A
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 04:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2E251BC07DD
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 02:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874F32FE0B7;
	Mon,  5 May 2025 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/PTVPJ5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93F2F4039;
	Mon,  5 May 2025 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486941; cv=none; b=jN0LWYCgqixfb5hwGiRKJ7z9wZdCbcrYlD75lk6+ubfahCjzn3qa8uiO7Ek0BekqJY0EbUJXC6jRUBG5yNztaFjIQvsVG7wGq1d2MU8YTwibM3otUr6fkCDMAjGU7O8e2SGA08Cf5X/uohpxmOLeZNPvdesS1zZfDDSXFA2gcx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486941; c=relaxed/simple;
	bh=zpYXZf/1szlzcErFIeG/BZoeXx0H2PEPmL6HjLHy8H8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZrJPsdeVlex5NBRes2KmAQYBbTF2u0yJmZK3HwxIZrgO6I0XHcotpSadsf3+XADCAIkzXeiK8GclBPf0voCqXIm5ZSxcKnaxuxvOwG36GzmedAkbiQ5+/BZiRaIVQtXIFfZ6ihF946+XqeSvdL5GUD39M1nu9Vb2YB3UIQna2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/PTVPJ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41EEC4CEED;
	Mon,  5 May 2025 23:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486939;
	bh=zpYXZf/1szlzcErFIeG/BZoeXx0H2PEPmL6HjLHy8H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/PTVPJ5mlcVF6ywpuF0DbDhsqhnBW/NsONWR0nzERD91/SREwPb6nMwQ8W3faEqm
	 Q1eXvsAA6okcXUxWoYoXuT3R8KdwN3bKGfMm0QkJJLRTV30T1KlnAVO704/eOB177K
	 mb4mta6hQtO7rZSu8nLUFpXFdI0xlITT4PeO0dWK/OXUU8K+5S+gw0EH+Yv2zGE9s3
	 3ZVhzuzD+qSArgKkRHocZ/15L8zAfmrAeOQglG46iyJ3beEeknnkMvY0qseGrUYH4t
	 0c2iA1Akhi6O474wszth4rqgXmRQaQLWSvifE3k3EDJnrjle+phw8idQjm3IRJ1Qey
	 xS4M996tXWEpg==
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
	lorenzo@kernel.org,
	aleksander.lobakin@intel.com,
	nicolas.dichtel@6wind.com,
	hkallweit1@gmail.com,
	u.kleine-koenig@baylibre.com,
	linux-omap@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 069/153] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  5 May 2025 19:11:56 -0400
Message-Id: <20250505231320.2695319-69-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index 13e34ad72f265..923746ba87a61 100644
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


