Return-Path: <linux-omap+bounces-3317-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F501A4B944
	for <lists+linux-omap@lfdr.de>; Mon,  3 Mar 2025 09:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1117167CAF
	for <lists+linux-omap@lfdr.de>; Mon,  3 Mar 2025 08:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D441EF080;
	Mon,  3 Mar 2025 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="CYcVlL/P"
X-Original-To: linux-omap@vger.kernel.org
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD511E1A31
	for <linux-omap@vger.kernel.org>; Mon,  3 Mar 2025 08:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990451; cv=none; b=t085Ono5kjEl3WlBickq3IuoWN6cv9Gg1uWajG6kNNEFtv2FHyTbfj5A3Vi+UIvKTPr+/56MWLctAQzW8cC3/40NrgDk4reMkBdFHqDHdFnFzNSWi3PSZcrmL7X+Jw6QFi0RAkOajg41hC9dEpqbwZ5st+XcIwbmcS59ABh2L0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990451; c=relaxed/simple;
	bh=dZjutVIqRkydhliHBlHKI06qmvIDPbtRY2hMGF3LUjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9BK5B6IbYoz4/w135K4u/u+rUP7U1+5v5UKtyo2bfjZSRywRrzwnzGOi8nIrtrQ3H4EU8AaiSpOvlBH49Z3GOdB0VKs6csXfPiba4EN+UkNlrVTYzXjjPjXYr8PyMSiP/7Zpu6uCq7LzfT414XV8Kq90Sb2OgZJTs26diYKDNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=CYcVlL/P; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250303074707ffc31dae7b571673b7
        for <linux-omap@vger.kernel.org>;
        Mon, 03 Mar 2025 08:47:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zrUY1LdFYD+ZIm9007t+7YM/d7JBcqpKOI6aIegZ2eU=;
 b=CYcVlL/PjL68bJNlRASUCQFR3d/gIjvM8s4AWiorZd6ei35cbjWVNs6MczurZckPUN1Rcs
 iHZ5t/HOJYIxhnroa7iKaNK1OChsV3p0HcM/IK+AJlqz/Bh0kPTHIBJ69rCl3Fe5g7U4F2JF
 pIXIbZVy081/oEQpulGIusFY+b7+6j+EuKJfie3f2YKeQCiyaScowPbnyR6APxUWfNP7ES0z
 MQuc2WdhLii8ZsqxFztRSOL+PjlwH2s2r6+Pcf4FCquunpcwJydjFZ+MhpDWQD2yNesOcYzP
 ZTikariIq1dGzkrS1XGfgIM1tAB3A+rsx4vlwGVyua8NZ0jD3tVlUg0w==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Roger Quadros <rogerq@kernel.org>,
	netdev@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2] net: ethernet: ti: cpsw_new: populate netdev of_node
Date: Mon,  3 Mar 2025 08:46:57 +0100
Message-ID: <20250303074703.1758297-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

So that of_find_net_device_by_node() can find CPSW ports and other DSA
switches can be stacked downstream. Tested in conjunction with KSZ8873.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: cpsw-nuss (am6x or K3 naming) -> CPSW (am33x naming) in commit message

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
2.48.1


