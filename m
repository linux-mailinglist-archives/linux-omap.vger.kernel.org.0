Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28BB517DC5
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 08:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiECG43 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 02:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiECG4I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 02:56:08 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA1D192BF
        for <linux-omap@vger.kernel.org>; Mon,  2 May 2022 23:52:06 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id be20so18813409edb.12
        for <linux-omap@vger.kernel.org>; Mon, 02 May 2022 23:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wp5ik2GdEev2NmO5gs/P/79zTEq06l4C05o8sV/RNnI=;
        b=dwc1l5uUjBpcBzeNqqV6uPUcG4Rh6r22xGKSU5WrYVIcJ6QnV299Vc9+cWU43uuRBT
         rYHTWBWAfo2Exan37L7y04t5y/vV7OlaIyvYMcb+eiYWUnjOs7wvUBhnl5xprzPqAGZw
         qYw8YfTlTjzCDRy8RaVr5P/zIdWt5OzlXhFv4yJ3LUn61g9ZarmFkxGydCPqQGAq5XXX
         AaeN82Ma3kB4wFZiHpgYON4ehgZpPVIFmNAdMl2WwpaoD01GcRpn/Rj6SGIqC1gVe9+s
         o40pU3AgHSBB28jIguo5zZPcBuz3Jbp+bZ5TnnXTcorPHub5axHY6NxqPGqAq90qma0X
         hgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wp5ik2GdEev2NmO5gs/P/79zTEq06l4C05o8sV/RNnI=;
        b=rgokNRQ6Fw4DGwUqCI9rUJCcZ4OQM3NSRdfBdVUd2SEi2D+P795Xco/5PJw3/zfbzM
         TO5jB1YGCDISFIj1FjOZmANp3VA9nQLHpFX1af97HSSBo1SeADEwVn/MBgip2lB2dTHA
         VhBwnyhYA97UZhHs2WPiMOsTceL0E7N8EPNpk+XnmmSFUoyArwrLa9lIvPQbHPZjD3dI
         85KWsIGiviKLtDgRp1zBwxy0/2BSM/AyRnjNN8Qt3PKB6zrWFosZHX+cdoDQbPdkTD4F
         X9agTwulNW13JRlFVFBatLha6FkbthBN1OQ3ghYluGfWUTZqLikDmzrgCcGEVOH4V8bG
         1gLQ==
X-Gm-Message-State: AOAM530o+oGC45Ga+59vpP1MvnbFrVuqL1lS6K3mlmV/2pOwMF3xYAAJ
        LPuz3GUndMbjDPOdzpJssajNpg==
X-Google-Smtp-Source: ABdhPJxzaCAaSP3LdqlHPSEj2BHrm34n5Vg2UqJQXsTFeyj/wLsLrky2XRmSW1F6r5amjsyfRLtmAQ==
X-Received: by 2002:a50:9f06:0:b0:425:c1ba:5037 with SMTP id b6-20020a509f06000000b00425c1ba5037mr16909166edf.285.1651560725209;
        Mon, 02 May 2022 23:52:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b006f3ef214e2fsm4382915ejc.149.2022.05.02.23.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 23:52:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/6] dmaengine/ARM: ti/am33xx: use proper 'dma-channels/requests' properties
Date:   Tue,  3 May 2022 08:51:55 +0200
Message-Id: <20220503065201.51818-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

The core DT schema defines generic 'dma-channels' and 'dma-requests'
properties, so in preparation to moving bindings to DT schema, convert
existing users of '#dma-channels' and '#dma-requests' to the generic
variant.

Not tested on hardware.

The patchset is bisectable - please pick up through independent trees.

Changes since v2
================
1. Keep old properties, so the patchset is bisectable.
2. Add review tags.

Changes since v1
================
1. Add missing TI patches.

See also:
[1] https://lore.kernel.org/linux-devicetree/fedb56be-f275-aabb-cdf5-dbd394b8a7bd@linaro.org/T/#m6235f451045c337d70a62dc65eab9a716618550b

Best regards,
Krzysztof

Krzysztof Kozlowski (6):
  dt-bindings: usb: am33xx-usb: deprecate '#dma-channels'
  dt-bindings: usb: da8xx-usb: deprecate '#dma-channels'
  dmaengine: ti: deprecate '#dma-channels'
  ARM: dts: am33xx: use new 'dma-channels/requests' properties
  ARM: dts: da850: use new 'dma-channels' property
  ARM: dts: dm81xx: use new 'dma-channels/requests' properties

 Documentation/devicetree/bindings/usb/am33xx-usb.txt | 7 ++++---
 Documentation/devicetree/bindings/usb/da8xx-usb.txt  | 5 +++--
 arch/arm/boot/dts/am33xx.dtsi                        | 3 +++
 arch/arm/boot/dts/da850.dtsi                         | 2 ++
 arch/arm/boot/dts/dm814x.dtsi                        | 3 +++
 arch/arm/boot/dts/dm816x.dtsi                        | 3 +++
 drivers/dma/ti/cppi41.c                              | 6 +++++-
 7 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.32.0

