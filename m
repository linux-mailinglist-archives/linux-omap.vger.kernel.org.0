Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9745C622FAF
	for <lists+linux-omap@lfdr.de>; Wed,  9 Nov 2022 17:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbiKIQJb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Nov 2022 11:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbiKIQJV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Nov 2022 11:09:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B5A22523
        for <linux-omap@vger.kernel.org>; Wed,  9 Nov 2022 08:09:19 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id o4so26505831wrq.6
        for <linux-omap@vger.kernel.org>; Wed, 09 Nov 2022 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KXIGfdHDhp2X4qqF/b9u8rPzmIWoaK5bfa5bYj5pcs=;
        b=1Kf9GziQSe3YmB9ctXgxJ0DkIGWjQZ0R5ir6jeqD5pYrhJ5Z3GtDoSwx+KVjAD2+a5
         rmdbBXypgMCRYICER/JLbO1hIDobkrPocL4bDGbCUxezr3buf9dvO1Bvw6/eSj4qpGDp
         4l6D6aLLMWeOL3f9Yp4ippcOQaZXnMycOXSYvLupJ9eZJ0z2Fr4ncxy/tG91BpUDi3dU
         /1xSWFV7WIy7YD0FeZPLpu+UZ9liQ2ppFF497RSdkE+8KhuabKsE+uPUG6kQE9Zw2Skq
         er0FThu5iF1/wV6IqDbmtN5N50QpBEC+KsnvT+7zJfTi4p5zvEhotUUu5MRIXjfb+Mah
         FoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KXIGfdHDhp2X4qqF/b9u8rPzmIWoaK5bfa5bYj5pcs=;
        b=O8vLXIRc8KG82J00TvkwZMyX/WAZnSyLq+9lL6TvWhj+R2CQic8ciM+TKKOtOQolVi
         xvZ1XzKcIwN2rW9aseyFBpD7kSG/RvegRGgTLZP3h1q+1b7UmpITN1vnhNLIRoVdQWk/
         Ggk3bheCT9pRKAQYomn4IBoZ4ut86V7ZZvxYm8abfTy+LA4LYPHr0VBObkEwGguwMXXr
         CAzKoDu0AGCuRVM6LMjFF6iDof1KqrezImYGYjuLdFUaj2X+8VPCFmwPz11igwG4Ol85
         rZRpwOnHW2hyDDizIpW38PMYlfdfsVElRHKfKxtJ7iwv+UFJbMrb3DWWWBJEEaPanoEj
         Ckzg==
X-Gm-Message-State: ACrzQf1xhFzEIXETdS3S9D4GYe8Uk1nnwtPBzpynbebmAdQA8/tJCfd3
        jZeWFZcmbUr+zs5xmx/hDcMB/w==
X-Google-Smtp-Source: AMsMyM5LbLi1JOq2G0a6DgQOLigyqwVzRKvnugNKjpHKcDs3oZxHFQj/xSxN0CpLDFLvIinqPiLYMw==
X-Received: by 2002:a05:6000:22f:b0:236:4f8e:a913 with SMTP id l15-20020a056000022f00b002364f8ea913mr38191878wrz.240.1668010157716;
        Wed, 09 Nov 2022 08:09:17 -0800 (PST)
Received: from mpfj-unity.. ([94.12.112.226])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b002366fb99cdasm13307772wru.50.2022.11.09.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 08:09:17 -0800 (PST)
From:   Mark Jackson <mpfj@newflow.co.uk>
To:     Mark Jackson <mpfj@newflow.co.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] ARM: dts: nanobone: Fix missing/incorrect features
Date:   Wed,  9 Nov 2022 16:08:59 +0000
Message-Id: <20221109160904.183147-1-mpfj@newflow.co.uk>
X-Mailer: git-send-email 2.34.1
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

This patch series updates the NanoBone DTS file to address various missing or
incorrect features.

Mark Jackson (5):
  ARM: dts: nanobone: Fix GPIO settings for RTS/CTS pins on UART3 & 4
  ARM: dts: nanobone: Enable RS485 mode for UART3 & 4
  ARM: dts: nanobone: Enable I2C temperature sensor
  ARM: dts: nanobone: Fix GPIO settings for MMC pins
  ARM: dts: nanobone: Enable USB host

 arch/arm/boot/dts/am335x-nano.dts | 32 +++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.34.1

