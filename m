Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6BF740AD8D
	for <lists+linux-omap@lfdr.de>; Tue, 14 Sep 2021 14:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhINM2a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Sep 2021 08:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:46720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232812AbhINM22 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Sep 2021 08:28:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CE2560F92;
        Tue, 14 Sep 2021 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631622431;
        bh=3MW75SNryOfQxZCpvZDbF5g/YNXNSo6pjaNk3Uj8TZM=;
        h=From:To:Cc:Subject:Date:From;
        b=m/GC6/fpHAzTqnRWpOG5YN7GJxQ4QrtqsYu/qs3kCJc4M392bHpMjo4ZfJYlXAtzp
         bhRNS7w+BBQg0ojOICjv3zdsC6T5r9irOsm65Gsf8J24/7vwcsOaKbr8rxFGU0w2rA
         vouWmy2N1cnnln2PtW67EMy8XoIvJE/FH3O62bTytMyjhWx+mKOZTSo8Md4I2URkTp
         YXU+BwlSdzkyln4DkC3+bK3R7tpEzJPZ3hOigu0gMPLkzQPAePOxQivzurxm4/ZecI
         E7ZfMnEXkZcK2tpGGLMCutrCTysKaPh2NkRDkUaB08OuyjgYB+9Z4vL4wZAmeOhWq8
         Eqv+gzsxL09Sg==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
Date:   Tue, 14 Sep 2021 15:26:57 +0300
Message-Id: <20210914122705.15421-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

This series converts ti,gpmc memory controller and ti,gpmc-nand and
ti,gpmc-onenand MTD controller bindings to yaml.

cheers,
-roger

Changelog:
v4
- reference partition.yaml in ti,gpmc-nand.yaml and ti,gpmc-onenenc.yaml
- use address-cells/size-cells: true instead of absolute size.

v3:
- fix indentation
- split GPMC child timings/settings into ti,gpmc-child.yaml
This allows us to refer to it at 3 places and avoid use of
'additionalProperties: true' at 2 places.
- specify defaults where applicable
- reordered patches
- added patch for making "gpmc,device-width" optional with defaults.
- address all review comments.

v2:
- Fix all errors in dtbs_check and dt_bindings_check
- remove references to gpmc-omap.txt
- Convert ti,gpmc-nand and ti,gpmc-onenand bindings to yaml as well

Roger Quadros (8):
  ARM: dts: omap: Fixup GPMC child nodes
  dt-bindings: mtd: Remove gpmc-nor.txt
  dt-bindings: net: Remove gpmc-eth.txt
  dt-bindings: memory-controllers: Introduce ti,gpmc-child
  dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
  dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
  dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
  memory: gpmc-omap: "gpmc,device-width" DT property is optional

 .../bindings/memory-controllers/omap-gpmc.txt | 157 -----------
 .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
 .../bindings/memory-controllers/ti,gpmc.yaml  | 172 ++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 -----------
 .../devicetree/bindings/mtd/gpmc-nor.txt      |  98 -------
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |  48 ----
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 121 +++++++++
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  81 ++++++
 .../devicetree/bindings/net/gpmc-eth.txt      |  97 -------
 .../boot/dts/logicpd-som-lv-baseboard.dtsi    |   2 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |   2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |   2 +-
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     |  62 +++--
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     |  59 ++---
 arch/arm/boot/dts/omap-zoom-common.dtsi       |  16 +-
 arch/arm/boot/dts/omap2430-sdp.dts            |   6 +-
 arch/arm/boot/dts/omap3-cm-t3x30.dtsi         |   6 +-
 .../arm/boot/dts/omap3-devkit8000-common.dtsi |   4 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts          |   1 +
 arch/arm/boot/dts/omap3-evm-common.dtsi       |   9 -
 .../boot/dts/omap3-evm-processor-common.dtsi  |   5 +-
 arch/arm/boot/dts/omap3-evm.dts               |   1 +
 arch/arm/boot/dts/omap3-igep0020-common.dtsi  |   5 +-
 arch/arm/boot/dts/omap3-ldp.dts               |   5 +-
 arch/arm/boot/dts/omap3-n900.dts              |   2 +-
 .../dts/omap3-overo-chestnut43-common.dtsi    |   6 +-
 .../arm/boot/dts/omap3-overo-tobi-common.dtsi |   6 +-
 .../boot/dts/omap3-overo-tobiduo-common.dtsi  |   8 +-
 arch/arm/boot/dts/omap3-sb-t35.dtsi           |   4 +-
 arch/arm/boot/dts/omap4-duovero-parlor.dts    |   6 +-
 drivers/memory/omap-gpmc.c                    |  41 +--
 31 files changed, 750 insertions(+), 674 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt

-- 
2.17.1

