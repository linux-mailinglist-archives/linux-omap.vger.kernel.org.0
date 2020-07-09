Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0493221AB72
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgGIXUQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49312 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgGIXUP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK7px122934;
        Thu, 9 Jul 2020 18:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336807;
        bh=N+YPQiYfbFNBgXuAu/fQKZpj4xm9HZyt3OSvcyZWSpc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=xQFv0l7EnEZq8iUhXRPo+XXw0aUUqUkTtZF9D9cEpsMvJxcwuCWncWK3FJo397xgo
         S4pYXTIT2xx5qXa4f2Ew5aKLHX6pp4vz8ghBfS/31LbRka2JZ3ZO5A97Ny7xQf1EdU
         SwDReNJTsfAuY9XUzr6KGCLnga3SvF1qsTmiuKy0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 069NK75S012024
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 9 Jul 2020 18:20:07 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:06 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK6Y7096058;
        Thu, 9 Jul 2020 18:20:06 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK6CO124440;
        Thu, 9 Jul 2020 18:20:06 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 07/13] ARM: dts: omap4-panda-common:: Add system timers to DSP and IPU
Date:   Thu, 9 Jul 2020 18:19:48 -0500
Message-ID: <20200709231954.1973-8-s-anna@ti.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The BIOS System Tick timers have been added for the IPU and DSP
remoteproc devices on all the OMAP4-based Panda boards. The
following DMTimers are chosen:
	IPU : GPT3 (SMP-mode)
	DSP : GPT5

IPU has two Cortex-M3 processors, and is currently expected to be
running in SMP-mode, so only a single timer suffices to provide
the BIOS tick timer. An additional timer should be added for the
second processor in IPU if it were to be run in non-SMP mode. The
timer value also needs to be unique from the ones used by other
processors so that they can be run simultaneously.

The timers are optional, but are mandatory to support device
management features such as power management and watchdog support.
The above are added to successfully boot and execute firmware images
configured with the respective timers, images that use internal
processor subsystem timers are not affected. The timers can be
changed or removed as per the system integration needs, alongside
equivalent changes on the firmware side.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4-panda-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
index ef79028fc95f..db0b7e9264f9 100644
--- a/arch/arm/boot/dts/omap4-panda-common.dtsi
+++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
@@ -595,9 +595,11 @@ hdmi_out: endpoint {
 &dsp {
 	status = "okay";
 	memory-region = <&dsp_memory_region>;
+	ti,timers = <&timer5>;
 };
 
 &ipu {
 	status = "okay";
 	memory-region = <&ipu_memory_region>;
+	ti,timers = <&timer3>;
 };
-- 
2.26.0

