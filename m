Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B15AA63C4B4
	for <lists+linux-omap@lfdr.de>; Tue, 29 Nov 2022 17:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbiK2QJf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Nov 2022 11:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbiK2QJc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Nov 2022 11:09:32 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203FDB856
        for <linux-omap@vger.kernel.org>; Tue, 29 Nov 2022 08:09:29 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q7so21974869wrr.8
        for <linux-omap@vger.kernel.org>; Tue, 29 Nov 2022 08:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYLdV6GRz5Ju2T6ejCA2CmepPlL7SuUYQ7FRznedctw=;
        b=jYiHLFqOzZLG1j+pjWz3AH7IM8pRmb89wDhPWOj050yt7ulonCIUPPlmdHUXqyLm3c
         2JnEThxfKWvEmMc30NRLkeWqg/d5QBCH2xZTeeDYUTdLgmQgvVA5K9CE/WvWWd69wgU0
         p0YG8ZxDjxlERjpZtU4NgRN0y0dNy1i5Xqi6l4oegCnKvNXkqxXGZ6/o5vR06oR+OCu8
         6+7/vKlRhl1B8SuRCAS1PNGH4gOAL/kF3OB5oxVyFwDPuw8akJ9Zx83X9tKFQw6BYC79
         S2Y8xrMbYcy8HAzWlkkVY4tTG2ercCS9JABHjHAUAiYGUFzYFphA4qNV9yJ5QaggfodN
         1uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYLdV6GRz5Ju2T6ejCA2CmepPlL7SuUYQ7FRznedctw=;
        b=fJfsq4u3hnqhrDF8DY0cIpCwChVcJer4djTPYfK8yA5K0Uk/10vuuP9w0XjVxLFHnJ
         sBrtpE+20gjrOJXapbCAnCFItdVwaGYK+bTqhGyGMOWqsfcqQjsJIiKB94e2hJ2NNHPN
         HwN2jM/QN6xeWZmyCtv/6ELRsq0Pkq0qNguht5828CKJpXb6lYjfY/oE8kax8jsIDZaE
         Nlzzgx8pqbCFPAbQ884pBloF+iV5obLO0A1mlOO3bYmvdSbHkObM4ktO4gwG/y4t1ZR3
         qWo6IqNSQmVBGbkIUXiMzO3z8MWJqD0rhHrcjNcQJ0E/hPafL/+abBDgjqeJBk22/msC
         wOxQ==
X-Gm-Message-State: ANoB5pnvfIPTzA9yJpGEM9+xl0HHNHv6Vbdz5rbUwoDZ4Ye3KmjoLs0T
        jerhVpI+JX1/lZO1uJMNd1JQAg==
X-Google-Smtp-Source: AA0mqf4a5SSO8mDdt20c5jrNJQkujidPLN82ecG3rW05pAhfzqI/eGUhHmBBkimplPn+4iQfWF1drg==
X-Received: by 2002:adf:fdc7:0:b0:241:d7ab:db8f with SMTP id i7-20020adffdc7000000b00241d7abdb8fmr26275541wrs.285.1669738167548;
        Tue, 29 Nov 2022 08:09:27 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id y18-20020a05600c365200b003c6c5a5a651sm2477572wmq.28.2022.11.29.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 08:09:26 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] ARM: dts: nanobone: Fix missing/incorrect features
Date:   Tue, 29 Nov 2022 16:08:13 +0000
Message-Id: <20221129160818.276696-1-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This patch series updates the NanoBone DTS file to address various missing or
incorrect features.

v1 -> v2:
  - Move temperature sensor definition under I2C heirarchy

Mark Jackson (5):
  ARM: dts: am335x-nano: Fix GPIO settings for RTS/CTS pins on UART3 & 4
  ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
  ARM: dts: am335x-nano: Enable I2C temperature sensor
  ARM: dts: am335x-nano: Fix GPIO settings for MMC pins
  ARM: dts: am335x-nano: Enable USB host

 arch/arm/boot/dts/am335x-nano.dts | 32 +++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.34.1

