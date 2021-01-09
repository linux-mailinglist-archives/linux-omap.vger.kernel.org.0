Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D42F01ED
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 17:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbhAIQ5r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 11:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbhAIQ5r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 11:57:47 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C24AC06179F;
        Sat,  9 Jan 2021 08:57:07 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id i18so13198097ioa.1;
        Sat, 09 Jan 2021 08:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UPGwupXcgKKiNNclSFq7X9aPl8HQD0QwvZmeCm0c0r0=;
        b=A+4dZNNh8fhowrri2Hc6ZFW5+mLBAPaOlbJq8pp0PlEWyF6mUDJjatD3+jBX3SnH2g
         ur6/QfxHXQiQqlzUeeQNclSL3UsCXt7vAfNeCXPx+V9aefdmtj1IRLK5ehqvBiFhCSRw
         +nI/PmfAGB2Ren5W7R/YtBmQXdr7SzERX1lgoVTbMt6d0lkDi3drmYus+sGYDuWJo+Cx
         kKK5rlxATP7PQLQ7zDt4DKQgFNf/9dIp/qEG79+yFov+nLLInDSOZQok1auniG7Bpfpe
         +TDKLlP71g6IhMrDbmqQqYe1uy+sfWcU504IES/voHTl63mW8HJ3ITuHduFojexMbhD4
         kv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UPGwupXcgKKiNNclSFq7X9aPl8HQD0QwvZmeCm0c0r0=;
        b=LYOzKF6syI76aduNppkG5JcKht8mIl5uYHOjiMeNbhaO6DDrFWnd+i97ixeHra76IR
         jrDNqqS3rIelyZRkt8MmofZq7MmqVKOGz/O5L1jUBKyVP+xFQRIQbRI3nW0WbQ9nNWib
         24baEgbox2WFIpTVxhYU9wJjHWyfE5iNTwZ6RFiI8aqG/hqpF/Mfx4cut19JXcq8tWk/
         mxIz5tgHiXSucn3lPEv9L2gaRrjmI2ZD+WWqmLyVr+fWyhC3dIWpjwrDN9G8QItpJmOv
         A3D9fA9yeW+d8uYUv682uYmfQxvFK+GOBWqrK8veeC2DPW8JLOh80q7Z3yUdXJ+Ug0WH
         p0Tw==
X-Gm-Message-State: AOAM532vOLgRzGq403oaKiIJttbhtmBMqbTZqvG6pwo/fSQq4vIEf5K5
        weeQR1EiHfh8inMQhoVCvZe/ftg/WF5IuDaAQlPuUdEquetM89H7
X-Google-Smtp-Source: ABdhPJyUjj4hB2YAsDuze9ftS1C2Y7F2tL/ac+IZDMnIw+ICLL6UQabpyandREKrczLT6x55bc8wrUQGbHm108zqYeE=
X-Received: by 2002:a05:6638:153:: with SMTP id y19mr8240740jao.47.1610211424854;
 Sat, 09 Jan 2021 08:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20210109163916.1247431-1-aford173@gmail.com>
In-Reply-To: <20210109163916.1247431-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 9 Jan 2021 10:56:53 -0600
Message-ID: <CAHCN7xJYnZq4kbzwfPp8jmBijk0uxp5KerOUOOakydYL9j_WjA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jan 9, 2021 at 10:39 AM Adam Ford <aford173@gmail.com> wrote:
>
> Previously, the 1GHz variants were marked as a turbo,
> because that variant has reduced thermal operating range.
>
> Now that the thermal throttling is in place, it should be
> safe to remove the turbo-mode from the 1GHz variants, because
> the CPU will automatically slow if the thermal limit is reached.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
Sorry for the noise.  grabbed the wrong thing.

Please disregard.

> diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> index 3a5228562b0d..3451f9be104e 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> +++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> @@ -70,6 +70,7 @@ nand@0,0 {
>                 gpmc,device-width = <2>;
>                 #address-cells = <1>;
>                 #size-cells = <1>;
> +               status = "disabled";
>         };
>  };
>
> --
> 2.25.1
>
