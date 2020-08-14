Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D22449FE
	for <lists+linux-omap@lfdr.de>; Fri, 14 Aug 2020 14:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgHNMxq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Aug 2020 08:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgHNMxq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Aug 2020 08:53:46 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E412BC061384;
        Fri, 14 Aug 2020 05:53:45 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k23so10586043iom.10;
        Fri, 14 Aug 2020 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Rxr2HOJk0RRDA2bOpilICbe69ukX1fuRKFSU2tquDY=;
        b=s0qDed3uTBLS4odQuLtuuh+t8K5AWMi/mAMpAn/B5PeEjlvmrSCLCkJ6ExwisRILLU
         7tT9mFwbrKiJF0i0uA8sbX5feTgMpCHemcs9JQ7+gRf7M6g3Pr/49BxcRKwICQsYgAKZ
         hfoAWr65skbQpob2Uy8e7pAvstUsuNLbchRLZHk1cKfs9O/tRLE7xVVj6LwitMUAxwEK
         C/4Q5G62XzqUZBa4dM35UusZufVZBeahMbtPtovXt2snazXl9vhbhJUndr9dVc/4MXkC
         2Floc1JE61RI3kUcHDo3M7vKPyR6ng3nHfPvE+wOEqz0h0hX26po2VrsCuJ6mo2K10XO
         Blcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Rxr2HOJk0RRDA2bOpilICbe69ukX1fuRKFSU2tquDY=;
        b=aLmXmNXwb7pZ2zDsUrSDJwtPFj+CRLFSMgZO45d2+WmNbSm5uHntefDtlONBORNRkv
         hYlituS4lty8tS3Fdo0upsGQo6bWw48wYSZEqwbtvhG6ZSvBjBqX91u3A9QioQ4lRDOK
         OgZQLjoYg3mzFM5ALUo0bI257L8+WLGtUxXVme3Zn9zGUfx7rfahu6o+59Yi6mK11v+J
         yTb9gTyEqn7IbUoaxrqrb3Dqr1J5kNQHG1fNl3qIk6U9ZnML9YFqHLSA5GVrFZnq5vxL
         TBlfDukeGOfi8ZgS+IIHYa2BvVSdta4iBHgHqyJlVWwvYBFUxrGKas1th3GO/Gs1V+W+
         xoag==
X-Gm-Message-State: AOAM531nJqS3LLpGwulz2lDswmkvBqj9EjG26cQyuho7hB6NvkLodurP
        OTrqsJ3pw0AbdWkfC3CN6d2aCx0wraNZEA==
X-Google-Smtp-Source: ABdhPJxn6SfKpF4YZCV4SR0ky34lRBEFE4/R5fTuf+UcUTdeqjiAxdAkHk5jWuJPvML/LtYCLTVLyA==
X-Received: by 2002:a5d:9d8a:: with SMTP id 10mr2123198ion.195.1597409624729;
        Fri, 14 Aug 2020 05:53:44 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:7d86:99d6:a568:98e8])
        by smtp.gmail.com with ESMTPSA id u25sm4142216iob.51.2020.08.14.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 05:53:44 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: logicpd-som-lv-baseboard: Fix broken audio
Date:   Fri, 14 Aug 2020 07:53:38 -0500
Message-Id: <20200814125338.2428209-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Older versions of U-Boot would pinmux the whole board, but as
the bootloader got updated, it started to only pinmux the pins
it needed, and expected Linux to configure what it needed.

Unfortunately this caused an issue with the audio, because the
mcbsp2 pins were configured in the device tree but never
referenced by the driver. When U-Boot stopped muxing the audio
pins, the audio died.

This patch adds the references to the associate the pin controller
with the mcbsp2 driver which makes audio operate again.

Fixes: 5cb8b0fa55a9 ("ARM: dts: Move most of logicpd-som-lv-37xx-devkit.dts to logicpd-som-lv-baseboard.dtsi")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
index 79e9e24328b9..395e05f10d36 100644
--- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
@@ -51,6 +51,8 @@
 
 &mcbsp2 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcbsp2_pins>;
 };
 
 &charger {
-- 
2.25.1

