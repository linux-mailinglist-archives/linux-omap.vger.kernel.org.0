Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD827E5929
	for <lists+linux-omap@lfdr.de>; Wed,  8 Nov 2023 15:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343506AbjKHOeY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Nov 2023 09:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234172AbjKHOeI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Nov 2023 09:34:08 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62461FEF
        for <linux-omap@vger.kernel.org>; Wed,  8 Nov 2023 06:34:05 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507d1cc0538so9436658e87.2
        for <linux-omap@vger.kernel.org>; Wed, 08 Nov 2023 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454044; x=1700058844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGzclwbFLS82d1Yy6hJpVSYEp7mUVdHhXoDoAeHaQ9o=;
        b=oVABV4XWqQX4uB44dRsT21hjjoqdkvOgsOImOXTAtpUICemdRUdvYHEH8YLYH5PtT3
         4fyTASLfBvHLpqJ+VPkTw1r+RqvuyPD4stWb5qv0K/DHFOyqz1udM4zi4zXIbb95DMzZ
         bkH6Qv7nvR4e7n752njaUhxNhOR0TRIzGwjn71sdhhcP0G/8yeKfUMGFcZgJvdB29RWe
         tcU8zC1LztlpGR0/g7NiI8vWMjazb4cccWzCjlvsloZetpCM/OmJ3WnRIZIU4C3MzmWU
         dVSneU0XTqZRu1ZlBGClW9kI4CWBNBVoiZlZ6er2n3MHMa3zBvArToJ26mp35Q6526Y0
         ogYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454044; x=1700058844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGzclwbFLS82d1Yy6hJpVSYEp7mUVdHhXoDoAeHaQ9o=;
        b=uoIyrjydiO4SSTieqLCK56sjxUKdj9k/BWKSM1MM3OF+ic+rxln1DzK4wUNrQx5yUH
         kRuNpppFW57iF+2nPdtd0YvZNDbTZrELE2S3qJ4SOxJH/W+XvABHipNPYBFTYKEEsvOz
         T4n3aS2fqwq5fZrvj3Xdm2OjVNUdBy5v0zErtp1nY5VJzABWp8HPdixlYZMIaX93hm+Y
         saPSIWcjid/BAvbHgAx5vQ/qhnJZnwAvET5Ghnh2zwyQ6UY+odN82p2z99mOuFr3Dvbh
         mfRjxPkS0OicsilCTuROdRTNokatY5cv4xdpw6uftjtaBNm/zuAEsA9QXbQivygi2Q/G
         65KQ==
X-Gm-Message-State: AOJu0YxkmFPa6BeckWLSl90hS+IIyDK+BQs+axvqVuEtklvpGf04D/sP
        sxR+65w+r1TPwSfqB5kuHVAF0Q==
X-Google-Smtp-Source: AGHT+IHO/EX+mYFpXV9cnozSua00aYKVLxHpApEI0ijPX+/t/mJFnU4RbkNl70WWo+NHt88Fl9uYmA==
X-Received: by 2002:ac2:5a1a:0:b0:509:4541:5e97 with SMTP id q26-20020ac25a1a000000b0050945415e97mr1368218lfn.29.1699454043887;
        Wed, 08 Nov 2023 06:34:03 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:03 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 08 Nov 2023 15:33:53 +0100
Subject: [PATCH 5/6] mtd: rawnand: gpio: Support standard nand width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-fix-mips-nand-v1-5-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The standard property for describing the band width of a NAND
memory is "nand-bus-width" not "bank-width". The new bindings
support both so make Linux check both in priority order.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/gpio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 5553101c709c..d5bd245b0c0d 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -183,7 +183,15 @@ static int gpio_nand_get_config(struct device *dev,
 {
 	u32 val;
 
-	if (!device_property_read_u32(dev, "bank-width", &val)) {
+	/* The preferred binding takes precedence */
+	if (!device_property_read_u32(dev, "nand-bus-width", &val)) {
+		if (val == 16) {
+			chip->options |= NAND_BUSWIDTH_16;
+		} else if (val != 8) {
+			dev_err(dev, "invalid nand-bus-width %u\n", val);
+			return -EINVAL;
+		}
+	} else if (!device_property_read_u32(dev, "bank-width", &val)) {
 		if (val == 2) {
 			chip->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {

-- 
2.34.1

