Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06DCAFBB6E
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 23:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfKMWOq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 17:14:46 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:59568 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfKMWOq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 17:14:46 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADMEdtf086224;
        Wed, 13 Nov 2019 16:14:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573683279;
        bh=F7C6z/Ay4PbGGHIUjCn9GaFgwqYcgZAwqEO2wGcirTg=;
        h=From:To:CC:Subject:Date;
        b=naljS+iCB+2txyprnGihXYXBPrVJWbSNTq0m0VZwq+9SlwYtf8LUTYqr9wMOxdCWI
         lhy3IYrH2DEsQn3zkYKl9jcMmlm9ZNQXnBQ4a8Fb9rT0elrb9sweaTHevz6JXdZA0H
         QdXAimEtLkwH3pJ7XLPhxaM/oMqqtZFgMYWjRbYo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADMEd8A119995
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 13 Nov 2019 16:14:39 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 16:14:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 16:14:21 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADMEcdj070963;
        Wed, 13 Nov 2019 16:14:38 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [128.247.59.95])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xADMEcu04361;
        Wed, 13 Nov 2019 16:14:38 -0600 (CST)
From:   Caleb Robey <c-robey@ti.com>
To:     <linux-patch-review@list.ti.com>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        "Andreas Dannenberg" <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        "Caleb Robey" <c-robey@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [uL PATCH 0/2] Enable BeagleBone AI
Date:   Wed, 13 Nov 2019 16:13:42 -0600
Message-ID: <20191113221345.4795-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following patches
1) Add device tree file for BeagleBone AI
2) Minor change to dra7.dtsi

Caleb Robey (2):
  ARM: dts: am5729: beaglebone-ai: adding device tree
  ARM: dts: am5729: beaglebone-ai: dra7 reqs in dts

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/am5729-beagleboneai.dts | 733 ++++++++++++++++++++++
 arch/arm/boot/dts/dra7.dtsi               |   2 +-
 3 files changed, 735 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts

-- 
2.17.1

