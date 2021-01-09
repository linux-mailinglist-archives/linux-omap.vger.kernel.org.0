Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6232F01F8
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 18:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbhAIRBx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 12:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAIRBw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 12:01:52 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB4BC061786;
        Sat,  9 Jan 2021 09:01:12 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id e22so12635643iom.5;
        Sat, 09 Jan 2021 09:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lswJw4ls0dqJza2JHYmabJJAMwLw6KbwVHaWT/Fl6/I=;
        b=F2Eby1zdcDBxnyZ5YgRobJ77aXrntP2fW10N81+GRFrKOYBPaaj4yBWpsAVMnRj3V6
         nyPaVaujkCdC1ufPhu1xP83S1yUJwoKpsI3IyXW7rhnCrRpC4RAeUMWgqv+cD3urKzrb
         2Ad7pnYbCKYFJuHVZgJTqh/HqdOV7GHxsDLXrzeU7GlUXu3F25QQQhvCDBXG+1+QhpCt
         MDbrOv5ljJmqtoZOwFx8/pG9HmE3wgyOy5xsI44R0flB9Buguk//pcIQaUVMnyVNzwmh
         XKt7ONc6gbc/QoSf2tVstMQGYS/c7VH/Ek/pYX2ZCC86199m2oMD4/VuX/iz8ChC2PMS
         1/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lswJw4ls0dqJza2JHYmabJJAMwLw6KbwVHaWT/Fl6/I=;
        b=nhluekCtSBhyYE4KarT0yMA0UAlAkcNRVt3Z/8vnqB8/BmW+YCsj79WBeyVExqR5ua
         mrR6Rki63C37V0y9Igg4C1K3xPAmfuiF7RWLgUHL1XcbId5kU1o/YiLUz1BKWvEAIUdN
         D7pUiuuZjJ1yF19lSaolDWmAMy8cJOjUH6lQyaYqNzwMJV/AuDxkfr1Rc693KKrMc/jO
         kAL1Ga0AEgsHtuKyz6Z09T6/+bvwFg11mSlElaSpsXQ5ag8ZAwzAOTefDOBltJxSRAPK
         eXsc3FbfVtOlrrIeIjpFGb7qZzgT3QcqM2nUsPQsEVlWpw8fT/7SFS0yeq1s3Wqikb8H
         1knw==
X-Gm-Message-State: AOAM5318tjWenlAOVoh/BWbxZNO+uFZ4fRwyzwD2aG3M6zuM/QGBTGgT
        mCOJapHyHa11s3XtVv2SoZQNSAMVJApqR90g/fU=
X-Google-Smtp-Source: ABdhPJwsWbSlA5s+4uJHXUQnlAO3+hnEn2f75m1h/B1Wzcdu7WYfxcBXA2OqIhJdLwdd6/imW9/RQQ==
X-Received: by 2002:a02:8790:: with SMTP id t16mr8320324jai.80.1610211671566;
        Sat, 09 Jan 2021 09:01:11 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:798:54b8:18cb:ae74])
        by smtp.gmail.com with ESMTPSA id z63sm10748487ilk.72.2021.01.09.09.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 09:01:11 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     hns@goldelico.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2] ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
Date:   Sat,  9 Jan 2021 11:01:03 -0600
Message-Id: <20210109170103.1249838-1-aford173@gmail.com>
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
---
V2:  The orignal patch had the wrong file added. Add the omap36xx.dtsi

diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 05fe5ed127b0..20844dbc002e 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -72,7 +72,6 @@ opp1g-1000000000 {
 					 <1375000 1375000 1375000>;
 			/* only on am/dm37x with speed-binned bit set */
 			opp-supported-hw = <0xffffffff 2>;
-			turbo-mode;
 		};
 	};
 
-- 
2.25.1

