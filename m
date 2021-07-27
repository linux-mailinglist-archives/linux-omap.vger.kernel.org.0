Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB3C3D72A1
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbhG0KKl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:10:41 -0400
Received: from muru.com ([72.249.23.125]:55756 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236046AbhG0KKk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:10:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9B01C80F0;
        Tue, 27 Jul 2021 10:10:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 1/2] memory: omap-gpmc: Clear GPMC_CS_CONFIG7 register on restore if unused
Date:   Tue, 27 Jul 2021 13:10:33 +0300
Message-Id: <20210727101034.32148-1-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We want to clear any unused GPMC_CS_CONFIG7 register on restore to
ensure unused chip selects are not enabled.

Cc: Roger Quadros <rogerq@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/memory/omap-gpmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2595,6 +2595,8 @@ void omap3_gpmc_restore_context(void)
 				gpmc_context.cs_context[i].config6);
 			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7,
 				gpmc_context.cs_context[i].config7);
+		} else {
+			gpmc_cs_write_reg(i, GPMC_CS_CONFIG7, 0);
 		}
 	}
 }
-- 
2.32.0
