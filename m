Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1895164CB6A
	for <lists+linux-omap@lfdr.de>; Wed, 14 Dec 2022 14:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237905AbiLNNfp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Dec 2022 08:35:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237808AbiLNNfo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Dec 2022 08:35:44 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627E49FE8
        for <linux-omap@vger.kernel.org>; Wed, 14 Dec 2022 05:35:41 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id o5so19330042wrm.1
        for <linux-omap@vger.kernel.org>; Wed, 14 Dec 2022 05:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newflow-co-uk.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yO/it6DJXp58opzX/ToO7OVqJ9wX6hKFVXMEgWfEm9A=;
        b=TOB9+4TXJwox57SR5ai4OBl9YwUCb20Lc0xZmevqzptn6yBeJ5b5GsBsHcdZYDpl5C
         0kC2ZIP/E09MliK8iX8VeZJHjOfBMWfbdSMxYPXOcc439iesfxAvtSHAY0OYv1sJq3vl
         byrzWhbuStlrf8mMZWzT46PWZGFEEi/7kChYVfMUMksed8qTy4Btpf5eMbmx7d14SJjT
         jbeimh1T2+/uAT6et85Krc1ctpLFN2rvZ5qHdIt4qayhDOQ/wpoXe3UYbwwhrDaD72r+
         9TRW35Oww5E7E5oZhOknv/8Zq/EnyPNcZ6m8faVCxWlDQ/0GpwRVGdiu9EvtC11GeJA/
         iBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yO/it6DJXp58opzX/ToO7OVqJ9wX6hKFVXMEgWfEm9A=;
        b=YgfmVAl2yvhGkJjLAZW7eykxskIRongXvtyecbdWC+BI8j+5fJaqTEKOEwKT/6vz9T
         JWnxjmq29n0NJ/s91LE+VsDlitC+emuELU68rKLbQlfgpMcGHyZnS5/hA9urMtP4hQm4
         4nVm5uRxT8AEN11Yx2VVzGk4aBxLFWsB9iJ4WUDh8jBQH3JUySQl96IQbC/xaPFx/yuN
         Jc/ftAz7GTkczYj1hH+ys6/J7JftJGsLG/IYmWebvZ5aQC95OTUvYOOvMlhKZjd2MPRl
         ZG6DEdOz+ty3vGqXeFYle74yvx99AXqty6oHii2IAbOr1Qz7rc64SFAoWssxzZ8Ac7/Q
         I+Lg==
X-Gm-Message-State: ANoB5pk4qUszk4N3hOrrDSzWwSjNKiiqv8rGLFWDRu7PU12nqRHCCDXm
        R31Uh5sI3EZcFQdsia0Arct77LVhRwfEmdGCL4DEjA==
X-Google-Smtp-Source: AA0mqf79bjY9YiXeOf4EvoO88hS4D2+yUmG5vJpe/dJFyMZNIiX3tgDIgmMi5J9sK4jUQQTW92rWQteU/+QXFPmOvAc=
X-Received: by 2002:a5d:4c4e:0:b0:242:48ff:4004 with SMTP id
 n14-20020a5d4c4e000000b0024248ff4004mr16170546wrt.678.1671024939921; Wed, 14
 Dec 2022 05:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20221130140547.295859-1-mpfj@newflow.co.uk>
In-Reply-To: <20221130140547.295859-1-mpfj@newflow.co.uk>
From:   Mark Jackson <mpfj@newflow.co.uk>
Date:   Wed, 14 Dec 2022 13:35:28 +0000
Message-ID: <CAAbcLfgUmiM=6eTQRRdkgLSEQZEcZwnzq0=Ov58S_osru-_V2Q@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 0/5] ARM: dts: nanobone: Fix missing/incorrect features
To:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Mark Jackson <mpfj@newflow.co.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 30 Nov 2022 at 14:06, Mark Jackson <mpfj@newflow.co.uk> wrote:
>
> This patch series updates the NanoBone DTS file to address various missing or
> incorrect features.
>
> v1 -> v2:
>   - Move temperature sensor definition under I2C heirarchy
>
> Mark Jackson (5):
>   ARM: dts: am335x-nano: Fix GPIO settings for RTS/CTS pins on UART3 & 4
>   ARM: dts: am335x-nano: Enable RS485 mode for UART3 & 4
>   ARM: dts: am335x-nano: Enable I2C temperature sensor
>   ARM: dts: am335x-nano: Fix GPIO settings for MMC pins
>   ARM: dts: am335x-nano: Enable USB host
>
>  arch/arm/boot/dts/am335x-nano.dts | 32 +++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
>
> --
> 2.34.1
>

Any update on this patch ?
Did it ever get through ?
Do I need to re-submit for some reason ?

Regards
Mark J.
