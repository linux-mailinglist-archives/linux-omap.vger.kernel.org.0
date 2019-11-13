Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD8DFB02F
	for <lists+linux-omap@lfdr.de>; Wed, 13 Nov 2019 13:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfKMMGH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Nov 2019 07:06:07 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:46932 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfKMMGG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Nov 2019 07:06:06 -0500
Received: by mail-yw1-f68.google.com with SMTP id i2so576848ywg.13
        for <linux-omap@vger.kernel.org>; Wed, 13 Nov 2019 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C4mO7kXfecbrOqwpRpob0D1OS3RYhi2WCm7nFkj76AQ=;
        b=raL7N6jdcsjb08L5rrtpNwWz1xhxgPAfBx/URWS4ZgjI+1iPhAWS9/ety0eFND0rOx
         fJ8zJ43E/6XvtcgYcf9mmi7Ot3UqP9BVKGgjoA9qxob0Dmc/SVF/+i1p5o/Du90g7jAf
         tDdq8ayYJhAbDkAnOG7Plfd1Dn9QxjSLHU6WmGbooeLgxuBD+WvxJ+p3h52g77t6dPqQ
         Fo8Mmf10W9ZdLbcIIOuH52sia/9CoVJZ2bYOqxCpoq5QkzMDPTvGmYuYo415HA0Ehu0A
         Fa+pdWmzFOxLclYepjktjHHKe/LAtBKoTCPd+noYCvbIoQ4a02D9cp8VB25UyuMsFuYC
         gPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C4mO7kXfecbrOqwpRpob0D1OS3RYhi2WCm7nFkj76AQ=;
        b=Ak4AH/Vu2kuBclTvhRxl2IW+vttB6WRaWHKssbxhNXSh0vmX7uOomm92mNoi2RerQU
         89W/jo9ljmw5XJ2jetBqw4t4sjX4dutHWw8sVJSwgCml5BMr9i4c24QZREss9P80ezK2
         YeJxpMXwdKImThfk1B/7Y5Po6TuzQ9sd6EMOvf5KDKOGO4wfWI/52ds5LpEDNs5fd/Rq
         d6CVoAC7oWM2R9YGcEtAaJkTttTg0Ycqa4W9fN+aEe+FsybvYCpWCav5gnHlm/tYKh/z
         y+EhWyVVqEReZiSsG/1Vfyq0dmvuxMl+Hhzw5KEmCKSAvDa+rEoAi/MnRFzcUsFNS3Id
         Ra+Q==
X-Gm-Message-State: APjAAAUpFhgGC23tQCDy580ftnG7LbF0iqe7q9QFe5IzceBZMLO7eCW8
        rDUeq7mu+XZcfzFYiRz+B/XhfyFTk+k=
X-Google-Smtp-Source: APXvYqxjOqTPWb4fv0faU63o7lk+vO1Q3kskFC69U7swr/YbsCkTsfASKKJErdRHvCRdhjm3nNxxkQ==
X-Received: by 2002:a0d:cb91:: with SMTP id n139mr1969515ywd.194.1573646764830;
        Wed, 13 Nov 2019 04:06:04 -0800 (PST)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id w126sm694659ywa.85.2019.11.13.04.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 04:06:03 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo: Remove unnecessary notes/comments
Date:   Wed, 13 Nov 2019 06:05:57 -0600
Message-Id: <20191113120557.6438-1-aford173@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There used to be a bug in the video driver that caused the timings
for the LCD to calculate in a way on the DM3730 which made it hang.

The work around for this bug was to set
CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 in the kernel.  This work around
is no longer needed as the video drivers have been corrected.

This patch removes the legacy note.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
index cdb89b3e2a9b..b5536132971f 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
@@ -11,6 +11,5 @@
 #include "logicpd-torpedo-37xx-devkit.dts"
 
 &lcd0 {
-	/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
 	compatible = "logicpd,type28";
 };
diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index f51b472b91b9..054169a4a794 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -131,7 +131,6 @@
 
 	lcd0: display {
 		/* This isn't the exact LCD, but the timings meet spec */
-		/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
 		compatible = "newhaven,nhd-4.3-480272ef-atxl";
 		label = "15";
 		pinctrl-names = "default";
-- 
2.20.1

