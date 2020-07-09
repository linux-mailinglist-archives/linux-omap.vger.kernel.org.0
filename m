Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9D521AB74
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 01:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgGIXUR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 19:20:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49314 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgGIXUQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 9 Jul 2020 19:20:16 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 069NK9dI122954;
        Thu, 9 Jul 2020 18:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594336809;
        bh=Q2UknZFZp0eYO410jfQeNU8OelHDDnS7sGKVXVirJAw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=CGgXIqVAYgv0t9mlMOJSAhp3bcCTAObcPuolH/YYwPfRndyjIEd19nZkY+RFi5RtO
         e9nT4yrN9LmMgaiHyq2fZwIUptudm5aT9+KqXmz+lErU9IIAVStR9TM42hMZhGfCUf
         alkRlgoppxtOTjpcn7Qe+auyAEYjyOcBXKvuw77I=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK9ZP099442;
        Thu, 9 Jul 2020 18:20:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 9 Jul
 2020 18:20:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 9 Jul 2020 18:20:08 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 069NK7Ds119283;
        Thu, 9 Jul 2020 18:20:08 -0500
Received: from localhost ([10.250.34.57])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 069NK7ex124457;
        Thu, 9 Jul 2020 18:20:07 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 09/13] ARM: dts: omap5: Add aliases for rproc nodes
Date:   Thu, 9 Jul 2020 18:19:50 -0500
Message-ID: <20200709231954.1973-10-s-anna@ti.com>
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

Add aliases for the DSP and IPU remoteproc processor
nodes common to all OMAP5 boards. The aliases uses
the stem "rproc", and are identical to the values
chosen on OMAP4 boards.

The aliases can be overridden, if needed, in the
respective board files.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 116150ded018..adffc48a6d55 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -31,6 +31,8 @@ aliases {
 		serial3 = &uart4;
 		serial4 = &uart5;
 		serial5 = &uart6;
+		rproc0 = &dsp;
+		rproc1 = &ipu;
 	};
 
 	cpus {
-- 
2.26.0

