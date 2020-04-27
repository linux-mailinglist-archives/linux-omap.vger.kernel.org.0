Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B001BB209
	for <lists+linux-omap@lfdr.de>; Tue, 28 Apr 2020 01:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgD0Xag (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Apr 2020 19:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726261AbgD0Xag (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Apr 2020 19:30:36 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E50C03C1A8
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 16:30:36 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id o135so7610835qke.6
        for <linux-omap@vger.kernel.org>; Mon, 27 Apr 2020 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=quaCJQUXh16GBVFik8QA4Fip2ZkMv94tq1SIciD+mKk=;
        b=o8O64NcOpReFrdICIw0R22TmhsUrXmbrt0Oquifi1kyyFHcemcPC6lPBakxI7oUNZq
         I7jBqcLaHoph4I/bGwjn3uwtM6vuggTusUl58GAxe5waPDXDah/g/IYbbsYFVMyOYapE
         xm/qUjg5KrYezq1T1+bryli0DAr3cgEWoapxeB3pDr5RsZOvuLE5fHI7yilkKPePGznk
         c1k+PHdKAx/VWQbhHbfX2gJA2NXyOYciXI8KGCyw4cxm1hM15Rhyxy7q72pkFCYdXDWk
         N8xX6/gYf2fFs7oNVE9x7OUWuiFd7NEMdvQ4EaNulCgqDIpIPsdEK2I1Io33CTLg9DYi
         cp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=quaCJQUXh16GBVFik8QA4Fip2ZkMv94tq1SIciD+mKk=;
        b=Rm3o1xGK/8zuyGsJu/Cu/oG818KRUyLQri/wjwLxldrl0s1bFXnSQml1ou0x7McjRQ
         FXWWMV/Gsj/yFG1MTc8R3TVWH5kP8iyclAKYwyB5mKi7uKTIFBDe75ctPlMxNIXaR2pt
         FcKFOGXDvMszW9vSmvyAMhEysioQmZLPgzXzJThMeFW/0bxSJv3R5tJANui7mvx5B1R6
         +W+J94jf4fDWeRunU3l6uPdiwGC5uj65jEzRt8rjZmLsB9Vod1YiBH5BoARt0MFofJhg
         oV+V9ox4bA5E45CcnOOBKieTziE01MOHSHnDqYjgda0kTOL5JKNhjcX9r1KiONGtzBfu
         TRhA==
X-Gm-Message-State: AGi0PuZ2zStgZv4zX7w+JRVv20Hm1+SVbz3iW4jPMLL/Zl9HoHn8dejk
        Wh/R5KuMYwnhD9qjyvbR+HgjPw==
X-Google-Smtp-Source: APiQypKQhsXJYAUPGeCAiGNzkd/+nPRyT2PYJttcnGCPjzLZOweUizR2QmY1YuuQpy+d1hOiuVGD1A==
X-Received: by 2002:a37:4f45:: with SMTP id d66mr24593051qkb.318.1588030235080;
        Mon, 27 Apr 2020 16:30:35 -0700 (PDT)
Received: from x1 (ip-48-2-52-196.nyc.us.northamericancoax.com. [196.52.2.48])
        by smtp.gmail.com with ESMTPSA id h6sm11956233qtd.79.2020.04.27.16.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 16:30:34 -0700 (PDT)
Date:   Tue, 28 Apr 2020 01:31:16 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: [PATCH] arm: dts: am33xx-l4: add gpio-line-names to gpio controllers
Message-ID: <20200427233116.GA18917@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add gpio-line-names properties to the gpio controller nodes.  The names
correspond to the AM335x pin names which are also the muxmode 0 signal
names.  Refer to "Table 4-2. Pin Attributes" in the TI AM335x Sitara 
Processors datasheet:

http://www.ti.com/lit/ds/symlink/am3358.pdf


Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 134 +++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 5ed7f3c58c0f..1ac574ebfe74 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -157,6 +157,39 @@
 				#interrupt-cells = <2>;
 				reg = <0x0 0x1000>;
 				interrupts = <96>;
+				gpio-line-names =
+					"MDIO_DATA",
+					"MDIO_CLK",
+					"SPI0_SCLK",
+					"SPI0_D0",
+					"SPI0_D1",
+					"SPI0_CS0",
+					"SPI0_CS1",
+					"ECAP0_IN_PWM0_OUT",
+					"LCD_DATA12",
+					"LCD_DATA13",
+					"LCD_DATA14",
+					"LCD_DATA15",
+					"UART1_CTSN",
+					"UART1_RTSN",
+					"UART1_RXD",
+					"UART1_TXD",
+					"GMII1_TXD3",
+					"GMII1_TXD2",
+					"USB0_DRVVBUS",
+					"XDMA_EVENT_INTR0",
+					"XDMA_EVENT_INTR1",
+					"GMII1_TXD1",
+					"GPMC_AD8",
+					"GPMC_AD9",
+					"NC",
+					"NC",
+					"GPMC_AD10",
+					"GPMC_AD11",
+					"GMII1_TXD0",
+					"RMII1_REFCLK",
+					"GPMC_WAIT0",
+					"GPMC_WPN";
 			};
 		};
 
@@ -1304,6 +1337,39 @@
 				#interrupt-cells = <2>;
 				reg = <0x0 0x1000>;
 				interrupts = <98>;
+				gpio-line-names =
+					"GPMC_AD0",
+					"GPMC_AD1",
+					"GPMC_AD2",
+					"GPMC_AD3",
+					"GPMC_AD4",
+					"GPMC_AD5",
+					"GPMC_AD6",
+					"GPMC_AD7",
+					"UART0_CTSN",
+					"UART0_RTSN",
+					"UART0_RXD",
+					"UART0_TXD",
+					"GPMC_AD12",
+					"GPMC_AD13",
+					"GPMC_AD14",
+					"GPMC_AD15",
+					"GPMC_A0",
+					"GPMC_A1",
+					"GPMC_A2",
+					"GPMC_A3",
+					"GPMC_A4",
+					"GPMC_A5",
+					"GPMC_A6",
+					"GPMC_A7",
+					"GPMC_A8",
+					"GPMC_A9",
+					"GPMC_A10",
+					"GPMC_A11",
+					"GPMC_BE1N",
+					"GPMC_CSN0",
+					"GPMC_CSN1",
+					"GPMC_CSN2";
 			};
 		};
 
@@ -1706,6 +1772,40 @@
 				#interrupt-cells = <2>;
 				reg = <0x0 0x1000>;
 				interrupts = <32>;
+				gpio-line-names =
+					"GPMC_CSN3",
+					"GPMC_CLK",
+					"GPMC_ADVN_ALE",
+					"GPMC_OEN_REN",
+					"GPMC_WEN",
+					"GPMC_BE0N_CLE",
+					"LCD_DATA0",
+					"LCD_DATA1",
+					"LCD_DATA2",
+					"LCD_DATA3",
+					"LCD_DATA4",
+					"LCD_DATA5",
+					"LCD_DATA6",
+					"LCD_DATA7",
+					"LCD_DATA8",
+					"LCD_DATA9",
+					"LCD_DATA10",
+					"LCD_DATA11",
+					"GMII1_RXD3",
+					"GMII1_RXD2",
+					"GMII1_RXD1",
+					"GMII1_RXD0",
+					"LCD_VSYNC",
+					"LCD_HSYNC",
+					"LCD_PCLK",
+					"LCD_AC_BIAS_EN",
+					"MMC0_DAT3",
+					"MMC0_DAT2",
+					"MMC0_DAT1",
+					"MMC0_DAT0",
+					"MMC0_CLK",
+					"MMC0_CMD";
+
 			};
 		};
 
@@ -1739,6 +1839,40 @@
 				#interrupt-cells = <2>;
 				reg = <0x0 0x1000>;
 				interrupts = <62>;
+				gpio-line-names =
+					"GMII1_COL",
+					"GMII1_CRS",
+					"GMII1_RXER",
+					"GMII1_TXEN",
+					"GMII1_RXDV",
+					"I2C0_SDA",
+					"I2C0_SCL",
+					"EMU0",
+					"EMU1",
+					"GMII1_TXCLK",
+					"GMII1_RXCLK",
+					"NC",
+					"NC",
+					"USB1_DRVVBUS",
+					"MCASP0_ACLKX",
+					"MCASP0_FSX",
+					"MCASP0_AXR0",
+					"MCASP0_AHCLKR",
+					"MCASP0_ACLKR",
+					"MCASP0_FSR",
+					"MCASP0_AXR1",
+					"MCASP0_AHCLKX",
+					"NC",
+					"NC",
+					"NC",
+					"NC",
+					"NC",
+					"NC",
+					"NC",
+					"NC",
+					"NC",
+					"NC";
+
 			};
 		};
 
-- 
2.20.1

