Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D78FCB72
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 18:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfKNRGx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 12:06:53 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41326 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfKNRGw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 12:06:52 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEH6jrF040997;
        Thu, 14 Nov 2019 11:06:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573751205;
        bh=TOFk+n55SR5E+wa8imt9kvjhp3LFM8oZ8Xc6S2tLXn8=;
        h=From:To:CC:Subject:Date;
        b=g67SqDXKC4JaLIxtCp4gXWNdIaP3Kwr6xbwjmvsfQWynuUIHAK+iof3UufTqr8HuM
         +mkOfufcWNtXUOw4bryY328oHE3NDE1QeIk4lOzssFp/91+YooGKljx/z7HJPsiiSV
         NSN3QFnP7ZotWrBIMMkGkUSEUwmi3xJoAAgr+GeA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEH6jOT101802
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 11:06:45 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 11:06:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 11:06:42 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEH6gle035666;
        Thu, 14 Nov 2019 11:06:42 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [172.25.137.130])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xAEH6fu08400;
        Thu, 14 Nov 2019 11:06:41 -0600 (CST)
From:   Caleb Robey <c-robey@ti.com>
To:     <linux_omap@vger.kernel.org>
CC:     Jason Kridner <jkridner@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, Jason Kridner <jdk@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Andreas Dannenberg <dannenberg@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Caleb Robey <c-robey@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Andrew F . Davis" <afd@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Tom Rini <trini@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH 0/2] ARM: dts: am5729: beaglebone-ai: Enable BeagleBone AI
Date:   Thu, 14 Nov 2019 11:06:17 -0600
Message-ID: <20191114170620.12346-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The following patches
1) Minor change to dra7.dtsi
2) Add device tree file for BeagleBone AI

update: moved dra7.dtsi changes before dts addition to prevent
compilation breaks

Caleb Robey (2):
  ARM: dts: am5729: beaglebone-ai: dra7 reqs in dts
  ARM: dts: am5729: beaglebone-ai: adding device tree

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/am5729-beagleboneai.dts | 733 ++++++++++++++++++++++
 arch/arm/boot/dts/dra7.dtsi               |   2 +-
 3 files changed, 735 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/am5729-beagleboneai.dts

-- 
2.17.1

