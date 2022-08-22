Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203B659C352
	for <lists+linux-omap@lfdr.de>; Mon, 22 Aug 2022 17:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbiHVPrU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Aug 2022 11:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236932AbiHVPrA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Aug 2022 11:47:00 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E32B5F46
        for <linux-omap@vger.kernel.org>; Mon, 22 Aug 2022 08:46:57 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e20so13256240wri.13
        for <linux-omap@vger.kernel.org>; Mon, 22 Aug 2022 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tfqpqMol0fOshQPqi7p3kM/k+o7Lcyt3OtfrczXMkYg=;
        b=V1r+aWY/iNe5S7bx32+YdR6Fk7ASNl8xG/wxgWYxwlFTVI45z3zwiGleXAvonTQQjQ
         nfRIjEOAu6u2JcLWTuVtx/LdDQIZIXIlPi3PHdNn8VsPp/SukBIDubdcbF5YekMwmlcX
         QWyTX0GYo8PvFMhqCxC/9Es2vc0ndkiapbzJ5CQznS0GonEagArZI1hUTpOZ6cMg76AI
         9HnvA07s5/s6POQ8NXaZoayWroB243S9czk1WwxNWTW6XY0P5P3PyoWbwYGPuioKS9PL
         uYTqZYyoUcdLP8yt78WwnJXy6R3a9N62wMFkppyGVVLayM18xIS3PMYpIfWHh1f5KRgL
         k7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tfqpqMol0fOshQPqi7p3kM/k+o7Lcyt3OtfrczXMkYg=;
        b=bDRdjuhB5mWvf7RbqN6R5bchlD0E4Hmo7DZoxu/QwepUJVzF6X4MTxUx4tnn3r7bM3
         CVEzYemspLLgoDQ/jWq/9PknOkiOWWcktJdegXs235LDkpzg0iBEAlvtGhjpkIdqfPnj
         h6wKDVNNk4EM+0Nz0hTr4r2zKiAjcOunCPEOhBeDEf5Bey+tkIO9vXdL0UlKoSdEAjCu
         3zwGANY45CYF8LG7UKxyuVp1iBQmGrThn1rhThGIta/M3GuKtiYIELSyu0XeYunoH30h
         WhO9yEmK3/zMzAxgIHf8TeMikXfkrt6oQLos8euxat+pYwa73ZSsuGc451AxamkiY62t
         kz1Q==
X-Gm-Message-State: ACgBeo3FSz7tt8nCXbIc8YJQdH8Sibl5YxzrnhA3fgQnXnjYZUA6oBP9
        lV+YwLDKj/M54+Lk9ZyV7xzG2TeMY+GvaA==
X-Google-Smtp-Source: AA6agR562TDsmm99MxZFLAru6SU8lGDvvYhr8FtxFKCT1zLV95rzngLgalzI+lM9cNddWb/k3ESdlw==
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id y14-20020a056000168e00b0022087dac3e4mr10951777wrd.559.1661183216037;
        Mon, 22 Aug 2022 08:46:56 -0700 (PDT)
Received: from P-NTS-Evian.home (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id t14-20020adfe10e000000b0021e8d205705sm7093634wrz.51.2022.08.22.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:46:55 -0700 (PDT)
From:   Romain Naour <romain.naour@smile.fr>
To:     linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, bcousson@baylibre.com,
        tony@atomide.com, Romain Naour <romain.naour@skf.com>,
        Romain Naour <romain.naour@smile.fr>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH] ARM: dts: am5748: keep usb4_tm disabled
Date:   Mon, 22 Aug 2022 17:46:25 +0200
Message-Id: <20220822154625.52160-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Romain Naour <romain.naour@skf.com>

From [1]
AM5 and DRA7 SoC families have different set of modules in them so the
SoC sepecific dtsi files need to be separated.

e.g. Some of the major differences between AM576 and DRA76

		DRA76x	AM576x

USB3		x
USB4		x
ATL		x
VCP		x
MLB		x
ISS		x
PRU-ICSS1		x
PRU-ICSS2		x

But commit [2] removed usb4_tm part from am5748.dtsi and introcuded new
ti-sysc errors in dmesg.

Fixes:
ti-sysc 48940000.target-module: clock get error for fck: -2
ti-sysc: probe of 48940000.target-module failed with error -2

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=bcbb63b80284af0061ac44fe944d31a8482d2b8a
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=176f26bcd41a0ee8c69b14e97d1edf50e6485d52

Signed-off-by: Romain Naour <romain.naour@skf.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Roger Quadros <rogerq@ti.com>
---
Issue reproduced on a AM5749 CPU using a 5.10 kernel from ti-linux-kernel:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=linux-5.10.y
---
 arch/arm/boot/dts/am5748.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am5748.dtsi b/arch/arm/boot/dts/am5748.dtsi
index c260aa1a85bd..a1f029e9d1f3 100644
--- a/arch/arm/boot/dts/am5748.dtsi
+++ b/arch/arm/boot/dts/am5748.dtsi
@@ -25,6 +25,10 @@ &usb3_tm {
 	status = "disabled";
 };
 
+&usb4_tm {
+	status = "disabled";
+};
+
 &atl_tm {
 	status = "disabled";
 };
-- 
2.34.3

