Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C38B23FC41
	for <lists+linux-omap@lfdr.de>; Sun,  9 Aug 2020 04:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgHIC4X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Aug 2020 22:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgHIC4W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Aug 2020 22:56:22 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA7E9C061756
        for <linux-omap@vger.kernel.org>; Sat,  8 Aug 2020 19:56:22 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id k23so5631391iom.10
        for <linux-omap@vger.kernel.org>; Sat, 08 Aug 2020 19:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HU/pcMMindzrxEpST39WTzu3VASe/9ZlPBC9IlaYVsI=;
        b=KvuhmOoQj/vmzBckDEfiS6lxs56cMPw2qCaat/b6dscbHPt1vRyxXLrdE/ui7nWveE
         XpCdPWF1G2KPlWacTAmuwTPxX4jiYtwdKlsH7kCJ0thJZdFP2r/g5nnifC9ytI42GdlF
         7wU2J7c+AjJ4m6jrm6zx5NAkAbxc0e8+iVvRzyKxHcNVsxrNsGKOYEbrIcybbcT6iJA+
         kwcaDFzUxoBmURsEebQ7cKoaVPjVslh7Ft5XPMMdJO5jrsc9kRsULuq7BZpUOYil1Ssv
         kMzXFsQdQY1XO1Uw/1jI6b0u1IWdiESvJ7lbt1yz52IH/3US0hTOyRDloT+72ByL0cHW
         tJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HU/pcMMindzrxEpST39WTzu3VASe/9ZlPBC9IlaYVsI=;
        b=WZ8zKfGApQeIvla9vwdn3JavM5Y37L82CMfo3AD3Ruv9sBthu7DWGnHwELWWjn0cFI
         l6AZcSFRqJwx8ditTBJIhWcGaryAGGvqQaOBGeUZTUTxZS73/zgr8cJ8mgNe1KtgaS7+
         HvlwA8f0lDV8EBjiUMKUrwL1xy1XGU0U5AMeuBzIyQyA9ZM2eylo0itkAWSGzRmKZWOx
         cl15u4Am4V8PZMDOMkwZh9Z+jmrjeX4b3vs+wU4EQRiJlIKjdLxEfOFW5fs2vSvS2b4v
         dNWk1ELo9TRnPx7IHlrHvBq+vv2OL4tSI0zbWXk2cJcmKanv//EYapCNs3oDc3MfW+1i
         MDkw==
X-Gm-Message-State: AOAM530S6kK4Wqhg2guw4tzFlfa3SqWwMoVDvt5yfWAjS9+XvYEnKhmS
        W7Sj9r11z+C1lFdHNxMQGAHZOcQQVRQ=
X-Google-Smtp-Source: ABdhPJzBdR39jCZjAUSU6odVL1XYX58ItmQ7NLX72AMnVCyMmSWBrinUNRqymsfTQhC6trmMuJkW1g==
X-Received: by 2002:a6b:3e04:: with SMTP id l4mr11547405ioa.206.1596941781704;
        Sat, 08 Aug 2020 19:56:21 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id n3sm660977ilj.29.2020.08.08.19.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 19:56:20 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo-baseboard: Fix broken audio
Date:   Sat,  8 Aug 2020 21:56:10 -0500
Message-Id: <20200809025610.3104837-1-aford173@gmail.com>
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
mcbsp2 pins were configured in the device tree, they were never
referenced by the driver. When U-Boot stopped muxing the audio
pins, the audio died.

This patch adds the references to the associate the pin controller
with the mcbsp2 driver which makes audio operate again.

Fixes: 739f85bba5ab ("ARM: dts: Move most of logicpd-torpedo-37xx-devkit to logicpd-torpedo-baseboard")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 381f0e82bb70..b0f6613e6d54 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -81,6 +81,8 @@ &vaux4 {
 };
 
 &mcbsp2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcbsp2_pins>;
 	status = "okay";
 };
 
-- 
2.25.1

