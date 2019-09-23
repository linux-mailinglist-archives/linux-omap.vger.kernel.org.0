Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88EABB5AE
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732363AbfIWNpT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:45:19 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44454 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfIWNpS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:45:18 -0400
Received: by mail-io1-f65.google.com with SMTP id j4so33441064iog.11;
        Mon, 23 Sep 2019 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=II3Z/ePw+kluHJAh79jkfAHhBKN0+PEn+7sKnI4/9O4=;
        b=LRIxgemCeo1xWi9guI7emc3IqoiMCWFHvsGEbD3szsHx+S8v43Ax2NGNrtoREyn2Bz
         vhnkmPK37M8KzQsgFNpeQ+BcY5h/4VC72ASTQkmKZFETngnZgV1M86XBfzG60leuCeYs
         563KI6gOtg2Ce7d1NMNGrrAYJiU2WaB9WV23rE+x6LA9JhY1eytJKSG14aTC/KvjYA1n
         gjRa5pf0opTGYsQOJAhOHxgr15AJXj9sfeSKMd5XroMv52TCQgRkb0VoaDoZ7IBXq97v
         aw8aj0jbzaySkiFHq/CcsyQl8tAs8gEdCDPa3DgVSik6vPjiWbrz6fWg/2rzp9h/8uh8
         vXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=II3Z/ePw+kluHJAh79jkfAHhBKN0+PEn+7sKnI4/9O4=;
        b=oyjP3LRkn7nNKmgUOrO7+GXZ6vxuENB69sBmQwtY2qDhndRXN2Ky7ZusxRm/GJXiYK
         4ZI1pSFcxov6/J07ygYTxEtQWeFlM3+6eCRm/dvuCvlRnF/cV1tNv8sXDJrgL6qtfZ4g
         0ggPU3o/15M7+5HgPhpTbcPdBgdfeBklWxUjMvbMfXRi8akaasuLtJOI1EKPr/SDeqfK
         wsd6RHD6B9dV6AZDdHiWyeYpVtcSmVHzTWb5++vyjYucXeTARx1Mz2fdB0ufSckDyDUq
         ivKeOsEgTf+ho7yldU0riDZSWRB3QbCdRnA7gN5hA7J12IY1JlYTLCkECR9YNsvFc9xp
         9Ejw==
X-Gm-Message-State: APjAAAX2Hmfn4JJz0+xxq5NRVvmEjRV21DHjLPg5PxPRB8+4t0eTxf1h
        q4J31JaogcGn7MOGqlN4ErE=
X-Google-Smtp-Source: APXvYqyL7wQoJ473oflZEdH5F1MQH5u5UVaHY3bRwruszPd0fFxVNFp6Y7enr88bqIkoM2DZxCPn8Q==
X-Received: by 2002:a6b:7509:: with SMTP id l9mr127293ioh.34.1569246317680;
        Mon, 23 Sep 2019 06:45:17 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x2sm8844474iob.74.2019.09.23.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 06:45:15 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com,
        Adam Ford <aford173@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM panel
Date:   Mon, 23 Sep 2019 08:44:49 -0500
Message-Id: <20190923134449.22326-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923134449.22326-1-aford173@gmail.com>
References: <20190923134449.22326-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the removal of the panel-dpi from the omap drivers, the
LCD no longer works.  This patch points the device tree to
a newly created panel named "logicpd,type28"

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
V2:  Remove legacy 'label' from binding

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
index 07ac99b9cda6..cdb89b3e2a9b 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
@@ -11,22 +11,6 @@
 #include "logicpd-torpedo-37xx-devkit.dts"
 
 &lcd0 {
-
-	label = "28";
-
-	panel-timing {
-		clock-frequency = <9000000>;
-		hactive = <480>;
-		vactive = <272>;
-		hfront-porch = <3>;
-		hback-porch = <2>;
-		hsync-len = <42>;
-		vback-porch = <3>;
-		vfront-porch = <2>;
-		vsync-len = <11>;
-		hsync-active = <1>;
-		vsync-active = <1>;
-		de-active = <1>;
-		pixelclk-active = <0>;
-	};
+	/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
+	compatible = "logicpd,type28";
 };
-- 
2.17.1

