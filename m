Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9002522BF8F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgGXHlZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:34684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgGXHlY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:24 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E8BD20771;
        Fri, 24 Jul 2020 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576484;
        bh=wSYqc6zd8XQuJxIuMyrVpPOP0RSQXvA79nPZgRDW0wY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hpUncPWGDzGoTP9/S2oyMfSCw/TYT02lgI76NR/YUshrNZFMTJzujixw8UNVu6xUs
         2NE+SHzUZrcyiIp8mZ5zjDgiwM0lsQJjOtwg8ldIG17ipxcYGaWmkA9gw0n8C8Ke5M
         G68wajafmJUgFaD8IvXuzjODVgYyWlNjxYE9wFWo=
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
Subject: [PATCH v2 03/29] memory: omap-gpmc: Include <linux/sizes.h> for SZ_16M
Date:   Fri, 24 Jul 2020 09:40:12 +0200
Message-Id: <20200724074038.5597-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver uses SZ_16M which is defined in include/linux/sizes.h.  On
ARM it was pulled by other headers but its inclusion is necessary for
compile testing on other architectures.

This fixes build error when compile testing on i386 architecture:

    drivers/memory/omap-gpmc.c: In function ‘gpmc_cs_remap’:
    drivers/memory/omap-gpmc.c:961:12: error: ‘SZ_16M’ undeclared (first use in this function)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/omap-gpmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 8ec2ef2aebdd..c158b6cae9a9 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -29,6 +29,7 @@
 #include <linux/of_platform.h>
 #include <linux/omap-gpmc.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 
 #include <linux/platform_data/mtd-nand-omap2.h>
 
-- 
2.17.1

