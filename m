Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3378BFCB7E
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 18:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKNRJw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 12:09:52 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59358 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfKNRJw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 12:09:52 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEH9jlp034873;
        Thu, 14 Nov 2019 11:09:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573751385;
        bh=gPnz1rJfyjOh/ySWBkSiOcb1ODqxJjWPuZBCiwdAc8U=;
        h=From:To:CC:Subject:Date;
        b=R77doGhPSSvArJZVUJjhkkztWybPtoJP6UHrCoMYoa0WBR8l6qIyJYqFjRknbQa9c
         m72Gx8dTK6NWYbcPQSoWBzac7hwDnNizJpHeOsNZRAadRapGRBqhvoF4+c6KCuS3Ab
         i6qLqsv4Mf5GvdhIpjtHO7VjQJmO5lnAoiMpmgvY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEH9jGg026456;
        Thu, 14 Nov 2019 11:09:45 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 11:09:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 11:09:43 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEH9hXJ082906;
        Thu, 14 Nov 2019 11:09:43 -0600
Received: from localhost (ulb0232989.dhcp.ti.com [172.25.137.130])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xAEH9hu10890;
        Thu, 14 Nov 2019 11:09:43 -0600 (CST)
From:   Caleb Robey <c-robey@ti.com>
To:     <linux-omap@vger.kernel.org>
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
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ARM: dts: am5729: beaglebone-ai: Enable BeagleBone AI
Date:   Thu, 14 Nov 2019 11:09:29 -0600
Message-ID: <20191114170933.12623-1-c-robey@ti.com>
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

Please disregard previous similar commits. Email for omap-linux was
incorrect.

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

