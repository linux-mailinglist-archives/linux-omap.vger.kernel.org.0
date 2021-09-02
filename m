Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795153FEB9E
	for <lists+linux-omap@lfdr.de>; Thu,  2 Sep 2021 11:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245263AbhIBJ5S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Sep 2021 05:57:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:39048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233157AbhIBJ5N (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Sep 2021 05:57:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5860560525;
        Thu,  2 Sep 2021 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630576575;
        bh=Z8WT93iMfPtGcY/7MRMgThZsMD/TOvlbUhTRN5F/47Y=;
        h=From:To:Cc:Subject:Date:From;
        b=D6nx9d14dorAF1Ocl3z8akTPeHaEQj9JyJyHjd9S/r+qHN9FTXH1BN/vtD36JZeI0
         RZW205UVgX/RcfOP61931s611dmJvy7ZnMW2myA1huTvzn8OpBgccKzmYSJmFTz8Bz
         m9nsuiO37oxEwPtJQDgkjT/a2vH0kn10YESL0mpb8ZU71hYh2nMSfquedxVoeRfABN
         KzJZhU97h/NVsQETN9PCnXXeYmVC0m5GdXar40mD48jHUTcSncHj76TnohKmcYHQMy
         v/EKrAeYqgDczAIHcHJ6OOE5XcSVgSGk21Ovsd/v5v+icPrHW9zyeh3lxQ9R831SUs
         XTM355k1NuIYQ==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 0/6] dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
Date:   Thu,  2 Sep 2021 12:56:03 +0300
Message-Id: <20210902095609.16583-1-rogerq@kernel.org>
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
v2:
- Fix all errors in dtbs_check and dt_bindings_check
- remove references to gpmc-omap.txt
- Convert ti,gpmc-nand and ti,gpmc-onenand bindings to yaml as well

Roger Quadros (6):
  ARM: dts: omap: Fixup GPMC child nodes
  dt-bindings: memory-controllers: ti,gpmc: Convert to yaml
  dt-bindings: mtd: ti,gpmc-nand: Convert to yaml
  dt-bindings: mtd: ti,gpmc-onenand: Convert to yaml
  dt-bindings: mtd: Remove gpmc-nor.txt
  dt-bindings: net: Remove gpmc-eth.txt

 .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
 .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
 .../devicetree/bindings/mtd/gpmc-nand.txt     | 147 -------
 .../devicetree/bindings/mtd/gpmc-nor.txt      |  98 -----
 .../devicetree/bindings/mtd/gpmc-onenand.txt  |  48 ---
 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml | 109 ++++++
 .../bindings/mtd/ti,gpmc-onenand.yaml         |  71 ++++
 .../devicetree/bindings/net/gpmc-eth.txt      |  97 -----
 .../boot/dts/logicpd-som-lv-baseboard.dtsi    |   2 +-
 .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |   2 +-
 .../boot/dts/logicpd-torpedo-baseboard.dtsi   |   2 +-
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     |  62 ++-
 arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     |  59 ++-
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
 29 files changed, 649 insertions(+), 659 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nand.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-nor.txt
 delete mode 100644 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt

-- 
2.17.1

