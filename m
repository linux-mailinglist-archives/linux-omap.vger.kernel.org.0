Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B5E47AA80
	for <lists+linux-omap@lfdr.de>; Mon, 20 Dec 2021 14:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhLTNlo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Dec 2021 08:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhLTNln (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Dec 2021 08:41:43 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51EC3C061574
        for <linux-omap@vger.kernel.org>; Mon, 20 Dec 2021 05:41:43 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so9605249wmj.5
        for <linux-omap@vger.kernel.org>; Mon, 20 Dec 2021 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOr18g898ZyZfaDwFoqGSOzkJGi0rvijYF97Ulw267I=;
        b=bdPgXJuVndQYn+C2MIXnPu/ZCWxkInMku0G6xt7R3rPwziCSY4AJzC0zr6uKkXDvfr
         FdrB17CJkmYek460U5qNguz3OmWcAxBIe/3PL2K7eRmjQ9sVOrulIiIaSmMTZuEqOYpi
         ZvWD5aTOuRFa9SWPKR9A31rRA6W0UhhRtwQ2KLI+UC6wBbSBq4eIgFXnbYF979Ej4Cp9
         mMZ+dwmoGYWlnQFZ2gpEWPhof8ft+SXJQ5QWcagWUyUSpPXu/AGDUQATqMzPfTl6mLeK
         SQafUpteG2wLZ5jGcaUeabxbydkF8OU+GKzxCEZhxRKVns2O2C3L+b5wmlIbrxU93ikt
         jzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NOr18g898ZyZfaDwFoqGSOzkJGi0rvijYF97Ulw267I=;
        b=LdGUC8jMOJ5adfhIPWUBNqLguGKbe2NW4LQyl6sqI0Uzn/ersEWNrHNv3U1KdyhAgO
         GrU/lyPgAvXnMND7iIXzQ78GaUrIRfvpTDRQ8QFm6YBwbK0YIFN6i83+8MCLHwa7Jn5S
         wMqjwentJXhaBPUDvKDCi86vAM8ZLZwpvWJ0TvEd/NSwO/UJPI/lcBGCulGdCLbLYi8y
         fTA5P1vzFLf2EvPaht7txI/RFSyEQuIHi+zfKJinzNijtiieJC+7g4hAPu7nb9HEWbq0
         gMor0eB9LerRP127PU7H9WDkE2vhk0lsy6E80diXyDzFg3dGGQ/odgj23yCar6TOfmCI
         RLkA==
X-Gm-Message-State: AOAM530ClOclGeYAcRt18d1TPBeLqLB9CDw4KFSamQQ91J97bEy4pYQZ
        q7SKWkfbT2tnN0DLrA7b188RZjygiJVDvQ==
X-Google-Smtp-Source: ABdhPJyot1nFOvUWKiDPHu0fq6oU3wei5emmGG4GffCiJ8ymTB9qthb9sUDk8Gc+b4GS63q3liJ1SQ==
X-Received: by 2002:a05:600c:4f13:: with SMTP id l19mr8113619wmq.194.1640007701824;
        Mon, 20 Dec 2021 05:41:41 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l13sm6223508wms.1.2021.12.20.05.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 05:41:41 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH] ARM: dts: am334x: pdu001: Use correct node name for RTC
Date:   Mon, 20 Dec 2021 14:41:39 +0100
Message-Id: <20211220134139.683412-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

RTC devices should be named "rtc" according to the standard RTC device
tree schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/am335x-pdu001.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-pdu001.dts b/arch/arm/boot/dts/am335x-pdu001.dts
index b793beeab245..ce6cc2b96654 100644
--- a/arch/arm/boot/dts/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/am335x-pdu001.dts
@@ -353,7 +353,7 @@ tft-panel@0 {
 		};
 	};
 
-	mcp79400: mcp79400@6f {
+	mcp79400: rtc@6f {
 		compatible = "microchip,mcp7940x";
 		reg = <0x6f>;
 	};
-- 
2.34.1

