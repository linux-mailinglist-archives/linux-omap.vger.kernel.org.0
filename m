Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB79775654
	for <lists+linux-omap@lfdr.de>; Wed,  9 Aug 2023 11:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjHIJ1f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Aug 2023 05:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjHIJ1e (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Aug 2023 05:27:34 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D1E1A19BC;
        Wed,  9 Aug 2023 02:27:33 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B7E9B816A;
        Wed,  9 Aug 2023 09:27:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] bus: ti-sysc: Build driver for TI K3 SoCs
Date:   Wed,  9 Aug 2023 12:27:21 +0300
Message-ID: <20230809092722.11000-2-tony@atomide.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809092722.11000-1-tony@atomide.com>
References: <20230809092722.11000-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Allow building ti-sysc also for K3 SoCs. This allows configuring the wkup
domain devices for SYSCONFIG register wake-up events in a generic way.

As this is an interconnect level driver, default to built-in on K3 SoCs
to probe the devices connected to the wkup domain like gpio, uart and
timers.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -210,7 +210,8 @@ config  TI_PWMSS
 
 config TI_SYSC
 	bool "TI sysc interconnect target module driver"
-	depends on ARCH_OMAP2PLUS
+	depends on ARCH_OMAP2PLUS || ARCH_K3
+	default y
 	help
 	  Generic driver for Texas Instruments interconnect target module
 	  found on many TI SoCs.
-- 
2.41.0
