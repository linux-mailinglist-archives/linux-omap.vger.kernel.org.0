Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B183BC332
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 21:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhGETnP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 15:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhGETnP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 15:43:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA93BC061574
        for <linux-omap@vger.kernel.org>; Mon,  5 Jul 2021 12:40:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n14so34206811lfu.8
        for <linux-omap@vger.kernel.org>; Mon, 05 Jul 2021 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
        b=jIBShcjC538JgnK5C1XgwRkm84HPCDo2Hdh+9fu6oOVgK2q4u5PvyN5VYtzntyBjII
         6jN6rKHFv6hNbdQJma9QrVIepKrIXuuSDv59V598BtWKaVNmJ2+wlvLYyAY5xXmZv26w
         FdoiqeygVU6pF9X4l7mfqkrIhlG/lLAB9LGj6EYYozGFlK5Vm9FqTAc7lZOpazXfgrmV
         EAUwD3zEsb+pRp/JSUYL6agQ+glq6EvyANNhMESjG3DLTKZU14fgHzewB587CpxteplW
         KGmxt7uybe4hyNaoZJa4hkBVjOgBDVz+HBtDBy4j1VmYjXgIczbv5BHeEIZ7mC03uDWw
         QOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4k2Lhi4XHADfERCSjwVFS16vtcOe6zIC8KQOlIMZU8k=;
        b=VAQkjgdRYNbv4HZ4TVAniI6aT8nXYviO8Ox5vpLaba7nAUCoGEj6TEi/RFjMCec4X6
         Tn5YzaLZB+LMQr4U6OWD69aXktqE+N9psZj8XVu9pSkFBK2MMkMGUCEE2FNDO0UhIrBB
         CLtAn8jhoB8nMAxqOENaESY/kWcCyTIezhBB+qeedXeKh5tQpUWzxXF19HmdJPK5FZp2
         fnwet2RMqAb8yFqZO8jUFgLtNsNwD11A3WmZAFm/Vi9+2pWWiWQkNkNVAZ27bYeWIURg
         fEBGJEfb7vPHcPuebxATsuhFnhYRDXYWQhYDHBK8SK/2cBIZfGiSLkIL42RDesdj5zOt
         vRSA==
X-Gm-Message-State: AOAM531UzOHXoewYWWsPdn+T/kC+uYOhrSeygb5QFm177OmuTrmjH0gH
        pT+xhL3P0C0+YvOacfrf3UQ=
X-Google-Smtp-Source: ABdhPJy3GFU9RNsdeWX4eXSH9emH5bwRVUeKs/Ymfcu1rya5YJWrsKgzCGG/dhCkwa9ZTlYfj91zZg==
X-Received: by 2002:ac2:5234:: with SMTP id i20mr11343792lfl.2.1625514036078;
        Mon, 05 Jul 2021 12:40:36 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id b5sm1167248lfv.3.2021.07.05.12.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 12:40:35 -0700 (PDT)
From:   Peter Ujfalusi <peter.ujfalusi@gmail.com>
To:     broonie@kernel.org, tony@atomide.com
Cc:     alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: [PATCH v2 4/5] ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
Date:   Mon,  5 Jul 2021 22:42:48 +0300
Message-Id: <20210705194249.2385-5-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

McASP only supports  Force-idle, No-idle and Smart-idle modes

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 arch/arm/boot/dts/omap4-l4-abe.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4-l4-abe.dtsi b/arch/arm/boot/dts/omap4-l4-abe.dtsi
index a9573d441dea..8287fdaa526e 100644
--- a/arch/arm/boot/dts/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/omap4-l4-abe.dtsi
@@ -192,8 +192,7 @@ target-module@28000 {			/* 0x40128000, ap 8 08.0 */
 			reg-names = "rev", "sysc";
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
-					<SYSC_IDLE_SMART>,
-					<SYSC_IDLE_SMART_WKUP>;
+					<SYSC_IDLE_SMART>;
 			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm */
 			clocks = <&abe_clkctrl OMAP4_MCASP_CLKCTRL 0>;
 			clock-names = "fck";
-- 
2.32.0

