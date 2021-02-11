Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CCC318886
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 11:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhBKKrg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 05:47:36 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44359 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230362AbhBKKpU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 05:45:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id A9LMlXsw2Zvk6A9LRlud2r; Thu, 11 Feb 2021 11:37:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613039830; bh=7vv8Zq5ueB4PQjpkMshes9HEfaPbs32Qu9KVZZjtkgA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=sqeJHknh0nE18+Vr9xLDCTkY7bhVZ1X/y0Q/KciAV+M7116HjxZlUi2ti5BjoO7cB
         bG7bmuvTJo2zAflfWcO4I74d+TgtKVHvEMct9ddHIzX5H+mIhYWx8MGQQgPDpc3Dok
         Fn55RQFyvVM5oLRCEODhZBV9sP5qNpcCkgGkc5nNv6mfGqKo6t0VSE5L/pWXAtXy0e
         GLPM1Vf4HucbgTIV20akkwsyXuIj4JsUKemRJYlMvKb8iZddb4afzOc7bXN7KuSfYR
         5+JA57tVdArfxcYynmxXB0JDUC+CcL0UvEH3A88j9iUqWzxSlKyf5eons0tY/7VSd9
         S8xrqfDmJ55/w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/5] ARM: dts: dra7/omap5: add cec clock
Date:   Thu, 11 Feb 2021 11:37:03 +0100
Message-Id: <20210211103703.444625-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNEPV5trBOdUFJkU/q7gPA/oLKp4ICGDInS3lmKd/qbVi4uzGyZ0iHSVxDiSpXIdZ7AxLat7wXkpvTzKx3fz8gcShYjdQUcacCTQmLVvDm9+jfiFgHV6
 auago6tub5JSEG94VylRbjLmpRYac+/jRq1z0lNkmw/GKwOyiGFwM9FiZZP9pyR2M4q//VvSrIR0LUEibJ6F5pRFRlZLd55mdYDy/r7DOA1Ts/IoIw3+2B3V
 XnVqqdRTYgAb0b3R0/yWiaRQK7Vb4QyJlhLFmdxZnyDPl8XUbzjbP37cD7DNoBiW1icn1dBxhmXmDDFSthYgrm1oKNJnUGcUsTsBxPcVcqpJAFj75ELMH3gk
 rvcj3BUp6Eb+AUaxmIevUSO4zzTUrZ0aQP6/tRCjczo1GGYdg4n8YKttXJR2AXmpVGUZjWN8Lj/OP0u7JIYgXKT6gTQREGuDWv7VGZd4yeAwH5JILm4=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add cec clock to the dra7 and omap5 device trees.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
index 5f1a8bd13880..2bb1000aeae9 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -580,8 +580,9 @@ hdmi: encoder@0 {
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
2.30.0

