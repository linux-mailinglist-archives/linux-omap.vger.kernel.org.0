Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 707D5265506
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 00:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgIJWZa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 18:25:30 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44922 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgIJWZY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 18:25:24 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPM42060940;
        Thu, 10 Sep 2020 17:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599776722;
        bh=GjMJP+nWCUtiQwNsarcqurRBqCFISUNVgzR2BTmparY=;
        h=From:To:CC:Subject:Date;
        b=IqNkIFEthL0IfyZLPBfiWjVk3noTN8dOBz4vOf4EVmRDjS7RKj1BPt+lFW3LHuuPD
         MrYTUQaUtex7tAzR3YPAt1k3umLAwYmpFh5v7qYTKOzU7O09Uem2SMowcrnX995TyI
         DMXOnCr1F/BwCmwBejz5gBsXkloddyZ0BaP9/b8k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPMtU101574;
        Thu, 10 Sep 2020 17:25:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Sep 2020 17:25:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Sep 2020 17:25:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08AMPLao017613;
        Thu, 10 Sep 2020 17:25:21 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 0/3] ARM: dts: am437x: switch to new cpsw switch drv
Date:   Fri, 11 Sep 2020 01:25:15 +0300
Message-ID: <20200910222518.32486-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Since Kernel v5.5 commits:
 111cf1ab4da3 ("net: ethernet: ti: introduce cpsw switchdev based driver part 2 - switch")
 ed3525eda4c4 ("net: ethernet: ti: introduce cpsw switchdev based driver part 1 - dual-emac")
the new CPSW driver with switchdev support has been introduced and one
am571x-idk board was converted to use it. And since that time (Nov 2019) no
significant issues were reported for the new CPSW driver.

Therefore it's time to switch all am437x boards to use new cpsw switch
driver. Those boards have 1 or 2 Ext. ports wired and configured in dual_mac mode
by default. The dual_mac mode has been preserved the same way between
legacy and new driver, and one port devices works the same as 1 dual_mac port,
so it's safe to switch drivers.

Grygorii Strashko (3):
  ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver
  ARM: dts: am437x: switch to new cpsw switch drv
  ARM: dts: am437x-l4: drop legacy cpsw dt node

 arch/arm/boot/dts/am4372.dtsi        |  4 +-
 arch/arm/boot/dts/am437x-cm-t43.dts  | 14 +++--
 arch/arm/boot/dts/am437x-gp-evm.dts  | 13 +++--
 arch/arm/boot/dts/am437x-idk-evm.dts | 13 +++--
 arch/arm/boot/dts/am437x-l4.dtsi     | 77 +++++++++++++++-------------
 arch/arm/boot/dts/am437x-sk-evm.dts  | 14 +++--
 arch/arm/boot/dts/am43x-epos-evm.dts | 13 +++--
 7 files changed, 78 insertions(+), 70 deletions(-)

-- 
2.17.1

