Return-Path: <linux-omap+bounces-3448-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2EA68833
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 10:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F168B19C7C4E
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 09:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E432586CE;
	Wed, 19 Mar 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9O7b8oc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB559254AF0;
	Wed, 19 Mar 2025 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376720; cv=none; b=LwVuKhjdr/X9DFPu9FJ8yF58Wt5rXyptyj5vg8VvKtqaeZv2aMLFt7bh+OggmzWUlig22VE2AvibrpbFZUsVK/qxCcJKmIwPzelHMdY1naGauCYZCkcuyjW5lU2NMbcAmUyFKwyakNJN0O07NgrHnTE7AjKGCnkdIw0jTAD4JU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376720; c=relaxed/simple;
	bh=pamQx90P4JddVSDYgi5dG5r3b51ayH5Zzm7osNypMq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gN4FMCn8jYmPN1ys4WaJD2nwPi4aB7Z2Xdoqb12F5ImTlzKiybyhdpivHrr8dFfifGomh3GYejlyHsFlXApTmMDX0Sn0+peoAh1i9lLLpYaXVtIJk5sLVdkw26wurou1cGHL5pk9RDDvqQTsYMJ/ezLf/t7hYUzzLrTX3Lmdhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9O7b8oc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C114C4CEE9;
	Wed, 19 Mar 2025 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376719;
	bh=pamQx90P4JddVSDYgi5dG5r3b51ayH5Zzm7osNypMq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t9O7b8ocFw8kA+vzq8XMGOcyEJq/e5s0gsWqqhllYzh9jPwE3ylw9RNcN8WljA0RN
	 Jk7kma1tOdMEPMdvJCNcnsRYXGaq9R0Rbrde5cEUe9b6Pz6grJvY4jcA9Fy3htSSdh
	 3+6VGdYfz7s67VW+g3bQqlFV5rV3Ksq8WU7qynBlJ1Yoa5/ETqw1KgIwPJAeb+Eefe
	 SGMYPJqhEjDD5O5CQkjX21vdGIY2bbqOiAjOvqys5SqAeDXB6akQCNkBxZLATsohBH
	 CGWc6/1+tqu/StrcmECZ2ZWbLt2rA42dfw9QxbnAqOqCQrW4LuDzh90GFT43AQ6370
	 NVr1JhdtCO3xA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 23/57] irqdomain: memory: Switch to irq_domain_create_linear()
Date: Wed, 19 Mar 2025 10:29:16 +0100
Message-ID: <20250319092951.37667-24-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-omap@vger.kernel.org
---
 drivers/memory/omap-gpmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 53f1888cc84f..d5bf3243fe78 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1455,10 +1455,8 @@ static int gpmc_setup_irq(struct gpmc_device *gpmc)
 	gpmc->irq_chip.irq_unmask = gpmc_irq_unmask;
 	gpmc->irq_chip.irq_set_type = gpmc_irq_set_type;
 
-	gpmc_irq_domain = irq_domain_add_linear(gpmc->dev->of_node,
-						gpmc->nirqs,
-						&gpmc_irq_domain_ops,
-						gpmc);
+	gpmc_irq_domain = irq_domain_create_linear(of_fwnode_handle(gpmc->dev->of_node),
+						   gpmc->nirqs, &gpmc_irq_domain_ops, gpmc);
 	if (!gpmc_irq_domain) {
 		dev_err(gpmc->dev, "IRQ domain add failed\n");
 		return -ENODEV;
-- 
2.49.0


