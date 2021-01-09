Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3274E2F01FC
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 18:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbhAIRD7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 12:03:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726058AbhAIRD6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 12:03:58 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954BCC061786;
        Sat,  9 Jan 2021 09:03:18 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z5so13150331iob.11;
        Sat, 09 Jan 2021 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TegRmyV5fZN7nTdiRSNkPUmPZbgQG1wQQmkQT6OhXw4=;
        b=LhChZ7nQU1BHeTLQvs/HOB6l9f9ts6qyc20DgBlJsDLnMiHB42lJq28yMNFihyJ6/Z
         PJ3yL4VMhr6h3kx7eQaYqVz+IpmssIIBFlg024Uxsm3ptxh/8RWCBdkLckAzMvMF9pjJ
         Og/BClcnB4zl1gcu03Kl5jLDsqVxh6VVSqCs0HOgkVxZiibVHWFAYOCyT/pCMNqWuNWe
         kKtS2jdH3a5tfnsFV0GCppc8iz3MgbyHCeZ8Pax4o1VTfTKaFv3q/pE71imRLJhJyEGX
         FhM+91qGqHZdipDH/Mly0+Wnhu8RQz6YrY5h1OZd0hhPiJdnOzjJrmQo2joL2vSKm2Ke
         D4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TegRmyV5fZN7nTdiRSNkPUmPZbgQG1wQQmkQT6OhXw4=;
        b=ELmtcHjDCZHOZ92QoDqnTcYJGHby6PrsK3wGjZmgFSIFChOFtghsn4OoWgMnm8xvhq
         oTa5mh2nn/z951LV7y0p94vetj8Yr2JuLiAnRISeAgEkdJKXusN6jNH9YxXp2LZdoP5o
         9qlT8XLRvKP6T4EDd/nG4xkesnvHgfV0kEhb208rSthMmgi/vM+S9mQtJc3kcKFy0Cpg
         zl8svi9TacIg2UGAKjeadQXD5ChcKUbyt237oycHFQWW9v55pTBtSgk/R53ZtkBan0f3
         f9erlUmZK25Btudw+uMlr7FV+2wSFT8te9j8JG3lY0poKWxvDVJt55c359r6mbJcsR3h
         AbBg==
X-Gm-Message-State: AOAM5336W/vpIoxh2LsHmxj9N0G9QEWssyypfj1L4DXqa6EMPl6+KH8t
        w3vL6CGLdv5VqMMNm3eQsCLiMIHvf4Cso/XcayQ=
X-Google-Smtp-Source: ABdhPJwiQfKEPlBuK6xHNTcZziO0Z6VWdaFcjP5bzs2trqGzg4m3GOf7CBrIH2f3KJf38kgoVOO/M048WXowqWrUlpA=
X-Received: by 2002:a05:6638:296:: with SMTP id c22mr8338851jaq.65.1610211797894;
 Sat, 09 Jan 2021 09:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20210109163916.1247431-1-aford173@gmail.com> <8B45575E-A50B-407C-8920-D2A7E295DBE9@goldelico.com>
In-Reply-To: <8B45575E-A50B-407C-8920-D2A7E295DBE9@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 9 Jan 2021 11:03:06 -0600
Message-ID: <CAHCN7x+j0N6rop616UDhSx_qgkWLyUmRV2MVN74qT17z-ktaAw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap36xx: Remove turbo mode for 1GHz variants
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Jan 9, 2021 at 10:58 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Adam,
>
> > Am 09.01.2021 um 17:39 schrieb Adam Ford <aford173@gmail.com>:
> >
> > Previously, the 1GHz variants were marked as a turbo,
> > because that variant has reduced thermal operating range.
> >
> > Now that the thermal throttling is in place, it should be
> > safe to remove the turbo-mode from the 1GHz variants, because
> > the CPU will automatically slow if the thermal limit is reached.
>
> Subject and description may be misunderstood in a way that 1GHz
> is now disabled.
>
> Rather the 1GHz OPP is now permanently enabled and does no longer
> need to be manuall enabled through something like
> /sys/devices/system/cpu/cpufreq/boost.

I just sent a V2, before I saw this. I can send a V3 with your
feedback.  I just want to give Tony and/or others a chance to chime
in.

>
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> > index 3a5228562b0d..3451f9be104e 100644
> > --- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> > +++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> > @@ -70,6 +70,7 @@ nand@0,0 {
> >               gpmc,device-width = <2>;
> >               #address-cells = <1>;
> >               #size-cells = <1>;
> > +             status = "disabled";
>
> this does not seem to match the description?

I just sent an apology e-mail because I realized I grabbed the wrong file.

>
> >       };
> > };
> >
> > --
> > 2.25.1
> >
>
> BR,
> Nikolaus
>
