Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC75A5504
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2019 13:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbfIBLhe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Sep 2019 07:37:34 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32977 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730380AbfIBLhe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Sep 2019 07:37:34 -0400
Received: by mail-io1-f65.google.com with SMTP id z3so28647425iog.0
        for <linux-omap@vger.kernel.org>; Mon, 02 Sep 2019 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HnRdlQ0h0XlUHG99ows5AdhjhJM9QeE59ainNDshQ0=;
        b=ne0nlI2HObkNL8T3mnusSsdusBQkKexKYbt4jwN1FO3JpgRBSC/1HlflqbeAQ0BMH2
         Ac1BBFZAuor2Rxj4PdJnvX4nKNhfNezKaRHFChz/R/QQ0HeyOw7ND/zzKQc6EOhYKUrX
         PNfGT8dLdYIR4Qd0Y17liP4fPKqpnqtKZnDfI+1lhic9uKGMohtdhjunlSWMfV/Qy9/P
         VNq7Y1OFAJVnM1hR5k7TGAXgMeaWpsOZfj2MXCvwXIkcx4GMWY0neKHRQnClWfzVCp2X
         vFKuFyE/QkzFfehv1YJ9M7fqwYtWWne5lyO5EZTBSP6LIOwhobK97TihVb8XW8UmkLM7
         ZhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HnRdlQ0h0XlUHG99ows5AdhjhJM9QeE59ainNDshQ0=;
        b=mNky7CK0emSIdaxEv0oC92kS51kya6WWiZHYBfREEmQxB8eWMP4CCACp/+GcLGP3hx
         O2QylkAtMD2UO/qsbRdQRyTe6Hs8e/0DCC77kqboGLTwJuQEllI7Eb4jdhmecHq/BEAb
         bsBVlf2qpmNbaIgA+OxB4AKN0URwPLEayNmNuQL9tHY4DZMWl89duehfEmv+oQs4xQjU
         9WFPmmkhFRl6OxCIP43PkQ2rPHNt2ISeqY8Z6EYuORHXbzAvW6yrfLRAuekvPSAhv3O0
         iW5WL8Boi6/B6oduC25h/tB44+wBu6UWh/SucPuVRaqzACYrpksZ5whOXe81NuHozXdC
         y6dQ==
X-Gm-Message-State: APjAAAX0XYh35/sTA3WPdKy/LtQsL4mqOu2Gc95PFysEH5KlatIS0Igz
        9BjJPKVBhvbu99ypKytf36GKXGC9VurMXi3GTBs/oX4ynx0=
X-Google-Smtp-Source: APXvYqx8MWHIhBgUcoTqRVcb42RA3HXbe2x83AfKrdsJ0i5sBI2JrcpurPa/DaLOvqivbmpql7Xc9PpPPB6pNI3zjY0=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr23510251iog.78.1567424252712;
 Mon, 02 Sep 2019 04:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190801012823.28730-1-neolynx@gmail.com> <CAHCN7x+nD0J6KZYtfH+0ApQTPO5byO2obMkUwc9Uf4WubyRbTw@mail.gmail.com>
 <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com> <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
In-Reply-To: <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 2 Sep 2019 06:37:21 -0500
Message-ID: <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 2, 2019 at 5:55 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi,
>
> > Am 17.08.2019 um 11:24 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >
> >
> >> Am 16.08.2019 um 14:25 schrieb Adam Ford <aford173@gmail.com>:
> >>>
> >>> I tried to get such code into drivers/cpufreq/ti-cpufreq.c but
> >>> gave up when I found that this is not used for the omap36xx.
> >>>
> >>>
> >>> To me it looks as if this opp-v2-ti table is what we need for omap36xx.dtsi
> >>> as well to manage the speed-binned bit of DM3730. To me it looks sufficiently
> >>> similar to an "eFuse" bit. But I didn't look into the details of the
> >>> opp-v2-ti format, because all that is a second step after getting 1GHz stable
> >>> on 1GHz capable chips.
> >>
> >> I looked into this once, but I couldn't figure out how to interpret
> >> the "opp-supported-hw" entries.
> >
> > Translating the OPP values isn't difficult and I have started a sketch for it.
> > "opp-supported-hw" is indeed difficult to understand. I just have a working
> > hypothesis that it seems to be possible to have major chip variants and minor
> > variants. Major variants get their own 32 bit value in each record. Minor variants
> > are described by bit positions.
> >
> > Since we only have to care about one major variant of omap36xx (unless we want
> > a single OPP value list for omap34xx and omap36xx) and there are only 800MHz
> > and 1GHz rated chips a single entry array with only one or two bits in each value
> > should suffice to handle it.
> >
> > What I am missing in the big picture is how to specify the register address to
> > be inspected and how the bits in the eFuse / "speed-binned" register match
> > the bits in the "opp-supported-hw" entries. Maybe it is done by driver code
> > or needs a separate DT entry somewhere.
> >
> > For the records, we have to read the Control Device Status Register 15:0
> > (Address 0x4800 244C) BIT(9).
> >
> > I'll look into that as soon as I find time for further study.
>
> Ok, I found some time and it is not that difficult, besides several quirks :)
>

 Thank you for doing this.

> We have to define opp-v2 tables and add some config and code to the ti-cpufreq
> driver which reads out the silicon revision and eFuse registers. And we have
> to blacklist the chips in the cpufreq-dt-platdev driver.
>
> Reading the eFuse registers in the ti-cpufreq code is tricky since they are not part
> of the syscon register block like on am33xx or dra7. I have added some ioremap()
> and readl(). It works, but it can be improved in future work if someone has
> a better idea. For the moment I would consider it as a simple and good enough
> solution.

I looked into this once, but I struggled with understanding how the
driver worked.   I am excited to test the 1GHz operation when its
ready.
>
> I have also tried to add the same approach for the 600/720MHz speed grades of
> the omap3430 but have not found a BeagleBoard C4 which should have the 720MHz
> grade. The C2 I have tested with has 600MHz only.
>
> Note that omap3430 and omap3630 have different OPPs so we can not share
> tables.
>
> Another complication is that the DTS have no uniform compatible= records for
> the 34xx. I have found e.g.:
>
> omap3-beagle.dts:       compatible = "ti,omap3-beagle", "ti,omap3";
> omap3-cm-t3530.dts:     compatible = "compulab,omap3-cm-t3530", "ti,omap34xx", "ti,omap3";
> omap3-evm.dts:          compatible = "ti,omap3-evm", "ti,omap3430", "ti,omap3";
> omap3-sbc-t3517.dts:    compatible = "compulab,omap3-sbc-t3517", "compulab,omap3-cm-t3517", "ti,am3517", "ti,omap3";

Based on my screening of the device trees, it seems like 34xx is
appropriate for most OMAP3's which are not am3517 and not omap36xx.
The AM3517 includes omap3.dtsi, but not all 34xx devices.  I think if
that was the case, they would have merged them.  The omap36xx have
some different register addresses from 34xx which I think why both
34xx and 36xx (and am3517) all include what they can from the
omap3.dtsi stuff.  Even the clocks vary between 34xx, AM35 and omap36.
>
> But all ti,omap36xx also have ti,omap3.
>
> So there is "omap3430", "omap34xx" or no definition (or even "ti,am3517").

I don't believe AM3517 have different OPPs.  I looked through the
datasheet and didn't find any. At one time I tried to run the AM3517
at various frequencies based on the 3430 frequency points, but the
operating voltage appears to be fixed.
To me, it seems like it would make sense to standardize on the naming
convention. (ie, make omap34xx boards and omap35xx boards, explictly
state omap34xx, excluding the am35xx unless we want add extra stuff
for it)
> This makes matching the ti-cpufreq driver for either omap34xx or omap36xx difficult...

If we add omap34xx to all non-36xx boards and non-am35xx boads, the
the check for the compatible flag in the ti-cpufreq driver be based on
looking for "ti,34xx" and "ti,36xx" .
>
> Finally, I am not exactly sure about if omap3430 and omap3530 are really the
> same for the eFuses and silicon revision registers and values...

From what I can tell they are, but hopefully someone from TI can confirm.
>
> BR,
> Nikolaus
>
