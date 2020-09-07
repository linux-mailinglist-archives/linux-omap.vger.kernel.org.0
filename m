Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6207E26058F
	for <lists+linux-omap@lfdr.de>; Mon,  7 Sep 2020 22:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgIGUVk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Sep 2020 16:21:40 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43564 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729757AbgIGUVi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Sep 2020 16:21:38 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 087KLYuZ016372;
        Mon, 7 Sep 2020 15:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599510094;
        bh=HElTGPfHN8eqJ8L/c6Hjkkfa9XQnaNhJXi0kU+nLVsc=;
        h=From:To:CC:Subject:Date;
        b=ierPQQxr6MlcDKvfJ1SCKLooiKxwZ5bYAW2xVp79KCBZb0wrZ6Tbb1eCzCeJKCH+y
         2Vo7K6WmTUn60s6NCiUz+013HGyltTlQ2LQs4qEsn+Dkh/Y+YGJWUe7hsiEIyrXlbu
         lpYorSvDbpzYkXCbNF0tJHL5La0obNZTDl4nK8X4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 087KLYib049308
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Sep 2020 15:21:34 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Sep
 2020 15:21:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Sep 2020 15:21:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 087KLWog127219;
        Mon, 7 Sep 2020 15:21:33 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH next 0/6] ARM: dts: am57xx/dra7x: switch to new cpsw switch drv
Date:   Mon, 7 Sep 2020 23:21:19 +0300
Message-ID: <20200907202125.22943-1-grygorii.strashko@ti.com>
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

Therefore it's time to switch all am57xx/dra7x boards to use new cpsw switch
driver. Those boards have 1 or 2 Ext. port wired and configured in dual_mac mode
by default. The dual_mac mode has been preserved the same way between
legacy and new driver it's safe to switch drivers.

Grygorii Strashko (6):
  ARM: dts: am5729: beagleboneai: switch to new cpsw switch drv
  ARM: dts: am57xx-idk: switch to new cpsw switch drv
  ARM: dts: beagle-x15: switch to new cpsw switch drv
  ARM: dts: dra7x-evm: switch to new cpsw switch drv
  ARM: dts: am57xx-cl-som-am57x: switch to new cpsw switch drv
  ARM: dts: dra7: drop legacy cpsw dt node

 arch/arm/boot/dts/am571x-idk.dts              | 27 ----------
 arch/arm/boot/dts/am5729-beagleboneai.dts     | 14 +++--
 arch/arm/boot/dts/am572x-idk.dts              |  5 --
 arch/arm/boot/dts/am574x-idk.dts              |  5 --
 .../boot/dts/am57xx-beagle-x15-common.dtsi    | 13 +++--
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts     | 13 +++--
 arch/arm/boot/dts/am57xx-idk-common.dtsi      | 14 +++--
 arch/arm/boot/dts/dra7-evm.dts                | 13 +++--
 arch/arm/boot/dts/dra7-l4.dtsi                | 54 -------------------
 arch/arm/boot/dts/dra7.dtsi                   |  4 +-
 arch/arm/boot/dts/dra71-evm.dts               | 14 ++---
 arch/arm/boot/dts/dra72-evm-common.dtsi       |  4 --
 arch/arm/boot/dts/dra72-evm-revc.dts          | 14 ++---
 arch/arm/boot/dts/dra72-evm.dts               | 13 +++--
 arch/arm/boot/dts/dra76-evm.dts               | 14 +++--
 15 files changed, 67 insertions(+), 154 deletions(-)

-- 
2.17.1

