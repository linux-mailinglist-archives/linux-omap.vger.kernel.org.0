Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620311CFF84
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 22:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbgELUjD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 16:39:03 -0400
Received: from muru.com ([72.249.23.125]:54154 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgELUjC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 16:39:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5A5C8812F;
        Tue, 12 May 2020 20:39:50 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/6] dt-bindings: omap: Update PRM binding for genpd
Date:   Tue, 12 May 2020 13:38:47 -0700
Message-Id: <20200512203852.29499-2-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512203852.29499-1-tony@atomide.com>
References: <20200512203852.29499-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRM (Power and Reset Module) has registers to enable and disable
power domains, so let's update the binding for that.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/arm/omap/prm-inst.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
--- a/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
+++ b/Documentation/devicetree/bindings/arm/omap/prm-inst.txt
@@ -18,12 +18,16 @@ Required properties:
 		(base address and length)
 
 Optional properties:
+- #power-domain-cells:	Should be 0 if the PRM instance is a power domain.
 - #reset-cells:	Should be 1 if the PRM instance in question supports resets.
+- clocks: Functional and interface clocks managed by the power domain
+- clock-names: Names for the clocks using "fck" and "ick" naming
 
 Example:
 
 prm_dsp2: prm@1b00 {
 	compatible = "ti,dra7-prm-inst", "ti,omap-prm-inst";
 	reg = <0x1b00 0x40>;
+	#power-domain-cells = <0>;
 	#reset-cells = <1>;
 };
-- 
2.26.2
