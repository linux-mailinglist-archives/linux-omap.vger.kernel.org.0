Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB12A397046
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 11:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhFAJ0v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 05:26:51 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:37062 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbhFAJ0u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 05:26:50 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1519P3gh025130;
        Tue, 1 Jun 2021 04:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622539503;
        bh=MRiF11JR/KPRkdzSL7LPNKNksx6PVnbFb+o1osdPTQQ=;
        h=From:To:CC:Subject:Date;
        b=wvdnndVsodZlW0lyLBhMhRhU5CpZYTWxaRsJqrAa8PrMc4hUC9l0mSqshy8ch7JtO
         4GzxPClxyFh4Xv4+La8bFiX9k49HFVhmg+NXpxjaLceZAX9H4KpLY1ugZ2+kmbVeiW
         SON4G+NKs5w/XkoDAD9KphxSLSoRiJegv9MZv7JU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1519P23N090432
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 04:25:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 04:25:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 04:25:02 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1519Owrt127212;
        Tue, 1 Jun 2021 04:24:59 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 0/3] ARM: dts: ti: Fix DT warnings for ecap nodes
Date:   Tue, 1 Jun 2021 14:54:54 +0530
Message-ID: <20210601092457.5039-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix DT warnings for all the ecap nodes on TI platforms. This is in
preparation for converting pwm-tiecap documentation to YAML.

Lokesh Vutla (3):
  ARM: dts: ti: Drop usage of ti,am33xx-ecap from DT nodes
  ARM: dts: ti: Fix node name for all ecap dt nodes
  ARM: dts: am33xx: Drop interrupt property from ecap nodes

 arch/arm/boot/dts/am335x-cm-t335.dts |  2 +-
 arch/arm/boot/dts/am335x-evm.dts     |  2 +-
 arch/arm/boot/dts/am335x-evmsk.dts   |  2 +-
 arch/arm/boot/dts/am33xx-l4.dtsi     | 21 ++++++---------------
 arch/arm/boot/dts/am437x-l4.dtsi     | 15 ++++++---------
 arch/arm/boot/dts/da850.dtsi         | 15 ++++++---------
 arch/arm/boot/dts/dra7-l4.dtsi       |  6 +++---
 7 files changed, 24 insertions(+), 39 deletions(-)

-- 
2.31.1

