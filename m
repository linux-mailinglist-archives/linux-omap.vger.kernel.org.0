Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36845C446E
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 01:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbfJAXju (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 19:39:50 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37682 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729219AbfJAXju (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 19:39:50 -0400
Received: by mail-io1-f66.google.com with SMTP id b19so24534959iob.4;
        Tue, 01 Oct 2019 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
        b=DNOUBVmVUAypCrPEcDm3GsIKmKDVicfDkI4NfruqmYi2MbnOdkXuQs2Hz45pZdKkXP
         tQ8LxfGcTS8aExdl0rNn7GFyd+jpdJ0HQkik2f14QyjgMJu4MWa7nZUeDWbS4HTnivc4
         mZGOByd/VTLmvEpH9QvFam1pMSxa0F3bFvzbBfk5lYVcOJwA2lz7vl0qxcwkIkW1Y58w
         OhmFkSTbCGXaUlfxXD5sPggnlSdIIsRuJCrbbcAVvIMb8p5RCFKEcxTpstSB54rK1NbJ
         yPq7hRfuuMWFF8lnjYYrApUgOMCcSjRLKS4O/IDjL9cXqDM8eB+mpJTU6YkzzHQgKDMy
         O7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
        b=Z1HD5QUY742LX4P48C3Ze3bwTaRFnuhXZ1L0it1qxlwCNiJh/t5UflVGUKJqSzNwCR
         Br6jdFRv+fnyNGx6/z79FrzOuJYTswKvFjd3sYBTqxjPaY7rgKg+RCl2FF/xzgsw6Pzc
         454ziLaUNwk3VlCsCPqrIt3L+3mDTlRaiTVY5H8PHC/jiurGCiEflnXRY4c75sR6ackW
         rmain2ze94EeYRdNqHTabdgJjDcDp5HM+3jopZ976FFsd9wmLcttLHUcXLs0UUNwUffz
         penWqJzoCKyI9yFu8WTXHblPlwAitr7vks8SsaKJB126i30M5+OJVeZQ5GZM0+OvGQrc
         tf4A==
X-Gm-Message-State: APjAAAWJrUgAmfYkKwThzyTDmEMJ6m6kVPRVmqLTegfzxENjhs4vPJbH
        +TGkwrcPXNTNVsR5y6lbMHo=
X-Google-Smtp-Source: APXvYqy4qifIuV3uXjVmLyj/P9fmIFx/f/pEw5vONAuRa7jHVpmKT9t9pDPuxlKh2izbbpKZGI5FbQ==
X-Received: by 2002:a92:1559:: with SMTP id v86mr820194ilk.130.1569973189265;
        Tue, 01 Oct 2019 16:39:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 16:39:48 -0700 (PDT)
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
Subject: [PATCH V4 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new DRM panel
Date:   Tue,  1 Oct 2019 18:39:23 -0500
Message-Id: <20191001233923.16514-6-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001233923.16514-1-aford173@gmail.com>
References: <20191001233923.16514-1-aford173@gmail.com>
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
V4:  No Change
V3:  No change
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

