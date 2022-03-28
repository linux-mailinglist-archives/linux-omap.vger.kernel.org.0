Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602934E909B
	for <lists+linux-omap@lfdr.de>; Mon, 28 Mar 2022 10:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbiC1I4y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Mar 2022 04:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236626AbiC1I4x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Mar 2022 04:56:53 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8058853E15
        for <linux-omap@vger.kernel.org>; Mon, 28 Mar 2022 01:55:12 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id u65so643520uau.5
        for <linux-omap@vger.kernel.org>; Mon, 28 Mar 2022 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVsPS/VhdyaBsd9atLVudcFUKqEC9P8EvF6rDaB8yFU=;
        b=OSqpQCrlKuq1ygWxipYT3Of9HBAb88KQ9TOJlYuLb2/hGVpSDprsgb6uWgqbh3hh98
         vsxGCoSmwwbiMb/1jrmEDn1hHoeY6N21aXGTFcL6mzAPwPSpbGdasPKMR7/lx8tM8Dcu
         zDqMOBhm8ZczDMkDasuHpB7m/C5XBna2TilwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVsPS/VhdyaBsd9atLVudcFUKqEC9P8EvF6rDaB8yFU=;
        b=KNNTgfczNJ7E/cKeUSJyskWvvRsh9T/GtUaL+DAdrz1Rux8WnYV3CTmGSN1dT1NFDY
         74jS/Qb9w44ki2tMZPdjQa8HiGceJuVdtzodCw8ByNOXsCtX6M791GayJUSm6YbVc3lV
         AOmrmgeM8nguJUMkbEL2DsQVP8iVXUJLlwtlczXe1bv4fEgFDmXIzmELdSvguHk47XWs
         kK7r1fWpyf76AZHyOBGdUY4dIyrWtjN3m9iIZa162UOuMPRbiEKVl1iuF9vwAGs3JAQq
         m8CAWBapUDVpUSJLNmbkjabREp1hhJaKlQpqBtob1AufnFTCtOId2m+nkyU4pVfG5td0
         rFLw==
X-Gm-Message-State: AOAM530KsBShkN9NMmB/aMv0A9QXqJI4txqKah7G5JLdMlWC8+abn1mI
        Dwwk36L1XBpGJU8+cRsKHu1z97kL3fnNEEbAgIUSMA==
X-Google-Smtp-Source: ABdhPJyfvYib4PeBvldMr45WaNJUn9d0szw+m4r3gQvhxDYWf7h78gUBTUR4Tz9aV7SCUvVQadsOTy78MLEja6PP/v4=
X-Received: by 2002:ab0:2695:0:b0:352:5fc9:4132 with SMTP id
 t21-20020ab02695000000b003525fc94132mr9194787uao.29.1648457711122; Mon, 28
 Mar 2022 01:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 28 Mar 2022 17:55:00 +0900
Message-ID: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
        openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
        linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
        linux-unisoc@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS,T_SCC_BODY_TEXT_LINE,
        WEIRD_QUOTING autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ansuel

On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.

While I agree with this change and think it's for the good (browsing
the ARM dts directory at the moment is frustrating..) I think
buildroot and others need to be told about this as it'll potentially
break their kernel build scripting for ARM and probably messes up the
configs they have for existing boards.

>  arch/arm/boot/dts/mstart/Makefile             |   10 +
>  .../mstar-infinity-breadbee-common.dtsi       |    0
>  .../mstar-infinity-msc313-breadbee_crust.dts  |    0
>  .../{ => mstart}/mstar-infinity-msc313.dtsi   |    0
>  .../boot/dts/{ => mstart}/mstar-infinity.dtsi |    0
>  .../mstar-infinity2m-ssd201-som2d01.dtsi      |    0
>  ...nfinity2m-ssd202d-100ask-dongshanpione.dts |    0
>  .../mstar-infinity2m-ssd202d-miyoo-mini.dts   |    0
>  .../mstar-infinity2m-ssd202d-ssd201htv2.dts   |    0
>  .../mstar-infinity2m-ssd202d-unitv2.dts       |    0
>  ...sd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts |    0
>  ...ity2m-ssd202d-wirelesstag-ido-som2d01.dtsi |    0
>  .../mstar-infinity2m-ssd202d.dtsi             |    0
>  .../mstar-infinity2m-ssd20xd.dtsi             |    0
>  .../dts/{ => mstart}/mstar-infinity2m.dtsi    |    0
>  .../mstar-infinity3-msc313e-breadbee.dts      |    0
>  .../{ => mstart}/mstar-infinity3-msc313e.dtsi |    0
>  .../dts/{ => mstart}/mstar-infinity3.dtsi     |    0
>  .../mstar-mercury5-ssc8336n-midrived08.dts    |    0
>  .../{ => mstart}/mstar-mercury5-ssc8336n.dtsi |    0
>  .../boot/dts/{ => mstart}/mstar-mercury5.dtsi |    0
>  arch/arm/boot/dts/{ => mstart}/mstar-v7.dtsi  |    0

s/mstart/mstar/

Cheers,

Daniel
