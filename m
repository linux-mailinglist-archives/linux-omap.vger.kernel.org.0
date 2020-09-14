Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C97268981
	for <lists+linux-omap@lfdr.de>; Mon, 14 Sep 2020 12:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgINKo5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Sep 2020 06:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgINKog (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Sep 2020 06:44:36 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA20C06178B
        for <linux-omap@vger.kernel.org>; Mon, 14 Sep 2020 03:44:34 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id lo4so22488593ejb.8
        for <linux-omap@vger.kernel.org>; Mon, 14 Sep 2020 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ksDS/ZprWsM/0QY6vDk6D5ENK3u7hxsyWBog/lq82xg=;
        b=r6u0Kq1U+z4ibfxJn9vuQomsoyfFdoh4newYhdS96ksp3m5DtiEXlaZSjofGGgjU+U
         AJnqp8H0IqrFGnSYEicxkDidcXkF8B4/As3gz4QZEFqp7trP0ImdWZAn4sneWInh5Moz
         ZoFJWLOOWNyJS1caKOYLUhMRUi1861fXnBmgYxwYWyvfOubXaknfDaZBDX+gxzkkoXGd
         QBCS+wBTxihjhOVtG7X359tS8kD/uBXtx2nr6O8Y3fcq/sTWx0a4d5PaI+IxocHpijKw
         6ub0bvn+XRqLiy7NYGUkwpC4blpsxU5aOENBcR0tV9V2hAU5ePBEakoklct+8r+EOAS4
         lj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ksDS/ZprWsM/0QY6vDk6D5ENK3u7hxsyWBog/lq82xg=;
        b=e4RK1JbhfzsHw3ADmELSN6c5eTdti7jKjBUE/lzRJeXZHm9HwE7T/I1coE1pgRGRex
         USz1I+U7cXRdLGK34gPrIVjErVV0AsLBBypidgz00BxdacHmTk2dzMYgqC+SWtOTNr5D
         a7rn+mGOUCm+J2py28S9TWgeccq8LSe+x8fX2pR6o3CAp55Skmm/G75DKA2tnu2YArzW
         Ld7lxOqNsyd1Ohl3PbjSE/q6WAVsq02SVPjkIg5fCpOSz/i4cK9JjFusTD5dltR97fq3
         6E3PCN3yxztsOWCO3gytmnS5WKPPyn9Ey9c6U8xlIhOKPX+MdiZh4+Fnz8ttvAn9zAI6
         TvPg==
X-Gm-Message-State: AOAM532v47coEDvrsZVpqfOUK/h4ciu7FPxDNJ2HB0WfbDw47HJ4Wigh
        OLc6XD4tNJa2yT9wEYd6pPyDKg==
X-Google-Smtp-Source: ABdhPJwZ8tbILc/cvjqT+PhcvmB4wl2sDoh9mhUSM6kpiEZeeojODCE0Nxkw1zXb0EN89cVEl8bM8w==
X-Received: by 2002:a17:906:9245:: with SMTP id c5mr14732267ejx.54.1600080273490;
        Mon, 14 Sep 2020 03:44:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c7c:3a01:5f2:8f03:4748:2bc6])
        by smtp.gmail.com with ESMTPSA id i26sm8914247edq.47.2020.09.14.03.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 03:44:32 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH] ARM: dts: document pinctrl-single,pins when #pinctrl-cells = 2
Date:   Mon, 14 Sep 2020 12:43:53 +0200
Message-Id: <20200914104352.2165818-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Document the values in pinctrl-single,pins when #pinctrl-cells = <2>

Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
Reported-by: Trent Piepho <tpiepho@gmail.com>
Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 .../bindings/pinctrl/pinctrl-single.txt       | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
index ba428d345a56..ef560afdd52e 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
@@ -96,16 +96,22 @@ pinctrl-single,bit-per-mux is set), and uses the common pinctrl bindings as
 specified in the pinctrl-bindings.txt document in this directory.
 
 The pin configuration nodes for pinctrl-single are specified as pinctrl
-register offset and value pairs using pinctrl-single,pins. Only the bits
-specified in pinctrl-single,function-mask are updated. For example, setting
-a pin for a device could be done with:
+register offset and values using pinctrl-single,pins. Only the bits specified
+in pinctrl-single,function-mask are updated.
+
+When #pinctrl-cells = 1, then setting a pin for a device could be done with:
 
 	pinctrl-single,pins = <0xdc 0x118>;
 
-Where 0xdc is the offset from the pinctrl register base address for the
-device pinctrl register, and 0x118 contains the desired value of the
-pinctrl register. See the device example and static board pins example
-below for more information.
+Where 0xdc is the offset from the pinctrl register base address for the device
+pinctrl register, and 0x118 contains the desired value of the pinctrl register.
+
+When #pinctrl-cells = 2, then setting a pin for a device could be done with:
+
+	pinctrl-single,pins = <0xdc 0x30 0x07>;
+
+Where 0x30 is the pin configuration value and 0x07 is the pin mux mode value.
+See the device example and static board pins example below for more information.
 
 In case when one register changes more than one pin's mux the
 pinctrl-single,bits need to be used which takes three parameters:
-- 
2.25.1

