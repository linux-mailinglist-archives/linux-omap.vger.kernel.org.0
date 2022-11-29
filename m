Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F66563C4C2
	for <lists+linux-omap@lfdr.de>; Tue, 29 Nov 2022 17:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbiK2QJx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Nov 2022 11:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235761AbiK2QJj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Nov 2022 11:09:39 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC0ABC9A
        for <linux-omap@vger.kernel.org>; Tue, 29 Nov 2022 08:09:38 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id x5so22888768wrt.7
        for <linux-omap@vger.kernel.org>; Tue, 29 Nov 2022 08:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZK+iipkHl/pJApvhUcvpWuoeG0v04wAY4UNOC37vzE=;
        b=v4E6HaN71iASog500impk6biLA2kyu17//4yJkCHI4HhBwh+f3fu2D2rjiFr7oQLNi
         w0wB7msF3Iq6dr9cP7LamjMQ7DJvxNIjZeWq/oh5RNfpcY1Nlr5AOAAuhMBtHigW+LRG
         BQO93tgySgeoVIV2ETFcdlfxhKLvuskv4FeAcCXeurkPEhQ29n3sUFqWQvzJAT6PY8FQ
         rHenJqBhi760doHV41V5Q3xutg2OFkFhI/htTs1XQ5c5VzsPpY7Nj7soZHrxUONCrZyZ
         TA/zH3EqphVDwykVlpwqtgJHtN2GuHD9M5hIOWDLf8LW4egoeEuaO8eIMvkTDuC5Go83
         jkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZK+iipkHl/pJApvhUcvpWuoeG0v04wAY4UNOC37vzE=;
        b=2WjDyccR7oMqYXTkpRjrtPrTtoKkGJcvX5o3bd/mNwSDMB54g0+hgTDa6zKf/0Uy4I
         koIMpGZpiFpFwDV11Z56aVwvg4XjLnHkgKtx2ZmjwukBNWxGSEmCDmy4rX3FD9L9Vh5P
         wuTykvkTYL/Uah/btRp9dEcOcs+IEP0vTQfkgsGWficTw6Www10mzPS1hJafRuPlgdbv
         6YpY1ljnCm0ih4QPcKeO0Fn1EviRqpMiJVzJSjd0qZ+u7ieGGd8RKHLOQyYk/AuyucWH
         pWaYNsNvnwb/FRwETj6fZ1L+SsGDA4CKSW/XPLCAeOQh1A1wjSBaxJV8dm3zfM4+v1Aj
         rH0A==
X-Gm-Message-State: ANoB5plntByjOGIpnVRnrdL/8f6thCUCNCxGy5lDJyuIlWXqkNzRqppF
        qI1gu1bEChsfnJkE0weT81Hjog==
X-Google-Smtp-Source: AA0mqf4kF8bPOiTEyHiyaZZcqOWJWYeBxKhKoQYjALF9Wq+DIHZTFZWd6cOTOvLizB46fBY2QKmQYQ==
X-Received: by 2002:a5d:58c6:0:b0:242:da2:7f50 with SMTP id o6-20020a5d58c6000000b002420da27f50mr9601635wrf.507.1669738178205;
        Tue, 29 Nov 2022 08:09:38 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id y18-20020a05600c365200b003c6c5a5a651sm2477572wmq.28.2022.11.29.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 08:09:37 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ARM: dts: am335x-nano: Enable USB host
Date:   Tue, 29 Nov 2022 16:08:18 +0000
Message-Id: <20221129160818.276696-6-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129160818.276696-1-mpfj@newflow.co.uk>
References: <20221129160818.276696-1-mpfj@newflow.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add missing entry to enable the USB host.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 arch/arm/boot/dts/am335x-nano.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-nano.dts b/arch/arm/boot/dts/am335x-nano.dts
index 58062cec39c0..c447aebd8d86 100644
--- a/arch/arm/boot/dts/am335x-nano.dts
+++ b/arch/arm/boot/dts/am335x-nano.dts
@@ -423,6 +423,10 @@ &mmc1 {
 	wp-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
 };
 
+&usb0 {
+	dr_mode = "host";
+};
+
 #include "tps65217.dtsi"
 
 &tps {
-- 
2.34.1

