Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FB043D5D2
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 23:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhJ0Vec (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 17:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbhJ0Ve2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 17:34:28 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B002FC061243
        for <linux-omap@vger.kernel.org>; Wed, 27 Oct 2021 14:32:02 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j9so9039637lfu.7
        for <linux-omap@vger.kernel.org>; Wed, 27 Oct 2021 14:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ciBhkyr1/0LNSGctHDSe0+MHfUX1+FeMJz6V3BRLfBA=;
        b=kGwwoXKRSmvokd6xwLnsAjIyjxdFz9bqwMq5MPQ34U7mBjLIsrnZUIvMbALaDu+PEF
         bCx6uyzIElmTlnOQ+qfcaf08lIQ37WCYDibPmjM0YYhZ+qI416CJrbtviWdV++i+GgUw
         FXT8Q5rQnCkGclbe7ubEDaD20wxnssxE7dJjsSHoQleNI0sIOkLoWA3dvO+fQJWUc16F
         vf1HQx8x/2xk53lIJmzyvuZNogz7JyipqQkgHitf15IDzxIzrBDTlPosTsohiy8gcOjZ
         xJFWZF3unYTrK/TDjsNTbah7KFEtlBTNajaKzxuPdo11uYUCaVFe5jX7FotgbUiV/GcY
         T3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ciBhkyr1/0LNSGctHDSe0+MHfUX1+FeMJz6V3BRLfBA=;
        b=Yk44i7bApB1ny1OLH9AXe0HErL/to8jkAnMrRNug4eMerE9Gcduzj335ZzIHvSo38U
         rtACPd8lT7I6S+PkIHVp0AoOxKuav+ujOm6D5jroCZgqK3QfWAFdBWYN5mira5XfjAm4
         W3/DRF5z6+3RPqfyitlbWC2+S6jh7Fv59SZfsYtWNjtbQ6rJmtpoa5rpy8lyn3Rg8+hX
         6FOrhE1bZ3QDtRRi+40ZUx1uPsdgo/oJVVxl93OYx/xSHRsNB7gfwHuuiA5WCoT9pfdw
         HYxUkuOQsWFnDl1CLQ+MyXXl+tUGnaA4pojJFhWzQSs6BC5pFbz56sGDtInj8fSEleT1
         zrQQ==
X-Gm-Message-State: AOAM533TkgkYaEnnM62G5olHwMp/HAX9tXFY+bttBvmbMrZMDv9jokKx
        TxGsQJRutPe6jpq4FeOAtAAihBjpIySgmpWxFzSn9Q==
X-Google-Smtp-Source: ABdhPJx9R0mAeyyBLHyBCSfUxqjhwVMpaLs4L3/9SRi3ESAaH8BLzp+0eR6f5/NuVGObOh/WX7+bvLssaRQ2YXoVhqY=
X-Received: by 2002:a05:6512:3093:: with SMTP id z19mr148202lfd.167.1635370321040;
 Wed, 27 Oct 2021 14:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFraMXqC9OBeUTpm=bxjrFZTCopV3ZJQf1TRsA8UeTWdTA@mail.gmail.com>
 <80C6A8DD-183B-4FDD-B203-D3108C106043@goldelico.com> <935598D6-B8B5-4EC8-B87E-8EDC0F3B58CF@goldelico.com>
In-Reply-To: <935598D6-B8B5-4EC8-B87E-8EDC0F3B58CF@goldelico.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 27 Oct 2021 23:31:23 +0200
Message-ID: <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com>
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired omap_hsmmc
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Jerome Pouiller <Jerome.Pouiller@silabs.com>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bean Huo <beanhuo@micron.com>, linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 27 Oct 2021 at 19:01, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Ulf,
>
> > Am 26.10.2021 um 20:08 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> > Hi Uf,
> >>
> >> As a matter of fact, the similar problem that you are looking to
> >> address (applying card quirks based on DT compatibility strings), is
> >> partly being taken care of in another series [1], being discussed
> >> right now. I think the solution for the ti,wl1251 should be based upon
> >> that too. Please have a look and see if you can play with that!?
> >
> > That is interesting.
> > Yes, maybe it can be the basis. At least for finding the chip and driver.
>
> I have done a first experiment.
>
> It seems as if the series [1] does the opposite of what we need... It just
> skips entries in struct mmc_fixup if the DT does *not* match.

Ohh, I didn't look that close. In that case the code isn't doing what
it *should*. The point is really to match on the compatible string and
then add quirks if that is found.

Let me have a closer look - and for sure, I am willing to help if needed.

>
> This new match is not even tried in the wl1251 case since card->cis.vendor
> and card->cis.device are not properly initialized when mmc_fixup_device() is called.
> (in the upstream code the init_card function sets these and also sets MMC_QUIRK_NONSTD_SDIO
> to early abort before sdio_read_cccr, sdio_read_common_cis, and mmc_fixup_device).

We can call mmc_fixup_device() more than once during initialization
and provide different struct mmc_fixup* - if that is needed.

>
> What I don't get from the code is how cis.vendor or cis.device can be
> initialized from device tree for a specific device. As far as I see it can
> only be checked for and some quirks can be set from a table if vendor and
> device read from the CIS registers do match.

Yes. I thought that should be possible, but maybe it is not?

>
> Instead, we want to match DT and define some values for an otherwise unknown
> device (i.e. we can't match by vendor or other methods) to help to initialize
> the interface. So in mmc_fixup_device it is too late and we need something
> running earlier, based purely on device tree information...

Okay, I will have a closer look. Maybe we need to extend the card
quirks interface a bit to make it suitable for this case too.

>
> BR and thanks,
> Nikolaus
>
>
> > [1]
> > [RFC PATCH 0/2] mmc: allow to rely on the DT to apply quirks
> > https://lore.kernel.org/lkml/20211014143031.1313783-1-Jerome.Pouiller@silabs.com/
>

Kind regards
Uffe
