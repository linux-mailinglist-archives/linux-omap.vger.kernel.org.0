Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6842C3DAF68
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233855AbhG2Wqk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35856 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbhG2Wqj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkL6e128780;
        Thu, 29 Jul 2021 17:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598781;
        bh=4dtShpLKI+Afxi+AEYrCfFFpkX3U+9kF5fpsVZdjeU4=;
        h=From:To:CC:Subject:Date;
        b=NVt9mwkzHakOGBjQM5Xg/csWcitdC0/ZA9Fog2eob9Z/XzpzbHPSxg7V5ryCThLOl
         bQaN91CL5hqU1jdqsNfHWg8lgOBUIQ05L1ubxivfsvSmLmyZss7t/Oc5VIbinWl3ro
         1bd17vUjrznf14tB8ufBIatAi92eQ/mZxdTZlBQE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkLlQ010646
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:21 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkL8c076769;
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkLc7016249;
        Thu, 29 Jul 2021 17:46:21 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 00/11] Add PRU-ICSS nodes on AM335x, AM437x & AM57xx SoCs
Date:   Thu, 29 Jul 2021 17:46:10 -0500
Message-ID: <20210729224621.2295-1-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following series adds the DT nodes for the Programmable Real-Time
Unit and Industrial Communication Subsystems (PRU-ICSS or simply PRUSS)
present on certain AM335x, AM437x and all AM57xx SoCs. For details, please
refer to the respective Technical Reference Manuals [1][2][3] or the cover
letter from the first foundation PRUSS platform driver [4]. The next-gen
ICSSG nodes were already mainlined for K3 AM65x and J721E SoCs.

The sub-system is represented through multiple platform device nodes
which are supported through a corresponding platform driver, like the
PRUSS platform driver, PRUSS irqchip driver and a PRU remoteproc driver
(upstreamed in 5.10, 5.11 kernels). This series adds the foundation PRUSS
nodes, that can in turn be referenced and used by PRU client/application
drivers. The client bindings and driver changes were posted previously
and need a refresh [5][6], but won't affect these nodes.

The PRU-ICSS is not supported on every device in the AM335x and AM437x
SoC family. It is only supported on AM3356+ and AM4376+ SoCs. All AM57xx
SoCs (but not DRA7xx SoCs) support PRU-ICSS. I have taken slightly different
approaches in the patches for each of the SoC families:
 - AM57xx PRU-ICSS target modules are already cleanly separated in
   am57-pruss.dtsi, so the nodes are directly added in enabled state.
 - AM437x PRUSS nodes are directly added and enabled in the am4372.dtsi,
   as all the existing AM437x board dts files use AM4376+ SoCs.
 - AM335x PRUSS nodes are also added in the common am33xx-l4.dtsi file,
   and the parent ti-sysc target-module is enabled only in the required
   board dts files. There are about 35 different AM335x board dts files,
   with many of them using AM3352. I couldn't identify exactly what SoC
   version is being used for some of them, so the PRU-ICSS nodes are
   enabled only on known TI boards.
 - MDIO nodes are currently disabled, they will be enabled after the PRU
   Ethernet driver is upstreamed.

Patches are on top of 5.14-rc3 (should apply cleanly on 5.14-rc1 as
well), as I had to use that version due to some Ethernet issues for NFS.

Let me know if you prefer the AM57 style of a separate dtsi file for
PRUSS, and I can repost these quickly.

regards
Suman

[1] AM335x TRM Rev.Q: https://www.ti.com/lit/pdf/spruh73
[2] AM437x TRM Rev.I: https://www.ti.com/lit/pdf/spruhl7
[3] AM571x TRM Rev.I: https://www.ti.com/lit/pdf/spruhz7
[4] https://patchwork.kernel.org/project/linux-arm-kernel/cover/1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org/
[5] https://patchwork.kernel.org/project/linux-remoteproc/cover/20201216165239.2744-1-grzegorz.jaszczyk@linaro.org/
[6] https://patchwork.kernel.org/project/linux-remoteproc/cover/20201211184811.6490-1-grzegorz.jaszczyk@linaro.org/

Andrew F. Davis (1):
  ARM: dts: am4372: Add PRUSS MDIO controller node

Suman Anna (10):
  ARM: dts: am33xx-l4: Add PRUSS node
  ARM: dts: am33xx-l4: Add PRUSS MDIO controller node
  ARM: dts: am335x-bone-common: Enable PRU-ICSS node
  ARM: dts: am335x-evm: Enable PRU-ICSS module
  ARM: dts: am335x-evmsk: Enable PRU-ICSS module
  ARM: dts: am335x-icev2: Enable PRU-ICSS module
  ARM: dts: am4372: Add the PRU-ICSS1 DT node
  ARM: dts: am4372: Add the PRU-ICSS0 DT node
  ARM: dts: am57xx: Add PRU-ICSS nodes
  ARM: dts: am57xx: Add PRUSS MDIO controller nodes

 arch/arm/boot/dts/am335x-bone-common.dtsi     |   4 +
 arch/arm/boot/dts/am335x-evm.dts              |   4 +
 arch/arm/boot/dts/am335x-evmsk.dts            |   4 +
 arch/arm/boot/dts/am335x-icev2.dts            |   4 +
 arch/arm/boot/dts/am33xx-l4.dtsi              |  82 ++++++++
 arch/arm/boot/dts/am4372.dtsi                 | 165 ++++++++++++++++
 arch/arm/boot/dts/am437x-cm-t43.dts           |   4 +
 arch/arm/boot/dts/am437x-gp-evm.dts           |   4 +
 arch/arm/boot/dts/am437x-idk-evm.dts          |   4 +
 arch/arm/boot/dts/am437x-sk-evm.dts           |   4 +
 arch/arm/boot/dts/am43x-epos-evm.dts          |   4 +
 arch/arm/boot/dts/am57-pruss.dtsi             | 178 +++++++++++++++++-
 arch/arm/boot/dts/am571x-idk.dts              |   8 +
 arch/arm/boot/dts/am572x-idk.dts              |   8 +
 arch/arm/boot/dts/am574x-idk.dts              |   8 +
 .../boot/dts/am57xx-beagle-x15-common.dtsi    |   8 +
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts     |   8 +
 17 files changed, 500 insertions(+), 1 deletion(-)

-- 
2.32.0

