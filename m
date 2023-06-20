Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E777371DD
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jun 2023 18:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjFTQht (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Jun 2023 12:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjFTQhg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Jun 2023 12:37:36 -0400
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AE2198B;
        Tue, 20 Jun 2023 09:37:17 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-341c72be673so24743775ab.1;
        Tue, 20 Jun 2023 09:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687278995; x=1689870995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85ycF3hecAMuGXOhwj9jJJFOE19UT7fZCAss7kLUOhg=;
        b=IXvRmoMkm9LyItJKAbHuxief5THmRWrs+YNfCa5IGK27nHL+cx09ppDub9W1g4bR6r
         xn/j6Ht25kQedoVab1NiY5blDxOrQwathmDMu9K0IcB7Bg+SBsrOTNRzdAfzsyqXBeta
         M5EZNxxVjhJPweWzxusZIHPvN5RkhrBzS3X2ZoADPMY5nTMjCrHv3oWYKsAiGDx2UMzd
         LDvWyN4mtSyIOw6XX9WsJiiYhxyB32DQ34wxVV5MMgQywgBnYWeEgSnV/8bbfZxtwuKH
         rlan7cdUwqxlQyxzIF/o36Vxifr5GVIBI0rOqcGI7qEEz43e6UpSwyTS+LUggxHXYiY7
         vFdg==
X-Gm-Message-State: AC+VfDxQCDG1YzvChba/Yk5yyVttZEo4pNzpGHW0kp3l0NE+Ii5YxmKF
        8B9KbnODkwt7ZWmQN+xh+Q==
X-Google-Smtp-Source: ACHHUZ4riU11u7eu+RnQQlZcN7Q/lf8OrfPR1grO+uL6MNJjLsR6F7z2sKzW0av3kxeX/tTgYurw1Q==
X-Received: by 2002:a92:c647:0:b0:342:89b4:b8c1 with SMTP id 7-20020a92c647000000b0034289b4b8c1mr5080768ill.21.1687278995655;
        Tue, 20 Jun 2023 09:36:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l14-20020a92290e000000b003427601b77esm708354ilg.21.2023.06.20.09.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 09:36:34 -0700 (PDT)
Received: (nullmailer pid 3787225 invoked by uid 1000);
        Tue, 20 Jun 2023 16:36:32 -0000
Date:   Tue, 20 Jun 2023 10:36:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-omap@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: extcon-usb-gpio: convert to DT
 schema format
Message-ID: <168727899219.3787165.585753030890671451.robh@kernel.org>
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On Thu, 15 Jun 2023 16:58:36 +0200, Alexander Stein wrote:
> Convert the binding to DT schema format. Change the GPIO properties to new
> naming convention using -gpios as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Mark extcon-usb-gpio as deprecated
> * Fix YAML format
> * Fix example node
> * Remove unneeded consumer node in example
> 
>  .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
>  .../bindings/extcon/extcon-usb-gpio.yaml      | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

