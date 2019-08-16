Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6929290B31
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 00:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727765AbfHPW6U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Aug 2019 18:58:20 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39746 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727696AbfHPW6U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Aug 2019 18:58:20 -0400
Received: by mail-io1-f65.google.com with SMTP id l7so9392101ioj.6
        for <linux-omap@vger.kernel.org>; Fri, 16 Aug 2019 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Yt62NiecCdV5bCndAIPH9PMyIUX3h3cE3F9d5aI9/eA=;
        b=K/BdsAq56whhrj6bPhV+kJkcy4aNp2WSRRyulE+pYkYHsi96oApxg7BTXq7puEmPL7
         hy5OcordJ0JrGocSsdBvnmYZUk5/WYGVjJmp5RAKONW+NWalo8Noz9c91Y7+WdD2U1S6
         NCFIuXq4rLCobOK3Gr504qeP1TzFOA38ZFRIGyvN7pOjwB5psNWv2hgiRY6PP37DW/xB
         nOkZayLnkLc5scETtFcyUVGIF159yIVK6Jmc7VC/DFZ5yYjTbWi06smGOg8q6jJtiyYg
         5aVXADaGVSvIYaQUJyi3JOCUE75W9OZlhDDNGpMi+c0HPrd/D2/aKIWbNvuCvNNFdV6j
         hIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Yt62NiecCdV5bCndAIPH9PMyIUX3h3cE3F9d5aI9/eA=;
        b=F9f/rEe3MQIM8UtRXD5jDfJ1UKRYT3ircE7cnuy5n469//Y70hwThMUp65lEv5iCMv
         Hfg5vOB/1NToqM/Eijc5+Q0owbNtIFYo6d6MBQzBWmxbdA3qkw5MsUbCyB08ulHWm1P5
         y87oNHhR10aFDt/+WYk9F3Ya741GijtFYyrklKJNd4P/5MSTEJ9Oy4DGCaXHniMnFvo6
         VJBZH6BI2JQ3I5W0xdILIVCG6dg/Ay5OGiBjXL0L51Y/agMBl58GOKz7qWozj6ESLx3B
         EQ106td/2xAVKK3pibZghp8FTJ+jTeRiblDbxaVpINHbbDNHpZhV5/h0zC13j/BnzfOd
         6GCw==
X-Gm-Message-State: APjAAAUYygpQf6/VlxWtedatKAgVdqQFGSNlRa0d3NSB52j5eMawLXxY
        jXGX8ALj9AY0OI3Pg5C5y/iV5FZV3sM=
X-Google-Smtp-Source: APXvYqxHPKTDkFklE2NHIbQU48hboGvRsG1l3A5E2ksHevQk8ulUPYgu9ExBYVt8MDH/KZgJ+vJJ6w==
X-Received: by 2002:a02:9988:: with SMTP id a8mr13702493jal.127.1565996299419;
        Fri, 16 Aug 2019 15:58:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id s10sm8662194iod.46.2019.08.16.15.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 15:58:17 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo-som: Remove twl_keypad
Date:   Fri, 16 Aug 2019 17:58:12 -0500
Message-Id: <20190816225812.14301-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The TWL4030 used on the Logit PD Torpedo SOM does not have the
keypad pins routed.  This patch disables the twl_keypad driver
to remove some splat during boot:

[    5.902221] twl4030_keypad 48070000.i2c:twl@48:keypad: missing or malformed property linux,keymap: -22
[    5.911773] twl4030_keypad 48070000.i2c:twl@48:keypad: Failed to build keymap
[    5.918975] twl4030_keypad: probe of 48070000.i2c:twl@48:keypad failed with error -22

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
index 3fdd0a72f87f..506b118e511a 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
@@ -192,3 +192,7 @@
 &twl_gpio {
 	ti,use-leds;
 };
+
+&twl_keypad {
+	status = "disabled";
+};
-- 
2.17.1

