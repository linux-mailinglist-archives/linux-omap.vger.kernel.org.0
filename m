Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CB443005B
	for <lists+linux-omap@lfdr.de>; Sat, 16 Oct 2021 07:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242614AbhJPFGR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 16 Oct 2021 01:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242518AbhJPFGQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 16 Oct 2021 01:06:16 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC67C061570
        for <linux-omap@vger.kernel.org>; Fri, 15 Oct 2021 22:04:09 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 133so10475397pgb.1
        for <linux-omap@vger.kernel.org>; Fri, 15 Oct 2021 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1nRqPfmxrrw4CktC2ScfbUfntBuVYUtnPZ0553muocI=;
        b=kl7hgM7vwGZWFu9LWpuyq+dIGP0Viks4UP5QnQQLMzbLucXzOyLk+HA8ZFnUm8LuYk
         2eEWV1rXCXKL3snTDc6Cau1/G+eBVgLQoDJCF4j41wp/C8lSvmA9lHsnA33vARCg5Zkk
         WMQ+ubC4tZyoWlckkab1kNqkrGte5WJN4Ijsenp10HOJQ6oBqU4ti/tQ6RRvyNY6lPhY
         MvXvyhMbUKO2F8Sc9ut7lUxhFRHpvdJT5RrJ9QHAQcE2tzI5s3eCTypjggtKpL9xecxA
         TYF2VRQAMmIKZlXFmiEJd18T26oSwltNM5lh9oPG67zh7exuchPqofWzQTEzUzMVmjr+
         cQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1nRqPfmxrrw4CktC2ScfbUfntBuVYUtnPZ0553muocI=;
        b=n+Lyde6dyzMe5H9QHGCf0GhanCyi2DYsiLqoQdBo6XcGWDN2wsUArVzdUK3/ECG0L3
         vtnU4yKNScTMIsxCnlTJ0oYADWhmKrFnXytIbG8PXWb7cs11Y8W0pINuHztXUUYLyfuD
         e4YA8D6dVn6EXlsTb4U/ovWFmtLjJpkydj7PLmNsmKIuS0klCTiFuL3SuTDZbr4PBG9/
         oVZML0psMFQzPeQS//Jmo+SoOGI9f7puwRIER8mtNjtyatsMfMTOvADVmsY74UkuF1lT
         rySY3ir8xPzwvUtVqPrPNmIYBwfud4jBV7JsVMWv9GzEhrJsWKjMRHH3EcpNmFPC8bUD
         2yhQ==
X-Gm-Message-State: AOAM533TaqF8oLmkqZLybpLuLUWu/Jf9gQpVaxrQeIHUpItIpDKucA3W
        bP55Osz3qWwDpI9iqaTDSPqJYg==
X-Google-Smtp-Source: ABdhPJyFTYXZY3VXt/hO0dPUs4MLGklG9srMkkjcN27uPXSIJJgmIUpxOwZDQJ2MxXSF5ZkBNhe71w==
X-Received: by 2002:aa7:8bd3:0:b0:44c:68b3:a52e with SMTP id s19-20020aa78bd3000000b0044c68b3a52emr16055519pfd.74.1634360648469;
        Fri, 15 Oct 2021 22:04:08 -0700 (PDT)
Received: from x1 ([2601:1c2:1080:1950:2d9b:6b84:2b5:218c])
        by smtp.gmail.com with ESMTPSA id 21sm12617106pjg.57.2021.10.15.22.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:04:08 -0700 (PDT)
Date:   Fri, 15 Oct 2021 22:04:06 -0700
From:   Drew Fustini <dfustini@baylibre.com>
To:     Jason Kridner <jkridner@beagleboard.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Benoit Cousson <bcousson@baylibre.com>,
        Dave Gerlach <d-gerlach@ti.com>, Keerthy <j-keerthy@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        OMAP List <linux-omap@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x: Add rtc node as system-power-controller
Message-ID: <20211016050406.GA575510@x1>
References: <20211012191311.879838-1-dfustini@baylibre.com>
 <YWaJfofs8QAtBnVu@hovoldconsulting.com>
 <20211013214103.GA10628@x1>
 <YWgJkkJ4LuAJhLmk@hovoldconsulting.com>
 <CA+T6QPkUSJZ9Pb8JvfuVuGzfv0cX-HQcT3eALN5Y9882r676MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+T6QPkUSJZ9Pb8JvfuVuGzfv0cX-HQcT3eALN5Y9882r676MA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 14, 2021 at 10:12:48AM -0400, Jason Kridner wrote:
> On Thu, Oct 14, 2021 at 6:43 AM Johan Hovold <johan@kernel.org> wrote:
> 
> > On Wed, Oct 13, 2021 at 02:41:03PM -0700, Drew Fustini wrote:
> > > On Wed, Oct 13, 2021 at 09:23:42AM +0200, Johan Hovold wrote:
> > > > On Tue, Oct 12, 2021 at 12:13:12PM -0700, Drew Fustini wrote:
> > > > > From: Keerthy <j-keerthy@ti.com>
> > > > >
> > > > > PMIC_PWR_EN pin of RTC on am335x-evm, bone, and boneblack is
> > connected to
> > > > > PMIC on board, so flag rtc node as system-power-controller to allow
> > > > > software to poweroff boards.
> > > >
> > > > The "system-power-controller" property is already set in
> > > > bone-common.dtsi since
> > > >
> > > >     2876cc4a773c ("ARM: dts: Move most of am335x-boneblack.dts to
> > am335x-boneblack-common.dtsi")
> > > >
> > > > so this probably only affects am335x-evm and that should be reflected
> > in
> > > > the commit message.
> > > >
> > > > Also, should you now remove the property from boneblack-common? Or just
> > > > add it to am335x-evm instead?
> > >
> > > Thank you for reviewing. Yes, I should improve the commit message as the
> > > BeagleBone Black is already covered for the rtc system-power-controller
> > > in am335x-boneblack-common.dtsi.
> >
> > So is sancloud-bbe apparently.
> >
> > I only noticed because I added support to BeagleBone Black long ago so
> > unless there'd been a regression it should already be supported.
> >
> > > I believe it would be ok to remove system-power-controller from
> > > am335x-boneblack-common.dtsi and have it in am335x-bone-common.dtsi.
> > >
> > > These are the files that include am335x-boneblack-common.dtsi:
> > > arch/arm/boot/dts/am335x-boneblack-wireless.dts
> > > arch/arm/boot/dts/am335x-boneblack.dts
> > > arch/arm/boot/dts/am335x-sancloud-bbe-lite.dts
> > > arch/arm/boot/dts/am335x-sancloud-bbe.dts
> > >
> > > But they all also include am335x-bone-common.dtsi.
> > >
> > > However, I just noticed that am335x-evm.dts does not include either
> > > am335x-boneblack-common.dtsi or am335x-boneblack-common.dtsi. Thus
> > > rtc system-power-controller should be directly inserted into
> > > am335x-evm.dts.
> >
> > Right.
> >
> > > I considered just moving system-power-controller to the rtc node in
> > > am33xx-l4.dtsi but I don't think that would be correct as this would not
> > > be valid for all am33xx devices.
> > >
> > > Does that seem correct to you?
> >
> > No, that wouldn't be right.
> >
> > You're more familiar with the different variants here, but unless all
> > flavours of Bone Black have the signal wired, it should probably be
> > pushed down into the dts files again.
> >
> 
> I believe anything "bone" is going to have the same RTC power
> configuration. I believe this could be inconsistent at the AM335x level.

Thanks for the input Jason and Johan.

These are the dts files that currently include either 
am335x-bone-common.dtsi or am335x-boneblack-common.dtsi:

    am335x-bone.dts  
	am335x-bone-common.dtsi

    am335x-boneblack.dts
        am335x-bone-common.dtsi
	am335x-boneblack-common.dtsi [rtc system-power-controller]

    am335x-boneblack-wireless.dts
	am335x-bone-common.dtsi
	am335x-boneblack-common.dtsi [rtc system-power-controller]

    am335x-bonegreen.dts
	am335x-bone-common.dtsi

    am335x-bonegreen-wireless.dts
	am335x-bone-common.dtsi

    am335x-sancloud-bbe.dts
	am335x-bone-common.dtsi
	am335x-boneblack-common.dtsi [rtc system-power-controller]

    am335x-sancloud-bbe-lite.dts
	am335x-bone-common.dtsi
	am335x-boneblack-common.dtsi [rtc system-power-controller]

am335x-boneblack.dts, am335x-boneblack-wireless.dts,
am335x-sancloud-bbe.dts, and am335x-sancloud-bbe-lite.dts already have
the rtc system-power-controller through am335x-boneblack-common.dtsi.

Moving rtc system-power-controller from am335x-boneblack-common.dtsi to
am335x-bone-common.dtsi would have no change for those boards as they
also include am335x-bone-common.dtsi.

It would add system-power-controller to am335x-bone.dts,
am335x-bonegreen.dts, and am335x-bonegreen-wireless.dts.

The original bone, green and green wireless have PMIC_POWR_EN (ZCZ C6)
connected to PWR_EN on the TPS65217B PMIC. Thus system-power-controller
should be valid for them too.

I will make new patch series that:

  * removes system-power-controller from am335x-boneblack-common.dtsi 
  * adds system-power-controller to am335x-bone-common.dtsi
  * adds system-power-controller to am335x-evm.dts, am335x-icev2.dts,
    am335x-icev2-prueth.dts

However, am335x-evmsk.dts should not have system-power-controller as
PMIC_POWR_EN is not connected in that board design.

Thanks,
Drew
