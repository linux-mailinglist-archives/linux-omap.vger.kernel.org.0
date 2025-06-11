Return-Path: <linux-omap+bounces-3827-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F424AD5277
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 12:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E748D1783AC
	for <lists+linux-omap@lfdr.de>; Wed, 11 Jun 2025 10:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8151C27CCDA;
	Wed, 11 Jun 2025 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KA2HLtZt"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A9427EC7D;
	Wed, 11 Jun 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638661; cv=none; b=DWTB2IUXPOqMSxPSl1jEgkdCmGpL9ZltbGfmdPrJny53zh/Cs6y6etf2jF1K1JksXquRe3obWZthyZMzhx2PVmPnGYo/vwITK6XLbZbp+B9rrS+TCeKpu+HIBlzv+p4et1EyXgz1FdUIEbhBXdawoBEnEDtfDADXFO0OWxKL4PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638661; c=relaxed/simple;
	bh=1m2Q8hIBn+Ua23x8mriGzVypFmGIfzQl3Yw8iPhN654=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNoTBSOg/HP7+F8IJfhL9uI8LCZnNG0TWxvVrZXkI900O1V8dHrmCxmv2w2BbECHart4L4m8yr1YkacglyqJsGea2j7Xi/ftC6wh0m1xlhU1lSCZSMQN2Z2dwB+zimbS+AmaJvT5MXgsDr5MUinLiUyCCEPMunZ9o19KoA6qRfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KA2HLtZt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC286C4CEF1;
	Wed, 11 Jun 2025 10:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638660;
	bh=1m2Q8hIBn+Ua23x8mriGzVypFmGIfzQl3Yw8iPhN654=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KA2HLtZtqZvyVi4u0KoXeBkEcfjAHOFk/fTpWM9iZcKy+U2uGRv/Gt/sLBxL0rG7r
	 BD+2IjVpIAJzyWYEDxd9j5+IJjS7jgP/ubdHJ+1kFe9XumPKQr6BOZsUA9xtrM9WYZ
	 gN7X3T6fdIliCGuClFvObcyyR5MA1UuE0oCvqlzuE5gDykp2zP0AEJLXpxXC3+1s3B
	 Eq7oZq3+cBkjGKm9ZQ8U36TJGaSSe+39XOp2cEOCbNid0sSFVjd66+OMeMo/AC2PJJ
	 XhDxGGL3B3UWwbd/YwCaU4hU5S8UYr7/+b2ThbYJsYQdSxZ54HJF8FtHXd71iVRVdf
	 hcu4WlGr6euGg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-omap@vger.kernel.org
Subject: [PATCH] memory: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:40 +0200
Message-ID: <20250611104348.192092-12-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-omap@vger.kernel.org
---
 drivers/memory/omap-gpmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 9c96eed00194..d9e13c1f9b13 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1455,8 +1455,8 @@ static int gpmc_setup_irq(struct gpmc_device *gpmc)
 	gpmc->irq_chip.irq_unmask = gpmc_irq_unmask;
 	gpmc->irq_chip.irq_set_type = gpmc_irq_set_type;
 
-	gpmc_irq_domain = irq_domain_create_linear(of_fwnode_handle(gpmc->dev->of_node),
-						   gpmc->nirqs, &gpmc_irq_domain_ops, gpmc);
+	gpmc_irq_domain = irq_domain_create_linear(dev_fwnode(gpmc->dev), gpmc->nirqs,
+						   &gpmc_irq_domain_ops, gpmc);
 	if (!gpmc_irq_domain) {
 		dev_err(gpmc->dev, "IRQ domain add failed\n");
 		return -ENODEV;
-- 
2.49.0


