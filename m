Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FFF2CAB8E
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 20:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbgLATN0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 14:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgLATNZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 14:13:25 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B00AC0613CF;
        Tue,  1 Dec 2020 11:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M2/whe2XGSNH6+8YeJQRvPUKgoMZdIZpyuI4urN84k4=; b=aSW+5RvLhwbn0p5w9w6WoYQHgH
        ww2yN2/RxxdUOfIE0RthckJluUdCWLdFONUR8VBKv40DEp3WbewK0niYNDW3Y5dFZ4OdVr1G4X0H2
        1tQ4RkpjLKO0k69oWlWwkKSLjzHPXoDyEbXuIwn+/nj/ToKpzu5uf2tfIGycnsQPJlTE=;
Received: from p200300ccff124e001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff12:4e00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kkB4p-0003Ez-UU; Tue, 01 Dec 2020 20:12:40 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1kkB4p-00048l-LG; Tue, 01 Dec 2020 20:12:39 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     tony@atomide.com, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] ARM: omap2plus_defconfig: enable SPI GPIO
Date:   Tue,  1 Dec 2020 20:12:37 +0100
Message-Id: <20201201191237.15808-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

GTA04 uses that for controlling the td028ttec1 panel. So
for easier testing/bisecting it is useful to have it
enabled in the defconfig.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 77716f500813..904a8757ad9f 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -280,6 +280,7 @@ CONFIG_SERIAL_OMAP_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_SPI=y
+CONFIG_SPI_GPIO=m
 CONFIG_SPI_OMAP24XX=y
 CONFIG_SPI_TI_QSPI=m
 CONFIG_HSI=m
-- 
2.20.1

