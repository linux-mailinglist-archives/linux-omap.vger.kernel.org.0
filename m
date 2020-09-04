Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C39925E001
	for <lists+linux-omap@lfdr.de>; Fri,  4 Sep 2020 18:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgIDQno (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Sep 2020 12:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbgIDQnn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Sep 2020 12:43:43 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D3362064E;
        Fri,  4 Sep 2020 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599237823;
        bh=nxciuoD47KxGkOpJC1/Yb+VqPBHDhps24SnDZPx4IXk=;
        h=From:To:Cc:Subject:Date:From;
        b=vV07QlSQWiamQPiw7TcgBV0AVn8g3VLYp4Y0YEpQajmWoDymFi6NXno5wrMIrWqbk
         IYPI85Ll5xGRHSi6KObRaeEGTM/DoL18I/V+Yzx29NgruQPi31ggY144MQCLaytdIg
         uZHZpn9PJ/8lwmzuvIfusuOcx36eP0X6eMPZ8fYk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Manuel Lauss <manuel.lauss@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Prabu Thangamuthu <prabu.t@synopsys.com>,
        Manjunath M B <manjumb@synopsys.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@axis.com
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v2 1/2] mmc: host: Drop unneeded MMC dependency in Kconfig
Date:   Fri,  4 Sep 2020 18:43:14 +0200
Message-Id: <20200904164315.24618-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

All entries in Kconfig are already part of "if MMC", so there is no need
for additional dependency on MMC.

Suggested-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/mmc/host/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index b95f79f53395..eea01fde0591 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -422,7 +422,7 @@ config MMC_SDHCI_IPROC
 
 config MMC_MESON_GX
 	tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
-	depends on ARCH_MESON && MMC
+	depends on ARCH_MESON
 	help
 	  This selects support for the Amlogic SD/MMC Host Controller
 	  found on the S905/GX*/AXG family of SoCs.  This controller is
@@ -458,7 +458,7 @@ config MMC_MESON_MX_SDIO
 
 config MMC_MOXART
 	tristate "MOXART SD/MMC Host Controller support"
-	depends on ARCH_MOXART && MMC
+	depends on ARCH_MOXART
 	help
 	  This selects support for the MOXART SD/MMC Host Controller.
 	  MOXA provides one multi-functional card reader which can
-- 
2.17.1

