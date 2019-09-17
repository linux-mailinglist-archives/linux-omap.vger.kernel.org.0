Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09C6B52A3
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 18:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbfIQQMi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 12:12:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39560 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbfIQQMi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 12:12:38 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so8961946ioc.6;
        Tue, 17 Sep 2019 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WEnd6CA2jothE5bzqT12cUNUGcNA3mMbmNkUCnktma0=;
        b=Y8QIhZ+mpfw2Dc8DUoh3Vg0RCtS632bvaOxR2MyzC/t+T7ADNqaVqoaU59sFo6EcCn
         llAGQDzMGgUdcvVlwxXT935otNrZba7U65A4hxjdwfA5zI43ge2E3pO7JPHfnL5WXYuz
         W2Nqtwlw8N6PBypphkowTlhNqj5ZWq56psxAhywwtfmGKmfJNE2pmTf20PPNT0WCJ1dR
         z65m8X2gv9iQnTDbUXFVtR9e60bCXVgNel0cjqPVH+ygAFWc2szpH7Wl9yYgWJWmw5Fd
         Wcjm41n3p4jKVUO+Pf88Bd+ZJvmLe+Krk4EkJOfcOTwcQu3dtI8N0lEoYF0oKQ8SAwwv
         KHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WEnd6CA2jothE5bzqT12cUNUGcNA3mMbmNkUCnktma0=;
        b=NYFMZwZItPTXaK13JG2qq32cz2x1c8DqpNhP5APdcWFK++z+B2bQtLUEjRxEB2E7g/
         JL5qf7fBp8r5xNrvsx8FqNApTQVzfVGvGXIaviIFoRf0ROgU55JErJ2y2qLJhBp7jivg
         eEuOQ53CWYN2N35n4ElhOjmtjVW6kocKE8o/WPgoLggWOzrNvP0n5JVBQSbSiaZHjo5M
         K0n0lJzLAmNm0wxFvR+Mg2Oio7c+/LSbeU38XLUmh8xXCbD0URXtScGx4dgGS4YoW3yu
         hnRLVpw5+Ow0IascHlsTsIlPDVkWDpxhr/69n8/MJxtdpNHvPfZoqhWOnbOA3SjIwFwS
         YarQ==
X-Gm-Message-State: APjAAAU1x7tWdBkXr2wJdlCBJG5CGdt7nDJkgJfnkzbex1FUESkSGZYA
        68d/sK4XKvFP575NLt4Au9U=
X-Google-Smtp-Source: APXvYqw82gd41rtWEeRFIHmEkIZ2K8Aglv1g8Yt6qRLTT0Ioa2nHqoN00Z0QQU7dccgXgV/FSJ8H7w==
X-Received: by 2002:a05:6602:10a:: with SMTP id s10mr1068356iot.171.1568736756502;
        Tue, 17 Sep 2019 09:12:36 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id p25sm2090487ioo.35.2019.09.17.09.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 09:12:35 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM panel
Date:   Tue, 17 Sep 2019 11:12:13 -0500
Message-Id: <20190917161214.2913-3-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917161214.2913-1-aford173@gmail.com>
References: <20190917161214.2913-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With the removal of the panel-dpi from the omap drivers, the
LCD no longer works.  This patch points the device tree to
a newly created panel named "logicpd,type28"

Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
index 07ac99b9cda6..00c426bd51a0 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
@@ -11,22 +11,8 @@
 #include "logicpd-torpedo-37xx-devkit.dts"
 
 &lcd0 {
-
+	/* This isn't the exact LCD, but the timings meet spec */
+	/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
+	compatible = "logicpd,type28";
 	label = "28";
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
 };
-- 
2.17.1

