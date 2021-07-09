Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCD93C2AFB
	for <lists+linux-omap@lfdr.de>; Fri,  9 Jul 2021 23:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbhGIVv3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Jul 2021 17:51:29 -0400
Received: from vern.gendns.com ([98.142.107.122]:32986 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230406AbhGIVv3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Jul 2021 17:51:29 -0400
X-Greylist: delayed 318 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Jul 2021 17:51:29 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=m32zTXa/LG8Zd+u71jVaC79OxQRSBRvFS6uyuE7XYfo=; b=b0Hnpb2X0Re17ckyNzq9cBKEVb
        2nnHpwQFIgH/6r+LtJ/atvp6e5vV635ED8gjH+HYN3cZPvTt6xhXla0Uv1SBA+suBErrKbfs1na3P
        2yrshxYd20tPBG5gLlacmxW8ZkYFjXPAK2XFzubhI1l3ED7z48bpCU0Wi8BGPR71Q+tcCfy3E4T/j
        xLw/lUVpgq1Oozy5TNfToKeL6Nw2ohYMY7ZupJiqdtA1Xgf3A4D/yWoUPqxeg5BEw21pIcs0dguqU
        PhtZA2rJDpEc0iwzU/MERG91bsc6R1Ji16mrISskqOaHR1qMZK/k/eNcwhXoBWjNignPoRXQ3vX8f
        +qMhK0qA==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:57892 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <david@lechnology.com>)
        id 1m1yMI-00CA0i-Fo; Fri, 09 Jul 2021 17:48:44 -0400
From:   David Lechner <david@lechnology.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     David Lechner <david@lechnology.com>,
        Drew Fustini <drew@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: am335x-boneblue: add gpio-line-names
Date:   Fri,  9 Jul 2021 16:47:06 -0500
Message-Id: <20210709214706.1583984-1-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds gpio-line-names to the BeagleBone Blue DTS. The line names
are based on the BeagleBone Blue rev A2 schematic.

Signed-off-by: David Lechner <david@lechnology.com>
---

v2 changes:
- fixed typo in EQEP numbering

 arch/arm/boot/dts/am335x-boneblue.dts | 143 +++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index 69acaf4ea0f3..90e8b7d63f79 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -435,12 +435,153 @@ &dcan1 {
 	status = "okay";
 };
 
+&gpio0 {
+	gpio-line-names =
+		"UART3_CTS", /* M17 */
+		"UART3_RTS", /* M18 */
+		"UART2_RX", /* A17 */
+		"UART2_TX", /* B17 */
+		"I2C1_SDA", /* B16 */
+		"I2C1_SCL", /* A16 */
+		"MMC0_CD", /* C15 */
+		"SPI1_SS2", /* C18 */
+		"EQEP_1A", /* V2 */
+		"EQEP_1B", /* V3 */
+		"MDIR_2B", /* V4 */
+		"BATT_LED_2", /* T5 */
+		"I2C2_SDA", /* D18 */
+		"I2C2_SCL", /* D17 */
+		"UART1_RX", /* D16 */
+		"UART1_TX", /* D15 */
+		"MMC2_DAT1", /* J18 */
+		"MMC2_DAT2", /* K15 */
+		"NC", /* F16 */
+		"WIFI_LED", /* A15 */
+		"MOT_STBY", /* D14 */
+		"WLAN_IRQ", /* K16 */
+		"PWM_2A", /* U10 */
+		"PWM_2B", /* T10 */
+		"",
+		"",
+		"BATT_LED_4", /* T11 */
+		"BATT_LED_1", /* U12 */
+		"BT_EN", /* K17 */
+		"SPI1_SS1", /* H18 */
+		"UART4_RX", /* T17 */
+		"MDIR_1B"; /* U17 */
+};
+
+&gpio1 {
+	gpio-line-names =
+		"MMC1_DAT0", /* U7 */
+		"MMC1_DAT1", /* V7 */
+		"MMC1_DAT2", /* R8 */
+		"MMC1_DAT3", /* T8 */
+		"MMC1_DAT4", /* U8 */
+		"MMC1_DAT5", /* V8 */
+		"MMC1_DAT6", /* R9 */
+		"MMC1_DAT7", /* T9 */
+		"DCAN1_TX", /* E18 */
+		"DCAN1_RX", /* E17 */
+		"UART0_RX", /* E15 */
+		"UART0_TX", /* E16 */
+		"EQEP_2A", /* T12 */
+		"EQEP_2B", /* R12 */
+		"PRU_E_A", /* V13 */
+		"PRU_E_B", /* U13 */
+		"MDIR_2A", /* R13 */
+		"GPIO1_17", /* V14 */
+		"PWM_1A", /* U14 */
+		"PWM_1B", /* T14 */
+		"EMMC_RST", /* R14 */
+		"USR_LED_0", /* V15 */
+		"USR_LED_1", /* U15 */
+		"USR_LED_2", /* T15 */
+		"USR_LED_3", /* V16 */
+		"GPIO1_25", /* U16 */
+		"MCASP0_AXR0", /* T16 */
+		"MCASP0_AXR1", /* V17 */
+		"MCASP0_ACLKR", /* U18 */
+		"BATT_LED_3", /* V6 */
+		"MMC1_CLK", /* U9 */
+		"MMC1_CMD"; /* V9 */
+};
+
+&gpio2 {
+	gpio-line-names =
+		"MDIR_1A", /* T13 */
+		"MCASP0_FSR", /* V12 */
+		"LED_RED", /* R7 */
+		"LED_GREEN", /* T7 */
+		"MODE_BTN", /* U6 */
+		"PAUSE_BTN", /* T6 */
+		"MDIR_4A", /* R1 */
+		"MDIR_4B", /* R2 */
+		"MDIR_3B", /* R3 */
+		"MDIR_3A", /* R4 */
+		"SVO7", /* T1 */
+		"SVO8", /* T2 */
+		"SVO5", /* T3 */
+		"SVO6", /* T4 */
+		"UART5_TX", /* U1 */
+		"UART5_RX", /* U2 */
+		"SERVO_EN", /* U3 */
+		"NC", /* U4 */
+		"UART3_RX", /* L17 */
+		"UART3_TX", /* L16 */
+		"MMC2_CLK", /* L15 */
+		"DCAN1_SILENT", /* M16 */
+		"SVO1", /* U5 */
+		"SVO3", /* R5 */
+		"SVO2", /* V5 */
+		"SVO4", /* R6 */
+		"MMC0_DAT3", /* F17 */
+		"MMC0_DAT2", /* F18 */
+		"MMC0_DAT1", /* G15 */
+		"MMC0_DAT0", /* G16 */
+		"MMC0_CLK", /* G17 */
+		"MMC0_CMD"; /* G18 */
+};
+
 &gpio3 {
+	gpio-line-names =
+		"MMC2_DAT3", /* H16 */
+		"GPIO3_1", /* H17 */
+		"GPIO3_2", /* J15 */
+		"MMC2_CMD", /* J16 */
+		"MMC2_DAT0", /* J17 */
+		"I2C0_SDA", /* C17 */
+		"I2C0_SCL", /* C16 */
+		"EMU1", /* C14 */
+		"EMU0", /* B14 */
+		"WL_EN", /* K18 */
+		"WL_BT_OE", /* L18 */
+		"",
+		"",
+		"NC", /* F15 */
+		"SPI1_SCK", /* A13 */
+		"SPI1_MISO", /* B13 */
+		"SPI1_MOSI", /* D12 */
+		"GPIO3_17", /* C12 */
+		"EQEP_0A", /* B12 */
+		"EQEP_0B", /* C13 */
+		"GPIO3_20", /* D13 */
+		"IMU_INT", /* A14 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+
 	ls_buf_en {
 		gpio-hog;
 		gpios = <10 GPIO_ACTIVE_HIGH>;
 		output-high;
-		line-name = "LS_BUF_EN";
 	};
 };
 
-- 
2.25.1

