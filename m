Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F3522BFE1
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgGXHnD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:43:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726607AbgGXHnD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:43:03 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 767E32076A;
        Fri, 24 Jul 2020 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576582;
        bh=+gFjDJ7e8jqodH9leHcZ6qQN7ZQWC5AX9izX5256A2o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uunsCN4IQjA9/JhkgbHmhzNyifJQlaud+n1NnuJK+nsthFK5hUNJ5N7DiMGCXlftH
         jH+0M9mBlHTyJu+8JSmmzGneCH0Rg/LBsM8J1w01dYI3aGwEPvoFuh0EjFti+74Vku
         DdahPIfnq1JGHrzfZeJ/rCeKbsy8Yeu4LP9MoSlY=
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
Subject: [PATCH v2 23/29] memory: pl172: Add GPLv2 SPDX license header
Date:   Fri, 24 Jul 2020 09:40:32 +0200
Message-Id: <20200724074038.5597-24-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add GPLv2 license header and remove GPL boiler plate text.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/pl172.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
index ff57195b4e37..084891eb29cc 100644
--- a/drivers/memory/pl172.c
+++ b/drivers/memory/pl172.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Memory controller driver for ARM PrimeCell PL172
  * PrimeCell MultiPort Memory Controller (PL172)
@@ -6,10 +7,6 @@
  *
  * Based on:
  * TI AEMIF driver, Copyright (C) 2010 - 2013 Texas Instruments Inc.
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/amba/bus.h>
-- 
2.17.1

