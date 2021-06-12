Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646823A4BE5
	for <lists+linux-omap@lfdr.de>; Sat, 12 Jun 2021 03:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFLBQu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 21:16:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60644 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhFLBQu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Jun 2021 21:16:50 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15C1Emqs093591;
        Fri, 11 Jun 2021 20:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1623460488;
        bh=YhfzaOgplXxGDdxcfrU93rDby0wlyVyx6fZXeEstpsM=;
        h=From:To:CC:Subject:Date;
        b=rmLDNcHcSyZy8O0dS4D8rkqfOQjYJ075Jmc2ln0ycLca5i1ODn8LNTf2rcY/YFvwQ
         aihLH3yAGMETHoRvrLuen2hGG75Gc4q1ia4SqEe6xPagxJIcWS0Q3mywtHZPULI6wN
         x5zxNGRo4L0+APOjTKzi68qt3jX+d77uT5zQ8k8s=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15C1EmNP056785
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Jun 2021 20:14:48 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 20:14:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 20:14:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15C1Ek8H100010;
        Fri, 11 Jun 2021 20:14:47 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Lokesh Vutla <lokeshvutla@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 00/15] ARM: dts: am335x: switch rest boards to new cpsw switch drv
Date:   Sat, 12 Jun 2021 04:14:21 +0300
Message-ID: <20210612011436.10437-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

This series converts rest of am335x boards to use new CPSW switchdev driver.
Only build tested.

After this only dm814x.dtsi related part left.

Grygorii Strashko (15):
  ARM: dts: am335x-baltos: switch to new cpsw switch drv
  ARM: dts: am335x-nano: switch to new cpsw switch drv
  ARM: dts: am335x-chiliboard: switch to new cpsw switch drv
  ARM: dts: am335x-cm-t335: switch to new cpsw switch drv
  ARM: dts: am335x-igep0033: switch to new cpsw switch drv
  ARM: dts: am335x-lxm: switch to new cpsw switch drv
  ARM: dts: am335x-moxa-uc: switch to new cpsw switch drv
  ARM: dts: am335x-myirtech: switch to new cpsw switch drv
  ARM: dts: am335x-osd3358-sm-red: switch to new cpsw switch drv
  ARM: dts: am335x-pdu001: switch to new cpsw switch drv
  ARM: dts: am335x-pepper: switch to new cpsw switch drv
  ARM: dts: am335x-phycore: switch to new cpsw switch drv
  ARM: dts: am335x-shc: switch to new cpsw switch drv
  ARM: dts: am335x-sl50: switch to new cpsw switch drv
  ARM: dts: am33xx: update ethernet aliases

 arch/arm/boot/dts/am335x-baltos-ir2110.dts    | 10 ++---
 arch/arm/boot/dts/am335x-baltos-ir3220.dts    |  8 ++--
 arch/arm/boot/dts/am335x-baltos-ir5221.dts    |  8 ++--
 arch/arm/boot/dts/am335x-baltos.dtsi          |  5 +--
 arch/arm/boot/dts/am335x-chiliboard.dts       | 13 ++++---
 arch/arm/boot/dts/am335x-cm-t335.dts          | 13 ++++---
 arch/arm/boot/dts/am335x-igep0033.dtsi        | 12 +++---
 arch/arm/boot/dts/am335x-lxm.dts              | 14 +++----
 .../boot/dts/am335x-moxa-uc-2100-common.dtsi  | 12 +++---
 arch/arm/boot/dts/am335x-moxa-uc-2101.dts     |  7 ++--
 .../boot/dts/am335x-moxa-uc-8100-common.dtsi  | 16 +++-----
 arch/arm/boot/dts/am335x-myirtech-myc.dtsi    | 25 ++++++------
 arch/arm/boot/dts/am335x-myirtech-myd.dts     | 18 +++++----
 arch/arm/boot/dts/am335x-nano.dts             | 13 +++----
 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts  | 10 ++---
 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts  | 10 ++---
 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts  | 10 ++---
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts   | 13 ++++---
 arch/arm/boot/dts/am335x-pcm-953.dtsi         | 10 ++---
 arch/arm/boot/dts/am335x-pdu001.dts           | 14 +++----
 arch/arm/boot/dts/am335x-pepper.dts           | 14 +++----
 arch/arm/boot/dts/am335x-phycore-som.dtsi     | 14 ++++---
 arch/arm/boot/dts/am335x-regor.dtsi           | 11 +++---
 arch/arm/boot/dts/am335x-shc.dts              | 38 ++++++++++---------
 arch/arm/boot/dts/am335x-sl50.dts             | 12 ++++--
 arch/arm/boot/dts/am335x-wega.dtsi            | 11 +++---
 arch/arm/boot/dts/am33xx.dtsi                 |  4 +-
 27 files changed, 176 insertions(+), 169 deletions(-)

-- 
2.17.1

