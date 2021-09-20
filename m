Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3620C4114F7
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 14:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238880AbhITMyp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 08:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238756AbhITMyk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 08:54:40 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AB2C061764
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 05:53:14 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id i23so29427483wrb.2
        for <linux-omap@vger.kernel.org>; Mon, 20 Sep 2021 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PjEbP5FJLcpWh+4b44AHLWfvKeb2DmOP9yJ8lA/X9iA=;
        b=3XOYbCWAd6nb+N8oj01jL8MfRPdgUK/Ri4tO+xxWx5g5uh5XTt7COSZx4aYM5W5IR2
         tI03kPBLAOgLlyxDBmvyKAkX4GjlExxkEp3k8jCaVdibCWz40UaYa7T6I7D5YzIl/6eb
         a8kG2xKiFsGZVU9e2uFoVHa0TZJWWseb0HrvOwU1Nm2K0mDUegDN0bkiv/GdQYDBBiyZ
         neqt6LxM+6Gbv97Tpdpa8/1fE2AGXlzPVOMFQoPd/KDPxe3M1T6RkE2A46qs/hI1GPCM
         /PkMDlixgwwbjSU/7GiHGzcIcPOBmTdDpXV0yFQhK84Lsa3JIUnc2u3sTE8shzUC49sE
         n5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PjEbP5FJLcpWh+4b44AHLWfvKeb2DmOP9yJ8lA/X9iA=;
        b=C0scwomi/t8umiiXsyUnjbQwC/p6aFUalXrv7d3u/FYJh9K9NPevVng5fpiB/4es0A
         vRjeondd1Myrj7C+bG7QUsuu+e3ss7izwUH3ixaFYQIp4p93RP8GHeewXyoTFwLMStsQ
         pE1Wa4NaanQL5jx/UdVY6bNkRV+1OOeAWdGsg/ooGnQnrEvPhlSLIoMssALAMd+5Yy4l
         0A72P1TwWywp64r6faHtCDcqG/+fO4bV3X6GmI4DdCNpsz5dzo6/Ul+4GK8UZmcrX6wB
         g2OSGrV8+4vy+1eb9smh6AApHdYil8BAhQ1f6lQz8/wNGSba58ZNOoblZwq3Ss7wLDxM
         JHww==
X-Gm-Message-State: AOAM533xxxj/erCe2x6Xlo3EwWZzaKDHjK6FhK3d0LlENOUp5YlgmPgB
        pVOqDZ7wChfHjgPbJq9vMGtxXQ==
X-Google-Smtp-Source: ABdhPJxFeSU0jxjMYkUW8j+6kTjexSxZSwQl8MOiIsTkj+Pz9m2MLhUxApnqYlfA23Ad8UB5U9uJjQ==
X-Received: by 2002:adf:f011:: with SMTP id j17mr28087183wro.320.1632142392493;
        Mon, 20 Sep 2021 05:53:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:aa8a:ef22:59c5:1bf3])
        by smtp.gmail.com with ESMTPSA id j21sm15791643wrd.48.2021.09.20.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:53:12 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     tony@atomide.com
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gowtham Tammana <g-tammana@ti.com>,
        Eric Ruei <e-ruei1@ti.com>, Jacob Stiffler <j-stiffler@ti.com>,
        Jyri Sarha <jsarha@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/4] ARM: dts: am57xx-evm: Enable BB2D node
Date:   Mon, 20 Sep 2021 14:53:06 +0200
Message-Id: <20210920125306.12347-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920125306.12347-1-narmstrong@baylibre.com>
References: <20210920125306.12347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Gowtham Tammana <g-tammana@ti.com>

This enables the BB2D graphics accelerator for the AM57x based
Beagle-X15 (GPEVM) and IDK platforms.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi | 4 ++++
 arch/arm/boot/dts/am57xx-idk-common.dtsi        | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index 994e69ab38d7..151b3d5775cc 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -645,3 +645,7 @@ &pruss1_mdio {
 &pruss2_mdio {
 	status = "disabled";
 };
+
+&bb2d {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index 9fcb8944aa3e..cbab72a4c8b6 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -606,3 +606,7 @@ dpi_out: endpoint {
 		};
 	};
 };
+
+&bb2d {
+	status = "ok";
+};
-- 
2.25.1

