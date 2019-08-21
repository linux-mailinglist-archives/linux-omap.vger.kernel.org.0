Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065C097A00
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 14:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfHUMzZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 08:55:25 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:44713 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbfHUMzY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 08:55:24 -0400
Received: by mail-io1-f67.google.com with SMTP id j4so4201250iop.11
        for <linux-omap@vger.kernel.org>; Wed, 21 Aug 2019 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPe7wfADdMmz14DZvwS8+6qocgfl/WaupSt97XFdV/8=;
        b=cj2OIo29DkKdiiyJyP5GVJkDO8xefcmuxezAzEhP0ItomozaIjwksCGYeWRLeJ5LgT
         Hhio7JKs+zkzWSV/or2WrGygxU7C0KjpltYPccuDNavC79aLshabt1j3GiH3UCG69gaY
         tQTXS5WpnlSSKsAbbuqfUPi9Y4ltARshc9Ud75Qb6bKw28AhA1lTAHg0nuQWibOD7vJx
         46Xfu+CEirGrsGn8L7WafYqEZe+bLuR+P+V3QDmeDtwYQPRfE3mYaG80kOACVMPQuz9N
         Y6AFsrioh8JD7E/rsWCU277s2DfTL+yHdf1kW51YtOfivo1Fa+5PBu8D3PG8CA4a7zzX
         C8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zPe7wfADdMmz14DZvwS8+6qocgfl/WaupSt97XFdV/8=;
        b=ksN6iJOnjPuJRhgp4gsuzH+6ea9jmvGl8HYGFhPstyAVUT+LQblzOPeEYjVWgTM8d4
         EsavYqevAl6ehkLgLZuwG3aqD5JLWm9hI3paNXjGpB1VxwHfs9/AIBvXbcCXh59NFVL/
         lLOo1cgahD5OViliVD421V+2CyHQQFgE1rLzFtuZtaJpxyGqB5G0jSsb+youlNx7op8f
         0C1JJLCPBo0kbvYafS68/XWDkLEE2r8UMCNlrlEib8WlOA+5lepCBv7VqUJG6LO6LmLP
         c2kFDOyjpOdsd5fEjU0Nt96okZaYcOoAz+5aOUtY8KQ3VCKgG+9AIN0s89vZHd97eq7+
         W/VQ==
X-Gm-Message-State: APjAAAUa3KI06fQIYfsYHcmQcwXBoGb+P16MbrJZ48ZJUAc5rO1sBbrV
        qwMvZQxFbmvGgoCGZqspIo2Hrby+mjw=
X-Google-Smtp-Source: APXvYqwuxvlDKh0b27HMjLvUWJg91bXt06giWq0WHIqgeSQ6UW77Fq/5LByv17XKnWm92xzfqP4PMA==
X-Received: by 2002:a6b:c9c2:: with SMTP id z185mr12258739iof.17.1566392123309;
        Wed, 21 Aug 2019 05:55:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id i3sm17418026ion.9.2019.08.21.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:55:22 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, tony@atomide.com,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: dts: Configure rstctrl reset for SGX on AM3517
Date:   Wed, 21 Aug 2019 07:55:02 -0500
Message-Id: <20190821125502.32187-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Based on Tony Lindgren's work for omap34xx, this patch applies the same
functionality to the AM3517.

The following can be tested via sysfs with the following to ensure the SGX
module gets enabled and disabled properly:

0x00010201

Bus error

Note that this patch depends on the PRM rstctrl driver that has
been recently posted. If the child device driver(s) need to prevent
rstctrl reset on PM runtime suspend, the drivers need to increase
the usecount for the shared rstctrl reset that can be mapped also
for the child device(s) or accessed via dev->parent.

Cc: Filip Matijević <filip.matijevic.pz@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: moaz korena <moaz@korena.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philipp Rossak <embed3d@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index 23ea381d363f..bf3002009b00 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -88,6 +88,30 @@
 			interrupts = <24>;
 			clocks = <&hecc_ck>;
 		};
+
+		/*
+		 * On am3517 the OCP registers do not seem to be accessible
+		 * similar to the omap34xx. Maybe SGX is permanently set to
+		 * "OCP bypass mode", or maybe there is OCP_SYSCONFIG that is
+		 * write-only at 0x50000e10. We detect SGX based on the SGX
+		 * revision register instead of the unreadable OCP revision
+		 * register.
+		 */
+		sgx_module: target-module@50000000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x50000014 0x4>;
+			reg-names = "rev";
+			clocks = <&sgx_fck>, <&sgx_ick>;
+			clock-names = "fck", "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50000000 0x4000>;
+
+			/*
+			 * Closed source PowerVR driver, no child device
+			 * binding or driver in mainline
+			 */
+		};
 	};
 };
 
-- 
2.17.1

