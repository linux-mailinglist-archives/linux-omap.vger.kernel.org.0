Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB7344027CA
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 13:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243381AbhIGLdk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 07:33:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242785AbhIGLdi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Sep 2021 07:33:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C09AD6109F;
        Tue,  7 Sep 2021 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631014352;
        bh=8UMQ97vyI3ophSye3dLSGxheasRTdFGrQH/XhCLQ7Ew=;
        h=From:To:Cc:Subject:Date:From;
        b=Fv6sKsziXoufVFVqeUEuQ/cPd5N953M7hvg2B8vo+AcIqdBXfen6okuSz3UjfVEfw
         +DEi76nJ7QIEOsCEkYgwYhKbB9wuKG5EsVxBSlTS8+A8J8bHd9oV9oo4lyQlmVOjXB
         KS8dKlLJlfkhHJRyujvmyfAcOriwa5sn9bdGlYUE0fPgYg8DblkAQI4J/3Xw3Rr2rE
         /dZp1KmtYPGG+klDKq3+uUL0x1Gtm9V2L8RZFON59XBZuGlBNXQ33ZxYGVThpe+a6Z
         UCsAwiuc1mbIWHVqhko1/3ee04A9H5bvf1jejGkjpFQFntOCqB1wp8KUQpdCaJSUZ+
         kSEIRmBDH5HEQ==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
Date:   Tue,  7 Sep 2021 14:32:18 +0300
Message-Id: <20210907113226.31876-1-rogerq@kernel.org>
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
 .../bindings/memory-controllers/ti,gpmc.yaml  | 174 +++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 -----------
 .../devicetree/bindings/mtd/gpmc-nor.txt      |  98 -------
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |  48 ----
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 110 ++++++++
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  69 +++++
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
 31 files changed, 729 insertions(+), 674 deletions(-)
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

