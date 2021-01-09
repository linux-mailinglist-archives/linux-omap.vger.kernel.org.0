Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F79D2F01C4
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 17:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbhAIQkb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 11:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbhAIQka (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 11:40:30 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848B7C0617A2;
        Sat,  9 Jan 2021 08:39:50 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id u26so13139710iof.3;
        Sat, 09 Jan 2021 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJ9VvavqLAh7LXtHJl0lzGMU6JrL5/C3qz8ESIw9VPY=;
        b=JNCp70DS0a3G2bHL1bsdxhYkd3A25cBo3cFpGsfsCIN360Ca0CVPQOqtvv/7chZZQ8
         2moagB9rYXCO/4v5TX/y8UStP+jeOf2349BylE6g60/QOOSNfe6i+h4QhBASqkPSfpWg
         kA7X9jW4SQaf7cK60VPmnBnk93cGOkxcrDfsVKVcDRzCwRyeqVDyRvevwaEM7ue1EWHO
         RV/rVE2q569tCSlAGLdCiuk1sQZNSMOQ9aHJgeTGqT4KcSR09hib+18I6OMCbV5KgrWg
         WwH2uI27mOFJeeJRXBrTGHthnPSt8y8Kor4dK9A220JDQ63NHdm32THamlNlSFhv+nid
         zK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJ9VvavqLAh7LXtHJl0lzGMU6JrL5/C3qz8ESIw9VPY=;
        b=V3LcDroFnlAc7w0KszG9r+kUqAntEoPsX3hwUkamWNJZsuZaaQ4EWZ8YzKr0NINtT1
         15KON0NorDd8s/MIH1HZQTWrw165vFwaxkCEddT20/33MhjQOZTHrhA+dLWvO7hDyMG5
         4ewzpWR1G0NKH3zja/H0lHIhOJyFNNN07EzaQ6ydfOI0BJ1gJ6HvtW8iqbfwVYZBhxNV
         5sxkl6bK0I+p2MfphgiZ+CaT7/DxVupDY0zH5TUURXNm6lh8vdH3ENKp8ebUVqer18h/
         9I4tM3gWGo454NtN/VmvbZjnrB4Rys8S1EEDQw87Xub3kfiOmZHCOGaKbq5qYKwNy9SJ
         pC3A==
X-Gm-Message-State: AOAM531THr8fxn5sWwU4oi+sHe6D65l9p2bb0gJaVCTvKHZMiY4m7kaE
        8KBicLOw6Ch0Zo55r6ltvKqUSMkQaYUM+LbApWM=
X-Google-Smtp-Source: ABdhPJwzB3xum2lVGlbMAH9lqf9/GqRLNdMFjnsf6weM/2XSjcXDWU46LyxWZXojxlIM/c55CdwY3Q==
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr9523361iov.156.1610210389430;
        Sat, 09 Jan 2021 08:39:49 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:798:54b8:18cb:ae74])
        by smtp.gmail.com with ESMTPSA id a17sm717005ilc.77.2021.01.09.08.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 08:39:48 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     hns@goldelico.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
Date:   Sat,  9 Jan 2021 10:39:16 -0600
Message-Id: <20210109163916.1247431-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Previously, the 1GHz variants were marked as a turbo,
because that variant has reduced thermal operating range.

Now that the thermal throttling is in place, it should be
safe to remove the turbo-mode from the 1GHz variants, because
the CPU will automatically slow if the thermal limit is reached.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
index 3a5228562b0d..3451f9be104e 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
@@ -70,6 +70,7 @@ nand@0,0 {
 		gpmc,device-width = <2>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		status = "disabled";
 	};
 };
 
-- 
2.25.1

