Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D856222BFE7
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGXHnN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:43:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgGXHnM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:12 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0120A20771;
        Fri, 24 Jul 2020 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576592;
        bh=7O0bm2CLZ3Q5OFx8KqB2VK0KoKe3zQms78gh6gShMCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eq5SIgQy1QpEy6J7NJ8OQP7Oe76XZjRwGoMXnCBZa+SzQzLVWCEQKqhi/DARA16rd
         b9fJxjbOMZxQtZJ0tgD4kFgWVH5zBFd/LYE3Y+JK9MpC1BXF1gvi3Apzvkm7I/gdfE
         JD7lLQRMFB4B55KQLldXAv/CQgh+pjPMjOvf6aIA=
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
Subject: [PATCH v2 25/29] MAINTAINERS: Add Krzysztof Kozlowski as maintainer of memory controllers
Date:   Fri, 24 Jul 2020 09:40:34 +0200
Message-Id: <20200724074038.5597-26-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The generic parts of memory controllers (of_memory.[ch]) lacked any
care.  The memory controller drivers were not abandoned (usually
picked up by architecture maintainers) but in such case I can take care
about them as well.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4557bc43bd5..cba0ed77775b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11158,6 +11158,13 @@ F:	Documentation/core-api/boot-time-mm.rst
 F:	include/linux/memblock.h
 F:	mm/memblock.c
 
+MEMORY CONTROLLER DRIVERS
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/memory-controllers/
+F:	drivers/memory/
+
 MEMORY FREQUENCY SCALING DRIVERS FOR NVIDIA TEGRA
 M:	Dmitry Osipenko <digetx@gmail.com>
 L:	linux-pm@vger.kernel.org
-- 
2.17.1

