Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913D8141D90
	for <lists+linux-omap@lfdr.de>; Sun, 19 Jan 2020 12:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgASLaB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Jan 2020 06:30:01 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44829 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgASLaB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Jan 2020 06:30:01 -0500
Received: by mail-pl1-f196.google.com with SMTP id d9so133980plo.11;
        Sun, 19 Jan 2020 03:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MGnExAerV3JssOOZACwzhm+zW2U1SumUHkN5NAnxS0Q=;
        b=hwr9gpqQT3P2kQsR8YXzNLRLMkzjUx23Hx54nrlDIGbMd46ssImw5RROfQO85tnsV/
         DIg591x/HIQrI730wfPYKOOnOLO0sMRHbW+MUkfBEqQgwlu4vaugQfP0mAdshEcX+0ur
         UaDCBwxFFLDsmSPLB4GGTyiFWVe+ZFJxqOPSX1097YQ8X6IHSm/C1KJfgNq/FgEKux+y
         //oELbxGNGdGy/wlr0ofLPKoXWa6Pbq9nATbCV+oaxqqrbVwf107uJpwwlqtNbFFANqj
         mlTf3vOltWXMBuwPrFqx13N3FVISOUXg7WMy6dTlI0Qvxq7KmvZmzccU1zkcNjaGVPg8
         jcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MGnExAerV3JssOOZACwzhm+zW2U1SumUHkN5NAnxS0Q=;
        b=FAmevLVgbl36VlVMsVC5eNX9Meg4jcTyKpI6/VadcG+rZiswJ7rv/49mKcXXu5t4Gy
         asTK9AphjHteWt8llnsgwS/tIsLS6OigqXnYhm/cCwntlH+eOyJI2P/ZAPiEU38m25d+
         3/Hmp6t2eNAPssX1yKzTbh4QmI7LKN3naLKEKmjswZTUhitunGsDEMlJrBPPUA1F4sKj
         1s26z2XmD9883Z2U0t5ioAC+zhydArUZnHYnZveGks/VBL59jX6KWJ4KGPlcSzFPt9bR
         YYHWV1jDIl19baW82iYBPNRhyI9N4PH/i6VZ7mIbIIPhBLZwh9Iy+M2oEKJlt5i9A4uI
         DwAA==
X-Gm-Message-State: APjAAAXRc8crRmy+WT71MhDiZA4FlOaHzt28hzv3re1fQNCatKHbi16C
        3DABunnR4N0XXqqdhTAYGPg=
X-Google-Smtp-Source: APXvYqzo++TpbfuUhlZ+uPgXY1tOjvMFpk1EWs5JAEdEXQOU62JdFbFh330RKhYkRdgyT8MuteUKqQ==
X-Received: by 2002:a17:902:9005:: with SMTP id a5mr4915526plp.338.1579433400536;
        Sun, 19 Jan 2020 03:30:00 -0800 (PST)
Received: from localhost.localdomain ([219.91.191.70])
        by smtp.gmail.com with ESMTPSA id q10sm36496600pfn.5.2020.01.19.03.29.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 19 Jan 2020 03:29:59 -0800 (PST)
From:   Raag Jadav <raagjadav@gmail.com>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH] ARM: dts: am43x-epos-evm: set data pin directions for spi0 and spi1
Date:   Sun, 19 Jan 2020 16:58:59 +0530
Message-Id: <1579433339-10663-1-git-send-email-raagjadav@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Set d0 and d1 pin directions for spi0 and spi1 as per their pinmux.

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
 arch/arm/boot/dts/am43x-epos-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
index 078cb47..a6fbc08 100644
--- a/arch/arm/boot/dts/am43x-epos-evm.dts
+++ b/arch/arm/boot/dts/am43x-epos-evm.dts
@@ -848,6 +848,7 @@
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi0_pins_default>;
 	pinctrl-1 = <&spi0_pins_sleep>;
+	ti,pindir-d0-out-d1-in = <1>;
 };
 
 &spi1 {
@@ -855,6 +856,7 @@
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi1_pins_default>;
 	pinctrl-1 = <&spi1_pins_sleep>;
+	ti,pindir-d0-out-d1-in = <1>;
 };
 
 &usb2_phy1 {
-- 
2.7.4

