Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F20647F142
	for <lists+linux-omap@lfdr.de>; Fri, 24 Dec 2021 22:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237355AbhLXV53 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Dec 2021 16:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbhLXV52 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Dec 2021 16:57:28 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAA7C061401
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:28 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w16so37288747edc.11
        for <linux-omap@vger.kernel.org>; Fri, 24 Dec 2021 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGZIbbsGOGDyIHFhL0ruciSkXe78R0Kf5Ainmkje574=;
        b=LUlEvItqcVPfG92VEKV93vYAp0apjmqyc+oxWCAB0S8Haot+e6gFpgcAv6gWXa+RH5
         O424D+wnUqjKgJG0kBN+kLe8qxPSmGVGw9bwO5vXVpAzPYiWzFq4D1nxZM5SutCbWHpl
         OGfIR0BlAitPHtbzOTnMjdmhlvgpZ/FVIOyiTrZrBU0ASjqEWgbGg6SGborNHE8lW2Pp
         LePgpr3u7DamJGJfN9MbEJytBrYKtsLoCRzNQzBKvuzEFDBVasgrNIO/OTvU71JO2Nmc
         D17bOa5OpMi0J1k5oa/gJ39/4rwYf7pTElfRLje5WrEiO3F+VmFlD/WDNT8//ZiZ+SmY
         qp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JGZIbbsGOGDyIHFhL0ruciSkXe78R0Kf5Ainmkje574=;
        b=dB270EqQHWUEAmXVtDW62P5jFTnhe3sAa7Ojjd+78EiZvc8TFMBKU0CSqmW4kFH5OG
         htqSZWk5j1zkrMZ1CBUwmVqihwyVcxNOkno+dT3N9uz+Cwq4Pc5sjw6nIhsYHMM2GSjD
         ctbqhioxhclon9ing3KQhb+rmFglhPzQ+b+d7dLSEI/t+v9T1f0tUY/gCGO2yCbiZ0pm
         qEf7Nba1rSPOOQ1O/Vk+Q0IG5D9Jft/KBNWxYVIVRZRLvkcK3jkiS/uIOWrI60l5E75+
         tZ8J54ZG/QwapoozFyVoS7bowi+xcV9iTBNyb0O+FjfZqK5RuVEe0OhpsqIY9BgQBVf3
         kATA==
X-Gm-Message-State: AOAM5301Ohbg1c7g+EjFBx0KQ8ZaNpevNYlO13WBWSiPcTEBmPWlOsNi
        ecgMIk1Pkqv8o9+V3bXcgIRSv5R1hT8=
X-Google-Smtp-Source: ABdhPJyJNGCAgyBgNX3tuBucuODiq5YP7vP6sxslvyrF3xlgE8agpf1ZgXB0qqbYMdNz5UFoElDwYQ==
X-Received: by 2002:a05:6402:16cd:: with SMTP id r13mr7134777edx.264.1640383047030;
        Fri, 24 Dec 2021 13:57:27 -0800 (PST)
Received: from localhost.localdomain (bband-dyn119.178-40-49.t-com.sk. [178.40.49.119])
        by smtp.gmail.com with ESMTPSA id dn10sm3022476ejc.139.2021.12.24.13.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 13:57:26 -0800 (PST)
Sender: Peter Vasil <petervasil@gmail.com>
From:   peter.vasil@gmail.com
To:     linux-omap@vger.kernel.org
Cc:     peter.vasil@gmail.com
Subject: [PATCH 6/6] mfd: retu: Add support for LEDPWM and Vcore regulator MFD cells
Date:   Fri, 24 Dec 2021 22:56:35 +0100
Message-Id: <20211224215635.1585808-6-peter.vasil@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224215635.1585808-3-peter.vasil@gmail.com>
References: <20211224215635.1585808-3-peter.vasil@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Peter Vasil <peter.vasil@gmail.com>

Add MFD cells for new Tahvo ASIC LEDPWM and Vcore regulator drivers.
---
 drivers/mfd/retu-mfd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index c748fd29a220..3a4f3c64ae72 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -99,6 +99,14 @@ static const struct mfd_cell tahvo_devs[] = {
 		.resources	= tahvo_usb_res,
 		.num_resources	= ARRAY_SIZE(tahvo_usb_res),
 	},
+	{
+		.name		= "tahvo-ledpwm",
+		.of_compatible	= "nokia,tahvo-ledpwm"
+	},
+	{
+		.name		= "tahvo-vcore-regulator",
+		.of_compatible	= "nokia,tahvo-vcore-regulator"
+	},
 };
 
 static struct regmap_irq tahvo_irqs[] = {
-- 
2.25.1

