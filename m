Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966AA41E85D
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352518AbhJAHgS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbhJAHgR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:36:17 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58BDC061775;
        Fri,  1 Oct 2021 00:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ap6uUMQ3j4gc9wyY3/X5V6udN3WmpT7CQ9ty7Jf/Pno=; b=DAdqJQFa5L5dxabht1BGmV+e/Q
        uez0ls0KKEXPPFjPuILcD6nAo8EmJtkSKgOTsmfH3gmnPu2EGj395i+yvV8iZ139kNIcL33GrggXu
        Zvufbz6jWA/Xq5i//RbBEl3MT4RTuBRY4m4bKo7JyoM1s9Eq6HrUk97Ke4YirCXhViCk=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3t-00012v-5x; Fri, 01 Oct 2021 09:34:29 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3s-00CBfV-NB; Fri, 01 Oct 2021 09:34:28 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        hns@goldelico.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 2/5] arm: dts: omap3-gta04: fix missing sensor supply
Date:   Fri,  1 Oct 2021 09:34:13 +0200
Message-Id: <20211001073416.2904733-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001073416.2904733-1-andreas@kemnade.info>
References: <20211001073416.2904733-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add mandatory supply properties. The supply is always on, so it is just
a syntax issue, no functional change.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index 9ccd45599104..ca6c95b432b5 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -508,6 +508,8 @@ bmp085@77 {
 		pinctrl-0 = <&bmp085_pins>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <17 IRQ_TYPE_EDGE_RISING>; /* GPIO_113 */
+		vdda-supply = <&vio>;
+		vddd-supply = <&vio>;
 	};
 
 	/* accelerometer */
-- 
2.30.2

