Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D6DF937
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2019 14:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfD3Mrz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Apr 2019 08:47:55 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37406 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfD3Mrz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Apr 2019 08:47:55 -0400
Received: by mail-it1-f195.google.com with SMTP id r85so4484186itc.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2019 05:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dtls0qIaFVOJY4443eSxeMpTBwWF/L6mgrEa0OcpqD8=;
        b=oJA/8/5F3LwUkUBiMiFkd2TpqtsSJ6uk+AxQB9HQRKn3IAOwOEm3Et4bQg8GCW+X0+
         IhHFjxPBxTq3PVYxTCc9gXtvoZJQoAOOELYbqicnVY6locMzHkiCAStCpN1MCZuivfgP
         otWuaA1rhKybSpRZEWBiRse5UxufQ8jlWYSMmlmUo0fkrooOXvh1wiJAmVKYh/PTvbp8
         xwu0B/zJn18XU6j27owU75bJEszJnTDsMSH/3QwOFG0XtyNCoXFJjkmXou4pPB1iFr1A
         4L+OEPauwxPGQmlZWNWUqtHWDqdso3H0QUQWqMjyGzIGVY61MSv4/wRcyWTUEG1d/yY+
         njzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dtls0qIaFVOJY4443eSxeMpTBwWF/L6mgrEa0OcpqD8=;
        b=TI3zV6qgRdozwgQpOaud2QhWu9meoPalXjYJtid+2h4tPrRJ0J5Bo+UQPl4RfUjSya
         jpxxQg73BULEVVPDwvB0xJQLeAiA+zbFnB6KycgofeDeE8rdA4SwT1QNONjtrDc/gwI4
         Yi3HaWldZv7XrKx7AiYiD3vzlQ24zy71xHG/cIfnmmU7xtxPz5D2T4sxqCadZLVLArmH
         cEuH5YRMAcI0PHBRuuWdy6WBvx7vydulWaOwyYXjG0NDUNy1Cbvp/dtsTCeFs3vTtUXp
         SJuLtdjPfP2oA3s8kMRk+jvbbvLdIW1BS1D6zerxgGjSCP9myNld5/hCYU8W1KL0ZOF5
         7nVw==
X-Gm-Message-State: APjAAAXPHY9Kx00eiU4EfNCWxXEJmHHjQawYN1nOFVi1ba/80E3Cs4XZ
        PtZE5hAVWWdd65tjxpdE8syGs1MV
X-Google-Smtp-Source: APXvYqw47tizUsVFi5fVfOXzgEQVsLGjNqqOCfPc40VVkdc9yxbwqt+u+GG2wsmCqMyTN7AYWj4lJA==
X-Received: by 2002:a24:9d96:: with SMTP id f144mr3159417itd.167.1556628473404;
        Tue, 30 Apr 2019 05:47:53 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id 2sm10577214ioz.77.2019.04.30.05.47.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 05:47:52 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-som-lv: Fix MMC1 card detect
Date:   Tue, 30 Apr 2019 07:47:44 -0500
Message-Id: <20190430124744.18993-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The card detect pin was incorrectly using IRQ_TYPE_LEVEL_LOW
instead of GPIO_ACTIVE_LOW when reading the state of the CD pin.

This was previosly fixed on Torpedo, but missed on the SOM-LV

Fixes: 5cb8b0fa55a9 ("ARM: dts: Move most of
logicpd-som-lv-37xx-devkit.dts to logicpd-som-lv-baseboard.dtsi")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
index 4990ed90dcea..3e39b9a1f35d 100644
--- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
@@ -153,7 +153,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
 	wp-gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;		/* gpio_126 */
-	cd-gpios = <&gpio4 14 IRQ_TYPE_LEVEL_LOW>;		/* gpio_110 */
+	cd-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;			/* gpio_110 */
 	vmmc-supply = <&vmmc1>;
 	bus-width = <4>;
 	cap-power-off-card;
-- 
2.17.1

