Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61DC4D18AB
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 21:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbfJITVK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 15:21:10 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41340 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731750AbfJITVJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 15:21:09 -0400
Received: by mail-io1-f67.google.com with SMTP id n26so7619954ioj.8
        for <linux-omap@vger.kernel.org>; Wed, 09 Oct 2019 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WRLTOQxZcVgAWS4/iF3mt1JqORvWayZ30w3FnMsL3GA=;
        b=Hq8b7bkHVKaGEfHfxuKq4MBsCv6UTWfjPEl0TlHQymfUCDW7EC0G2xes+CuCAkuOgB
         vNQYhMnZAjzQoFP/lnP5XfE8TqI2SbZlY5QjkccPB5icxDwBUmvQOZjuIkDQv1HnZF7+
         Myz8eOl7t09ENFH/mI1BmA+T9xsJNSzeSf31xPpgM5SxD0S7AaUQ6JLWgiXMB29yxCX3
         2w6vdCofd8Jl7MRSi/B3IPv9sYsidYzuRmzkunGocqWe6hxgi5Nn0CsAo+6ttZyiMK/V
         FmIFhhPT0MxjQWu9pmYh9vaLt+cH5KqbzgqWVuUacRAFg7cqz50+iJNNmNfvERFpWIBi
         GlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WRLTOQxZcVgAWS4/iF3mt1JqORvWayZ30w3FnMsL3GA=;
        b=DS65yHSr7xmsnstXL4gsCh/WFNVeZYRyTcqyVDN/dQQ2I+ZGziAIY399rHltdfcppe
         xefow+7N4a/jmtamOTOMhXiPp7TrZTEB37Bf5W5h0HL349jKgPwe5CESCGQxZI3qDH19
         15XWu1mfC/OmlUAiMV5BmRg0I26k9ZC2BmmB213vvVza27C65PnHypBJ+MjQUt4HZfWc
         YpLjAdxtaiPItBtdLbSTZiYMHv7nDbfm4kXffAc+aA3bBm0WsEMf/PNrOhfCmy2MOZr1
         FZBQLNoLD6ai77fPUcMyt6SlV49JOPeUxfQnBdYTlgmdRlBI1kweOoTjoG7qy3E9iNv+
         A3fw==
X-Gm-Message-State: APjAAAVjxgQakBXUni1Nbn/EAEP7iPu4deOPVDr6hc0ccduO2hP6Hgjd
        1XHvAgkcX4GnmzLZhLX9U1kip3PZ
X-Google-Smtp-Source: APXvYqw2XLzr8NYYga3oP0H6o4Kyb6D/o7XtxRhYqpSY2Va3aPGAyJwFAPVjTCWvYjCoMjtBlayYEA==
X-Received: by 2002:a5d:9856:: with SMTP id p22mr5157304ios.29.1570648868813;
        Wed, 09 Oct 2019 12:21:08 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id r138sm1875665iod.59.2019.10.09.12.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 12:21:07 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, tony@atomide.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo: Disable Bluetooth Serial DMA
Date:   Wed,  9 Oct 2019 14:20:53 -0500
Message-Id: <20191009192053.30255-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The default serial driver for omap2plus is the 8250_omap driver.
Unfortunately, this driver does not yet appear to have fully
functional DMA on OMAP3630/DM3730 which causes some timeouts and
frame errors.

This patch removes the DMA entry from the device tree which allow
the UART to operate without Bluetooth frame errors. If/when DMA
is working on OMAP3630, this should be reverted.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
index c34ba0ef8b4d..79d56bc14e88 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
@@ -51,6 +51,7 @@
 };
 
 &uart2 {
+	/delete-property/dma-names;
 	bluetooth {
 		compatible = "ti,wl1283-st";
 		enable-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>; /* gpio 162 */
-- 
2.17.1

