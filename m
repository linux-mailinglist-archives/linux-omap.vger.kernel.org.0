Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F95437B3D
	for <lists+linux-omap@lfdr.de>; Fri, 22 Oct 2021 19:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhJVRCV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 Oct 2021 13:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhJVRCT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 22 Oct 2021 13:02:19 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4140C061767
        for <linux-omap@vger.kernel.org>; Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id y67so6208935iof.10
        for <linux-omap@vger.kernel.org>; Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kTen2SJ5OXpwrB3GYaVSgs5PSr8Wl3SgV5Rb/nQHzy4=;
        b=OfBpCJAzSU6W7PZkLXvnp5uTA+iDkXVIdjqAMBeIpoljCUIE4H16rweL/sbBvPgjOz
         a7XnxBwIYdIryHPaHA7ppp+xRkuJ8ZkGtFQ917cYf6DXBKPw/S1sutxiZQufEACp4UpT
         PLnHHSzn4hQ4AhSAlnXGb0jGqcXGqNTs1nU6fnOh+AIxI5Q8oMN4iE7Fya+Xc4OOZBym
         rRn0MMZj1yiUeB/E8pchAg4wkBwHmXHOyXkKHbDeAue4CSfMCyDa4KbzZTr3JaR9+GBS
         VNmBEefGtXM9NaGbU0Rp/mPohCP047tLX02ikVEAVBUzcMC6NEhoorwouURdd7M5e8d/
         nviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kTen2SJ5OXpwrB3GYaVSgs5PSr8Wl3SgV5Rb/nQHzy4=;
        b=LAUMYAHSQ2C5mdqSUlqLmseBdgYTh1BAFAbjXJSurCmz5u6bG+zGXbXGCQIkCBYrnZ
         AZ7Ewj7H5vqcXv+s3cxqWDTBeXjA8YgTB7WZKMUQ8i91G1MPZA/Axwlfh4BNPgsr+Ozh
         aotF7Da1yD3eMOFzPXS06Cg3HMm7QBPiQo79MtC5ILJAUsux96id8bQej4CIs0ui3RCY
         3l1AXgPKGCtGadPl875rPOuQD6aduWtEnt627fDRoxGCwN9NDPTdHuym3z1SwfoXH7oe
         lGYyLdtYI2ENd3Gkz33/Nz2MD2mCfvdefJz3r55CtcJwPiIfBoe063FNrMfFqjeVdQcJ
         1ZCQ==
X-Gm-Message-State: AOAM5319UnHszBU8Uj80iHbIl/UK54DoIzroCspkNI1sw3MAvJT+PZxT
        +OS9xcgXRehb7jQ1JU99DeVsX4Rn7HXIRBnqAPOvUg==
X-Google-Smtp-Source: ABdhPJzxQ0fZin7R9PkqV1UP1dkqBLaE11BhnPXYcqoa5W2nV/HynKJCgyp+2iBylPP9BT6beLI8s2+3hLU0rL6J7ec=
X-Received: by 2002:a05:6602:168f:: with SMTP id s15mr547913iow.178.1634922001157;
 Fri, 22 Oct 2021 10:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com> <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com> <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
In-Reply-To: <CAGETcx_YZOd05Gg53ZR8mfVhFUzwQWo4MrrWF8JHF_DCwEtunw@mail.gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 22 Oct 2021 22:29:24 +0530
Message-ID: <CAMi1Hd3M--+V6jPTV=psYGpOqi3UeQBs_FHqOg=oUf1hH-EU4w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
To:     Saravana Kannan <saravanak@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 22 Oct 2021 at 05:13, Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Oct 21, 2021 at 4:21 AM Amit Pundir <amit.pundir@linaro.org> wrote:
> >
> > Hi Saravana,
> >
> > This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> > I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.
>
> Amit top posting? How did that happen? :)
>
> The fact you are seeing this issue is super strange though. The driver
> literally does nothing other than allowing some sync_state() callbacks
> to happen. I also grepped for the occurence of "simple-bus" in
> arch/arm64/boot/dts/qcom/ and the only instance for 8250 is for the
> soc node.
>
> The only thing I can think of is that without my patch some
> sync_state() callbacks weren't getting called and maybe it was masking
> some other issue.
>
> Can you try to boot with this log (see log patch below) and see if the
> device hangs right after a sync_state() callback? Also, looking at the
> different sync_state() implementations in upstream, I'm guessing one
> of the devices isn't voting for interconnect bandwidth when it should
> have.
>
> Another thing you could do is boot without the simple-bus changes and
> then look for all instances of "state_synced" in /sys/devices and then
> see if any of them has the value "0" after boot up is complete.

Turned out RB5 is not even reaching up to
device_links_flush_sync_list() and seem to be stuck somewhere in
device_links_driver_bound(). So I added more print logs to narrow down
to any specific lock state but those additional prints seem to have
added enough delay to unblock that particular driver (Serial:
8250/16550 driver if I understood the logs correctly) and I eventually
booted to UI.

On the booted RB5 *with* and *without* the simple-bus changes, I see 4
instances of "0" state_synced nodes at:

/sys/devices/platform/soc@0/9100000.interconnect/state_synced
/sys/devices/platform/soc@0/1500000.interconnect/state_synced
/sys/devices/platform/soc@0/1740000.interconnect/state_synced
/sys/devices/platform/soc@0/163d000.interconnect/state_synced

Regards,
Amit Pundir

>
> -Saravana
>
> -- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1099,6 +1099,7 @@ static void device_links_flush_sync_list(struct
> list_head *list,
>                 if (dev != dont_lock_dev)
>                         device_lock(dev);
>
> +               dev_info(dev, "Calling sync_state()\n");
>                 if (dev->bus->sync_state)
>                         dev->bus->sync_state(dev);
>                 else if (dev->driver && dev->driver->sync_state)
