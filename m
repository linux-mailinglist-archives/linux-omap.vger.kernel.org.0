Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C548387E91
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 19:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240735AbhERRiT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 13:38:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57894 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhERRiS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 May 2021 13:38:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14IHatQo057982;
        Tue, 18 May 2021 12:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621359415;
        bh=d4RK6tIReB4Zgq7lrmfDKec5B5s4/ndZtmEb2D8rVAc=;
        h=From:To:CC:Subject:Date;
        b=sms7oCpL9cG1nzCZeZrGqVREaHlQBmVhWYTqgDyLSSh+APqp4TXYYArbmnmiHzVlW
         TaFH8khYWH0cPtKsWT9vgwWuMY7ihwzjYcoi0f0wMvrJ5jpdXSMZKRSEeh8xS8g979
         bvg+9t7bqt7cO/3QBUWs34B6XTKZLISvXUDut8mI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14IHat9l003982
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 May 2021 12:36:55 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 18
 May 2021 12:36:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 18 May 2021 12:36:55 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14IHatVL119380;
        Tue, 18 May 2021 12:36:55 -0500
Received: from localhost ([10.250.32.40])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 14IHat50013452;
        Tue, 18 May 2021 12:36:55 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Jassi Brar <jaswinder.singh@linaro.org>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/4] Cleanup OMAP Mailbox nodes for YAML binding
Date:   Tue, 18 May 2021 12:36:41 -0500
Message-ID: <20210518173645.12270-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

The following series is minor cleanups in the OMAP Mailbox nodes
on various OMAP2+ SoCs. The changes are to bring the nodes in
compliance with the OMAP Mailbox YAML binding conversion [1]. The
changes can be applied independent of the YAML conversion, and
all the dtbs_check warnings around Mailbox nodes should be gone
once all the dts patches and binding conversion are merged.

regards
Suman

[1] http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210518172022.10562-1-s-anna@ti.com/

Suman Anna (4):
  ARM: dts: OMAP2420: Drop interrupt-names from mailbox node
  ARM: dts: OMAP2/OMAP3: Rename processor sub-mailbox nodes
  ARM: dts: AM33xx/AM43xx: Rename wkup_m3 sub-mailbox node
  ARM: dts: OMAP2+: Replace underscores in sub-mailbox node names

 arch/arm/boot/dts/am33xx-l4.dtsi            | 2 +-
 arch/arm/boot/dts/am437x-l4.dtsi            | 2 +-
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts   | 8 ++++----
 arch/arm/boot/dts/dm816x.dtsi               | 2 +-
 arch/arm/boot/dts/dra7-ipu-dsp-common.dtsi  | 6 +++---
 arch/arm/boot/dts/dra72x.dtsi               | 6 +++---
 arch/arm/boot/dts/dra74-ipu-dsp-common.dtsi | 2 +-
 arch/arm/boot/dts/dra74x.dtsi               | 8 ++++----
 arch/arm/boot/dts/omap2420.dtsi             | 5 ++---
 arch/arm/boot/dts/omap2430.dtsi             | 2 +-
 arch/arm/boot/dts/omap3.dtsi                | 2 +-
 arch/arm/boot/dts/omap4-l4.dtsi             | 4 ++--
 arch/arm/boot/dts/omap5-l4.dtsi             | 4 ++--
 13 files changed, 26 insertions(+), 27 deletions(-)

-- 
2.30.1

