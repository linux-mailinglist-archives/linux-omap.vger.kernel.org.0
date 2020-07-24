Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D4B22BFEF
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgGXHnW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgGXHnW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:22 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67D3920771;
        Fri, 24 Jul 2020 07:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576601;
        bh=7Y6Qsp3HGJ5Ii/fIf6Yq0qBPBqdTjN0QQ//7iQ2S+xo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q8lQ1NgBUnpMzvwNWQCIM9NCHIlVp3rxSAKN0ti7nKks09XipPLucOfG+2M67iK86
         BvjUHcN5p1mqFF4ALd7rVk3ndjTb8tJNxWDyNgpi36gMWDDGctzkBOqqXDyeEp5P96
         fzhmRjMwPp5097vV7OOyYsgqpB7qhSVCEFPgrDL0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 27/29] memory: da8xx-ddrctl: Remove unused 'node' variable
Date:   Fri, 24 Jul 2020 09:40:36 +0200
Message-Id: <20200724074038.5597-28-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The variable 'node' is not used.  Remove it to silence compile warning:

    drivers/memory/da8xx-ddrctl.c: In function 'da8xx_ddrctl_probe':
    drivers/memory/da8xx-ddrctl.c:105:22: warning: variable 'node' set but not used [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/memory/da8xx-ddrctl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/memory/da8xx-ddrctl.c b/drivers/memory/da8xx-ddrctl.c
index e8f9b3f461f5..872addd0ec60 100644
--- a/drivers/memory/da8xx-ddrctl.c
+++ b/drivers/memory/da8xx-ddrctl.c
@@ -102,14 +102,12 @@ static int da8xx_ddrctl_probe(struct platform_device *pdev)
 {
 	const struct da8xx_ddrctl_config_knob *knob;
 	const struct da8xx_ddrctl_setting *setting;
-	struct device_node *node;
 	struct resource *res;
 	void __iomem *ddrctl;
 	struct device *dev;
 	u32 reg;
 
 	dev = &pdev->dev;
-	node = dev->of_node;
 
 	setting = da8xx_ddrctl_get_board_settings();
 	if (!setting) {
-- 
2.17.1

