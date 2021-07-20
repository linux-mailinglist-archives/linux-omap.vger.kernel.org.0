Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A853CFD1F
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jul 2021 17:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237295AbhGTOcK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jul 2021 10:32:10 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:45797 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbhGTOBD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Jul 2021 10:01:03 -0400
Received: by mail-io1-f48.google.com with SMTP id z17so17588491iog.12;
        Tue, 20 Jul 2021 07:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=In2GK4BxVSXJR0G130bXVhwb0ZRtK2Xg1pZUaR2Rkhw=;
        b=JUNMygylc7btrek/cYakoVG0IvI1X/YBHGjCnz8H7WM2PgiU33KNOC7Qq7xJc0ldEb
         MYweXHPdmgHjZhjDdeAVw4XMOHLrKNyJy3oodNYAgwHzmyVyDkTjd0mKljQgEsgshDsL
         m5ABp72fJjyuxTgAhjAMI7GUJwTrJE1UHaY5Le/+/Jy/HjXx5tXXchQzkXTx9KU9WOPv
         ItCMmYYyEzAA5WhDgsBU6jec4Tj0QB6aAWfQK3Sfbji3ykwTem5RPC6Mtt1FEY475KQo
         crHtvZchGR24NhPZiWsQOqJCXq12HlgMMB0B5qy8+l2+cCknfyx/tBq3+V8V5n43gXYD
         0TYQ==
X-Gm-Message-State: AOAM531KgQO8/alBfQPozzciVXbzS5qO4QIt/NdHTDVamxMllOU6o2kC
        6J3TWuXOe3cp/eEl+No54w==
X-Google-Smtp-Source: ABdhPJxk5X0o3xzuhm3cRt+07VqKHazcPxgi4roaqr/BN8khWbAjpu3jyJn74HzrfKV96K5418RpQw==
X-Received: by 2002:a6b:e016:: with SMTP id z22mr22726636iog.187.1626792084568;
        Tue, 20 Jul 2021 07:41:24 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id 10sm2091407iln.39.2021.07.20.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:41:24 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org
Subject: [PATCH v3 1/3] ARM: dts: omap: Drop references to opp.txt
Date:   Tue, 20 Jul 2021 08:41:19 -0600
Message-Id: <20210720144121.66713-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

opp.txt is getting removed with the OPP binding converted to DT schema.
As it is unusual to reference a binding doc from a dts file, let's just
remove the reference.

Cc: "Benoît Cousson" <bcousson@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/omap34xx.dtsi | 1 -
 arch/arm/boot/dts/omap36xx.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index feaa43b78535..8b8451399784 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -24,7 +24,6 @@ cpu: cpu@0 {
 		};
 	};
 
-	/* see Documentation/devicetree/bindings/opp/opp.txt */
 	cpu0_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		syscon = <&scm_conf>;
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 20844dbc002e..22b33098b1a2 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -29,7 +29,6 @@ cpu: cpu@0 {
 		};
 	};
 
-	/* see Documentation/devicetree/bindings/opp/opp.txt */
 	cpu0_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		syscon = <&scm_conf>;
-- 
2.27.0

