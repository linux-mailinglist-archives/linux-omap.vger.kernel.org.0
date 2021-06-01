Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FA1390831
	for <lists+linux-omap@lfdr.de>; Tue, 25 May 2021 19:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbhEYSAd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 May 2021 14:00:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52198 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbhEYSAd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 May 2021 14:00:33 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14PHx0bE009766;
        Tue, 25 May 2021 12:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621965540;
        bh=UbudXC1wkF/+ybCjaZx0WguGjl2/QS7ge0kYEPdYsgI=;
        h=From:To:CC:Subject:Date;
        b=XA2bGlTE112/6TX15v249Z59MVgMOufVmVnaVTWDXhfocE2gFmS80+B2zcQjTwttL
         +ZcbAFAZuXj0bxfcqkpU+pvoQdp01HT+TkDO9tdgHyRYL+GdzC+1fYLsWnuqNzf8zw
         wNBj0E74SCRae7u3hyA+nffvK0EmHYfqn65r6qH8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14PHx0GN119885
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 May 2021 12:59:00 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 25
 May 2021 12:58:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 25 May 2021 12:58:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14PHwwIJ014044;
        Tue, 25 May 2021 12:58:59 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH v2 0/5] dt-bindings: gpio: omap: Convert to json-schema
Date:   Tue, 25 May 2021 20:58:53 +0300
Message-ID: <20210525175858.11611-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

Convert the OMAP GPIO Device Tree binding documentation to json-schema.
The GPIO hogs node names defined to end with a 'hog' suffix.

All existing GPIO Hogs fixed to follow above naming convention
before changing the binding to avoid dtbs_check warnings.

Changes in v2:
- Patch 5 fixed "wrong indentation" warning

v1: https://lore.kernel.org/patchwork/cover/1434566/

Grygorii Strashko (5):
  ARM: dts: am335x: align GPIO hog names with dt-schema
  ARM: dts: am437x: align gpio hog names with dt-schema
  ARM: dts: omap3: align gpio hog names with dt-schema
  ARM: dts: omap5-board-common: align gpio hog names with dt-schema
  dt-bindings: gpio: omap: Convert to json-schema

 .../devicetree/bindings/gpio/gpio-omap.txt    |  45 --------
 .../bindings/gpio/ti,omap-gpio.yaml           | 108 ++++++++++++++++++
 .../boot/dts/am335x-boneblack-wireless.dts    |   2 +-
 arch/arm/boot/dts/am335x-boneblue.dts         |   2 +-
 .../boot/dts/am335x-bonegreen-wireless.dts    |   4 +-
 arch/arm/boot/dts/am335x-icev2.dts            |   4 +-
 arch/arm/boot/dts/am335x-shc.dts              |   8 +-
 arch/arm/boot/dts/am437x-gp-evm.dts           |   4 +-
 arch/arm/boot/dts/am43x-epos-evm.dts          |   2 +-
 .../boot/dts/omap3-evm-processor-common.dtsi  |   2 +-
 arch/arm/boot/dts/omap3-gta04a5.dts           |   2 +-
 arch/arm/boot/dts/omap5-board-common.dtsi     |   2 +-
 12 files changed, 124 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-omap.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml

-- 
2.17.1

