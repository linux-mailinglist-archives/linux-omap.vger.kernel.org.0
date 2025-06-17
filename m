Return-Path: <linux-omap+bounces-3889-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5153ADBF5D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 04:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C10557A2AD6
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 02:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA361DED7B;
	Tue, 17 Jun 2025 02:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KUgFjIlt"
X-Original-To: linux-omap@vger.kernel.org
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86717BA1;
	Tue, 17 Jun 2025 02:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128778; cv=none; b=HwWtFSpSYpvS0aqQREdkWhlSr3WMJg2fb8gLWLgwhBM4mywJV1Oo5M8ppgvVzRPaiK0nODBhMXK7MtG17ViCMG4lIM9aOy6bojHDfBUraGj+qlsqz5oZ2+MgBPER//ZWeqir3rajb/gamolJUQAM8F+u3/uQ7oIsoXWnufXjipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128778; c=relaxed/simple;
	bh=W9fJKLe2wR84h2VrmjzQtkDbhuruEgU5j31sPL0XNY0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=GE1hThiS53txlPc0+HuDFfBrxJxmjv2tqxp9qUijHSCKPRit07gQd3d3kSdvkgU7Rfdph9P9l2AX/ZThFLvuSWi2CTO9KVXmX0b5/VvjAv6f0FhjLLCW/qf+NDird3dkvgXNt6nG7Kwv0XiFjWKpMk4WqXmbLSeV4fPeR+sc9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KUgFjIlt; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750128464; bh=9bdvI/j47gzxAn9bte7+qP0EGwt9RgXTXOAGmzGFRqM=;
	h=From:To:Cc:Subject:Date;
	b=KUgFjIlt+OlOO9wN0U5gkaCoovINlP+Vrk+jZeJMWL4WF3o2VLqotHP1Yk4Hoapqa
	 vI+P7IoRSJS2kuL6Lb1NxloRnQyM+6Paen3xHCgYGcSrY0DvuEZbnALmznw4O63KdD
	 tq6oZfOtgVbDku1lLM/bFa2YPHkgeB3QwnGHILu4=
Received: from localhost.localdomain ([218.76.6.102])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id A661E461; Tue, 17 Jun 2025 10:41:38 +0800
X-QQ-mid: xmsmtpt1750128098t35fbsk4g
Message-ID: <tencent_C3FBDADE7060045B2952DE00576F922C5E06@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLlQ35giN5wSf1QGuEgWPqCw7D1PT/zvkubzW6hww6YIEj4H5NgZ
	 4H/+lUOldjdQNn7LF1ZhgEuvBGA5vCwmDe9See45GnP6REFgAGHaHCIbcUMulh9MnqNF0kfaC1JV
	 CRJ1h0Eou/WFHtcORu43yV2DE83fWHtk6kS6TZkXwDa77EpJTSdwi5T8W1gKktuQzISn5UiJxiHE
	 /yM5WCN0dQc65n4xO26WPfizHDOEvhY/vhVNtPSc+3ZkbNktlHDNNMxk16RSs6KH7R0fIwIrOJxb
	 Rx3oat6OyglKIxK7A6F502L/eBC9nbFk5mHf7ULFYa9iG0phxnthIfKpfdZpKesx/EPS3qoIU2FW
	 /0qbxsbMIKyRDrlE1u5/OHwOScuA2XrYbPIn3n5WIq/PuBTpEBAZUfP8HWqU3h2GjyQ6g7XTQLOG
	 CAlyIFxdGok5/rtAN0n3hLcOGbSjY/QBvPQnCKl2t1ZIHEJfY1msKVygMLIt/ersVGmAFyRaWggx
	 z6wObA5Vj9O3ZbLobR3fD34FmnoScttn2MqQIWsX6mpmKUmoT1lsJHI5shBEdxAmi/Q0hnodGMyf
	 pYC7cTtWS6Yy6wcMRLyKZLF4PJgs8btcks2uHOOgrBRZqfQZnxpMNLgqEp+9N4zGuyM+lchdy3+L
	 d+abnmKKZ+Hiw+dvPzFoSxaiJ7cYRaWjoZ7X/CydpnXOp/vwkOUqWVZuKqHRV1GM4Vhy2Art/pW3
	 LfGukMHNSXjk1tNWA6v1SF0ns4dFM+cyZAr+Yvytss71QGVVuT2g5xePH2p9QDVKf2QMF+EDH4lA
	 rkr6hmPywJz9yDR+VzVWzRMYpSSNDh6VOLxEVC8jh7zVXzFyw/j02BWLJxDxrtV/7zQplbBbb7dr
	 KFrp/EDfBpck1nGDd/tLcfshn1Rbet53RLnPnuTw8ENrvwTVKMeAEOCLoF9VSjgcQcjDPGl6OS8w
	 S8g/Ipk4FAtrvjjCzJhcYoijKZopLeWxDWOJKCSenOPBdYml7tkS0kee5+dx6i0/sUCmQF2OhMRk
	 A+GRnoMytl6/jxtiEClqYAKN2BT3QXJyXiWh5EMLY3vT1/ml0F
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Haofeng Li <920484857@qq.com>
To: Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Roger Quadros <rogerq@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH v1] mfd: twl4030-irq: Fix unused variable warning when CONFIG_OF disabled
Date: Tue, 17 Jun 2025 10:41:30 +0800
X-OQ-MSGID: <20250617024130.1689363-1-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haofeng Li <lihaofeng@kylinos.cn>

With compile testing on non-OF platforms, compiler reports:
../drivers/mfd/twl4030-irq.c:679:46: error: unused variable 'node' [-Werror=unused-variable]
  679 |         struct                  device_node *node = dev->of_node;

This occurs because:
1. of_fwnode_handle() is unavailable without CONFIG_OF
2. The 'node' variable becomes unused
3. -Werror flags the unused variable as an error

Fix by:
1. Replace device_node pointer with fwnode_handle pointer,
   initialized to NULL
2. Only setting fwnode when CONFIG_OF is enabled
3. Passing fwnode to irq_domain_create_legacy()

Passing NULL fwnode is safe:
- irq_domain_create_legacy() accepts NULL fwnode_handle
- The function has appropriate NULL checks in its implementation
- Equivalent to original behavior when CONFIG_OF is disabled

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/mfd/twl4030-irq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..8297966bd957 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,7 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
+	struct fwnode_handle    *fwnode = NULL;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
@@ -690,8 +690,10 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		dev_err(dev, "Fail to allocate IRQ descs\n");
 		return irq_base;
 	}
-
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
+#ifdef CONFIG_OF
+	fwnode = of_fwnode_handle(dev->of_node);
+#endif
+	irq_domain_create_legacy(fwnode, nr_irqs, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
-- 
2.25.1


