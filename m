Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C853C4474
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 01:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbfJAXjs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 19:39:48 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40359 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729183AbfJAXjr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 19:39:47 -0400
Received: by mail-io1-f66.google.com with SMTP id h144so52550160iof.7;
        Tue, 01 Oct 2019 16:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
        b=s2y/BjDkHUKyKzAQzrjAl1VabgJ9k0XGxXiVy6NWUZZemcNMVPPt/spkxXU0oIKctW
         SYIPQ7qHvvvnBNHnmcxkZ2x+FDdNUqmwT3GrpkD/0F9+y4DsfjK8lBYowHyj8rWLxDkD
         4OrSusi/2U2CyqTxs6p8I0VrFbedvkUNAOnJ2NCBxufnMO6JE4T65mX0sc35waKtuLhG
         hE01QxJ+yH6QkqN4+fCdx4ojwIKqFwhvjdNL7NbOqE1z+RRmC4/q8gd+5P2j0417wpSi
         EhXEabn2qUIEvVSwgV5I8a0IB8CLqwnIpMoyh6dXV//zRUL/HUX4kGkgitcpnWZ4bKxn
         7Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IviJQ2N622ovMvnAFQ5UMMPkhv4vjXzkXpkg1vsAmBc=;
        b=WZEVyIRxxLL4uf9uul1VVWeB/pyvrq6bhYtuEJeQvDwf8+Tr3Wge2UYjen/QQKgBfk
         JYxrPtWiH53DINobI19KJek55EsBzQ29XAjFp966mmFV3FQbaBo3pBfUCJbkVz4tuIgm
         tgNFXAPUuJEdAbYRkOd+2xJW633t2aXuZZ7fpp6WthirUvtxDCpsIGcLK3NACb2vGmun
         yyijmTAzdq7RoMEvLJ+mdQbukNrNkUvWGynhW1smWDnni//Lw+R6C8fr80vVZ4VMGl64
         4I7FOdatJm0RHE9pt8PVWOzvje+EM9AK24avg097yGfRPQx/ovD1ZGBpvfNkUyLNcLyz
         JvNw==
X-Gm-Message-State: APjAAAXSx4Qadlrh5R9LscSdCcOkZQc2vyVRW75Q0oZAhgo3H+4U1aph
        QBuC4/w38ZYLcG3Xsqj31ks=
X-Google-Smtp-Source: APXvYqwj5fYuoeZ35KUVEgXhV7iupye+0WvMu/YojybjzHirO2F5K8m7QcrHeuzMoeCJOqpoXkWrDw==
X-Received: by 2002:a02:698d:: with SMTP id e135mr1021533jac.128.1569973184814;
        Tue, 01 Oct 2019 16:39:44 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r22sm8659935ilb.85.2019.10.01.16.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 16:39:44 -0700 (PDT)
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
Date:   Tue,  1 Oct 2019 18:39:20 -0500
Message-Id: <20191001233923.16514-3-aford173@gmail.com>
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

