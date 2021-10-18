Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB2D432984
	for <lists+linux-omap@lfdr.de>; Tue, 19 Oct 2021 00:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233521AbhJRWGN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 18:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbhJRWGM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Oct 2021 18:06:12 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A14C06161C
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 15:04:01 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id y4so12284224plb.0
        for <linux-omap@vger.kernel.org>; Mon, 18 Oct 2021 15:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OU+IfE9McKgAt+oFo4Os7dUp/C7AkJcAgVog/W2QeCs=;
        b=FEEwzlxflKjOi9J0V9GZi9d/UdrrzBlvFxxp69+sMqXMLN4e8FfHj6faM0d+03WYdc
         SwWQIS3TPCnsKaXI44a9e3QFUHyShdGthl+Mo10mpFoPfwAmX6pfY4sh8NTuziWA1QYm
         2g4YoxsBkL4X9RJl1ZrwHUHqch7ExZFu99W5ZKJbCd38rdB3bJUnNhg7rnL5puAGAWMS
         hJFdnKqNTrFGNC95ylbs3UmkZklkoHwnBufXC+atS+2U6dZ3i2yUuQkq8ivOxorzVavp
         jg8JIfbgl56qMPoM6PaJcJNivn23OMlEAAY6n0Yelf4k2GITiA6PmQ8uuAy9pfSjl2+i
         OmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OU+IfE9McKgAt+oFo4Os7dUp/C7AkJcAgVog/W2QeCs=;
        b=qcHSXPxaUao4tzLAsmZ9FG66Yj+LiiyjC0h4k5tzir4f4g9aJgPHOvD2SJdeQ6ujFq
         PfQNMr1NvEhUDcRboUegEp7lM44UXUzcISMwqHAIY5EggVhXF4U5Duq1ka2SwPWfUnGG
         TN4tZFVDhxwiYWng1NM6OS8//8/3Fq3CYJ7K1mfzPFRk6YBR9IzMo6BgP+AHcLANRnbR
         mOmhwfdNoPBNVgAbr1qEYgI+OpbJAJP9IJXCjpjels2Ez9K4osZiWJ1EGE3/usr/uyKW
         NcDBV7tP2HaWI/5N5z7grKFP/fjSTQ+cxplADsjIJbgTAXMcx2nKYSnglacPKmvQ/5Xh
         4pAA==
X-Gm-Message-State: AOAM530fAZAc8znqkkgPw4bXA/EQtBcGMmIqUFi3EtWTprBNHJO/LiM3
        Y0yVIlzRfGt0jdhk8gA5yuqCVzuDukSY059g
X-Google-Smtp-Source: ABdhPJx2KuZvxGLDUHTDvXelJQuGV7UJXJzFPc28WsPHnv9LqnHTP5FO6AbvHOQ9dcJizghKQ1HZ+w==
X-Received: by 2002:a17:902:edc8:b0:13f:be3a:caa6 with SMTP id q8-20020a170902edc800b0013fbe3acaa6mr7697924plk.27.1634594640755;
        Mon, 18 Oct 2021 15:04:00 -0700 (PDT)
Received: from x1.lan ([2607:fb90:3273:95f2:c715:2287:eaad:f905])
        by smtp.gmail.com with ESMTPSA id f33sm386796pjk.42.2021.10.18.15.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 15:04:00 -0700 (PDT)
From:   Drew Fustini <dfustini@baylibre.com>
To:     Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
        Johan Hovold <johan@kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Benoit Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH 1/2] ARM: dts: am335x-boneblack-common: move system-power-controller
Date:   Mon, 18 Oct 2021 15:00:19 -0700
Message-Id: <20211018220018.1514652-2-dfustini@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211018220018.1514652-1-dfustini@baylibre.com>
References: <20211018220018.1514652-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Move the rtc node system-power-controller property from
am335x-boneblack-common.dtsi to am335x-bone-common.dtsi.

am335x-boneblack-common.dtsi is included by am335x-boneblack.dts,
am335x-boneblack-wireless.dts, am335x-sancloud-bbe.dts and
am335x-sancloud-bbe-lite.dts. All of these dts files also include
am335x-bone-common.dtsi and thus will retain the rtc node
system-power-controller property.

am335x-bone-common.dtsi is also included by am335x-bone.dts [1],
am335x-bonegreen.dts [2] and am335x-bonegreen-wireless.dts [3]. These
boards will now have the rtc node system-power-controller property too.
This is valid as they also have PMIC_POWR_EN (ZCZ C6) connected to
PWR_EN on the TPS65217B PMIC.

Based on 15c7be47fb7c ("ARM: dts: am335x: Add rtc node as
system-power-controller") by Keerthy in ti-linux-5.4.y branch [4].

[1] https://beagleboard.org/static/beaglebone/BEAGLEBONE_SCHEM_A3.pdf
[2] https://github.com/SeeedDocument/BeagleBone_Green/blob/master/resources/BEAGLEBONE_GREEN_V1.pdf
[3] https://github.com/SeeedDocument/BeagleBone_Green_Wireless/blob/master/resources/BeagleBone_Green%20Wireless_V1.0_SCH_20160314.pdf
[4] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git

Cc: Jason Kridner <jkridner@beagleboard.org>
Cc: Dave Gerlach <d-gerlach@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Link: https://lore.kernel.org/linux-omap/20211012191311.879838-1-dfustini@baylibre.com/
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/arm/boot/dts/am335x-bone-common.dtsi      | 1 +
 arch/arm/boot/dts/am335x-boneblack-common.dtsi | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 0ccdc7cd463b..56ae5095a5b8 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -399,6 +399,7 @@ &sham {
 &rtc {
 	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
+	system-power-controller;
 };
 
 &pruss_tm {
diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
index 10494c4431b9..a7a8c61ef9b2 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
@@ -22,10 +22,6 @@ &mmc2 {
 	non-removable;
 };
 
-&rtc {
-	system-power-controller;
-};
-
 / {
 	memory@80000000 {
 		device_type = "memory";
-- 
2.27.0

