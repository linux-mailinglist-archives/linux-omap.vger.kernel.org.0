Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385CB469972
	for <lists+linux-omap@lfdr.de>; Mon,  6 Dec 2021 15:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344629AbhLFOvj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Dec 2021 09:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344625AbhLFOvi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Dec 2021 09:51:38 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AF9C061746;
        Mon,  6 Dec 2021 06:48:09 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id t9so22928510wrx.7;
        Mon, 06 Dec 2021 06:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tl+bc9cDudWEWWttxQF08Y5sqNDbrMUOVcMdmCNzreI=;
        b=O6wtoj5/02M1fKKNutYuRB0M9wfe3TM4ANyffn110ToLoCnVAJLfaSpOLCDx1Ig7SH
         7+f27Ktq6CcK1tCRUw/YeES5lDysFXupGSrilLaK/HTj9pkbZqVYHLEUjEomJ+pHx3t1
         xcc6fPuymQCoBKFaG3h7T8UIdsql/iNT7PMYbNcGzPsDuEoVhpZuLQO80Zhpdad3UXxX
         LsskGHMkOMRu1EPv/RU1NhS1cdHfGvCwVqm00n55TZdP9lKZjFBm1OjQ8rgtmE+NEtwk
         PIKbw2QmvUQ5w5nXV9hMitMoAxnJPyw7IBbCdSvt7VwJ9C9Gk5jwgvMKk2AIhLZmn3BQ
         of0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tl+bc9cDudWEWWttxQF08Y5sqNDbrMUOVcMdmCNzreI=;
        b=2VmeT3A6XxO/8w5yA5Dl0t8+O3dPVu5XTADAvHSXmivtYW402o9m4Y0JlvPW/QOSQ3
         cR5GKl3pt3YWIqR4W/QEsPVvCaH1nt6VdE7wM/uO7dslWR81m0pmEchHac0J5iKE/4I4
         hzxMW5/RcKXKVx31b6nZlGhFhiAjnk5iKkyTt43fTljE5ScyiZf92HkwalszB2LDfR+j
         C368hdRVlcfaHchXOsI3xbhUPINM0+AXLuDcj7zwSfOKasZA/RIksb0dWgz2nEKb2Z9W
         R/knn0VNhB5mzdUTjz89P8KMr4WusVR6fF6X8juiFdj7DjrottTEUKKDNF+ZkH/7ZOIZ
         SZyA==
X-Gm-Message-State: AOAM531yZWvS5enCDDIbX67ICv7HeY1OAoi0BmPKdhWcrnSuHtwQr+XB
        k/QmWUy7682oiS9P4XBNRDYu200Bc80=
X-Google-Smtp-Source: ABdhPJyk3RhaeFP6AGhDL8ACrjn68+WzOUTXx18SZVBIonFP9OaVWOu9kAtoF1x/Ktq8CpEK3udBRQ==
X-Received: by 2002:adf:f551:: with SMTP id j17mr44914648wrp.392.1638802088477;
        Mon, 06 Dec 2021 06:48:08 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id o12sm16281478wrc.85.2021.12.06.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 06:48:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: dts: am335x: Use correct vendor prefix for Asahi Kasei Corp.
Date:   Mon,  6 Dec 2021 15:48:02 +0100
Message-Id: <20211206144802.217073-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206144802.217073-1-thierry.reding@gmail.com>
References: <20211206144802.217073-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The old "ak" vendor prefix that was never officially accepted was still
being used in some device trees. Convert to the correct vendor prefix
(i.e. "asahi-kasei").

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/am335x-boneblue.dts       | 2 +-
 arch/arm/boot/dts/am335x-osd3358-sm-red.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index c6bb325ead33..147c00de3795 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -341,7 +341,7 @@ i2c-gate {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ax8975@c {
-				compatible = "ak,ak8975";
+				compatible = "asahi-kasei,ak8975";
 				reg = <0x0c>;
 			};
 		};
diff --git a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
index 605b2a436edf..b2846cd220f0 100644
--- a/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
+++ b/arch/arm/boot/dts/am335x-osd3358-sm-red.dts
@@ -84,7 +84,7 @@ i2c-gate {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ax8975@c {
-				compatible = "ak,ak8975";
+				compatible = "asahi-kasei,ak8975";
 				reg = <0x0c>;
 			};
 		};
-- 
2.33.1

