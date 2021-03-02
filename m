Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8A232B146
	for <lists+linux-omap@lfdr.de>; Wed,  3 Mar 2021 04:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237738AbhCCAok (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Mar 2021 19:44:40 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:55253 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1449348AbhCBQ1f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Mar 2021 11:27:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id H7oZlNjwSOruFH7oklAWOO; Tue, 02 Mar 2021 17:24:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614702255; bh=JcmsffEL5WpBEoNeg3xiXwWYe1OCSoVS4wjvJzi8Lyo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Z5p6AxY40Gdg4RncvYdR/6YBOWlashNd/+qCJa9TFcm9tB659XFHqZtdXQjp0cct+
         2ie9h58xaQtlOhel4ELRs+b9e3cktfPRG2ndCK9qD5Kn2jnRxDMv8L243yyD7a2tRM
         FpeNm+WqKqxFHAASxkSaMVOvA35Tx8ioJusQR+Csh8zlU6fqw37PBzq9WSVF8wTeeG
         l8fEsSHYUegvrsp5wBrVqvllIKMY1mehRcFKQpGioBKZEhYY9D2GXaXEDqm+AF6mzF
         VQE5IgNq2T8nnZqDrai1B71/oMyjeZQWZJl3mQm8b0uhC9UsLVjdPdwwAlr0Tz+s3w
         GX+9faNSB6jaQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 5/6] dra7.dtsi/omap5.dtsi: add cec clock
Date:   Tue,  2 Mar 2021 17:24:02 +0100
Message-Id: <20210302162403.983585-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNUB+sdY0Nm8qd3cl9r7BXSq0BBS7jqi5Lu6jbPac3arDT5eCsLhjN4ypUHGaM2YpYyJnV31GXmxKoYqT0CqX1Lz/ZMa6SdDIHgabasbOhLt6izKl1Tm
 UTyZAA8uUXpaZbycaoFWudPaObMjWAdDrSNQw41Bccl8+t60umcly65lV7yOFQBDPkOrIG8oqehso9PYjgDzE50hSUDZh9gvHh8jpP/CeYt+7ZzK3BuABCh2
 3NqeIsObJ0lCwJoHLZXHrvVIQWnH9H+xgaeD6tvtUof5lG/PApXApoFug8rXa+RUYy3jngEPKfV+9jbd12Af+qW0HieOIq9ngQT0JXi5384ddUjLh6lY5Wq0
 ZYPUHeVrrAaCMzswM4IEEO7W2l450QzGSMkP2omkQ748eSpJLmdkuUZdUVknZ4WOYlVgQbbGfr0w80i2aH3g6Gi/R6PrA1gRyxMyYdVYCkytHdzRHCMmy3+J
 LWZ+tE9IYAzu26jJI+qfl1M+YK8Akpy+dmg2zS082RTbuTC8BhC7A/YIM7E=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add cec clock to the dra7 and omap5 device trees.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7.dtsi  | 5 +++--
 arch/arm/boot/dts/omap5.dtsi | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index ce1194744f84..efe579ddb324 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -879,8 +879,9 @@ hdmi: encoder@0 {
 						interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
 						clocks = <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 9>,
-							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>;
-						clock-names = "fck", "sys_clk";
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 10>,
+							 <&dss_clkctrl DRA7_DSS_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck", "sys_clk", "cec";
 						dmas = <&sdma_xbar 76>;
 						dma-names = "audio_tx";
 					};
diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index e025b7c9a357..6726e1f1b07c 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -586,8 +586,9 @@ hdmi: encoder@0 {
 						interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 9>,
-							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
-						clock-names = "fck", "sys_clk";
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>,
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 11>;
+						clock-names = "fck", "sys_clk", "cec";
 						dmas = <&sdma 76>;
 						dma-names = "audio_tx";
 					};
-- 
2.30.1

