Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CDB293AE3
	for <lists+linux-omap@lfdr.de>; Tue, 20 Oct 2020 14:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394215AbgJTMDC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Oct 2020 08:03:02 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:51940 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393947AbgJTMAT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Oct 2020 08:00:19 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 006E3803073C;
        Tue, 20 Oct 2020 12:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ly27iAvja4vw; Tue, 20 Oct 2020 15:00:16 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible string
Date:   Tue, 20 Oct 2020 14:59:33 +0300
Message-ID: <20201020115959.2658-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Syonpsys IP cores are supposed to be defined with "snps" vendor-prefix.
Use it instead of the deprecated "synopsys" one.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 arch/arm/boot/dts/am437x-l4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 3d393fe252c6..59eeff217844 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2386,7 +2386,7 @@ dwc3_1: omap_dwc3@0 {
 				ranges = <0 0 0x20000>;
 
 				usb1: usb@10000 {
-					compatible = "synopsys,dwc3";
+					compatible = "snps,dwc3";
 					reg = <0x10000 0x10000>;
 					interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 						     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
@@ -2466,7 +2466,7 @@ dwc3_2: omap_dwc3@0 {
 				ranges = <0 0 0x20000>;
 
 				usb2: usb@10000 {
-					compatible = "synopsys,dwc3";
+					compatible = "snps,dwc3";
 					reg = <0x10000 0x10000>;
 					interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
 						     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.27.0

