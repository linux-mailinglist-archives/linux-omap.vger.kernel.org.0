Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC54B00A8
	for <lists+linux-omap@lfdr.de>; Wed, 11 Sep 2019 17:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfIKP4X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Sep 2019 11:56:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37715 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbfIKP4X (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Sep 2019 11:56:23 -0400
Received: by mail-io1-f67.google.com with SMTP id r4so46972661iop.4;
        Wed, 11 Sep 2019 08:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mzTiwpJgDw1EATMRIrpLBFsul5Dt2y/EocbWcXzqDUM=;
        b=p3acxjl1SUpYGk4WZpSQ5CYEdDy0jwrmceX1Dvu62YVs/ugom+Z37BMY/CLbo+pxIm
         fJw4t7nHUrbxiyc+ZTa0myoSgxD0eo21B2x8snthbA0KmtYKugZxjirLRYVHOL2iHVL8
         tbNof/c70lpxHEnmqrf+rucXWFZIRRPjNFF5x8d4DR4hy+vSjtkFB3hBVB+2z3mASwxQ
         SIyB/ITsw188Ylh4hWQy1vCABgPsqSDk9ZEX3dnzCngiww+mG0FjKQu4BfV0oBYtUcy2
         49gITuuMkF8TrTQcsZazlcTWK8pfD5RUpyGOfhuHWsRBdbMmFCTaOIY4cl3hmLWnaRQ1
         J4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mzTiwpJgDw1EATMRIrpLBFsul5Dt2y/EocbWcXzqDUM=;
        b=aSLsRAaITaCmZt77ruSvow2Hk0UComKdLC5ksmYm32Uq3T7u9+bHic9X7ntxjDcdc7
         SHTDhxO+DxoqDm3Y2Hg3Zi9qAiqqPvCCpfrZHsxxzqIYbI+67shZpecmChwH/y7vk4MA
         VeLSBLEJlpp7Bu3lgwKQFtjKAuiTyk+X6Wz2ku7fsuiWiYys/js+1c2vdYwyPIOOEjZ1
         yqNwtA3mhwIFK6+e/42JU/2PeGQqZpVhRWrYNRjHrFtIddekhufS6AAIuBg5UsF+Syjh
         AKuQqsOHY+uuKcGN37PWtn3IluZBTLDuKIQRS/8agBWKDN8vQ3APa7zURz+SB1GNYi4l
         du9w==
X-Gm-Message-State: APjAAAWPYwzPUHSIZfHV0uUlUnWHB1+I2cWBqxHxi48Q0rRRG5FiV7F6
        aEXnsxZTYQKOH1pzXMyf1WXho81seYd2wS55KJQ=
X-Google-Smtp-Source: APXvYqzQ9onGKMmPm/d8IIryqyE4ifCfZ2jZZCYtYiAh2ArfhJOawrRH+g9queC7rLFvpIf61xhYSeZGnAzjZ6O37iw=
X-Received: by 2002:a5e:dc47:: with SMTP id s7mr1717770iop.228.1568217381892;
 Wed, 11 Sep 2019 08:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <C04F49BA-1229-4E96-9FCF-4FC662D1DB11@goldelico.com>
 <CAHCN7x+Ye6sB_YqO0sAX1OJDw64B-qGS3pL545v3Xk5z914cwQ@mail.gmail.com>
 <0C1EF64E-B33C-4BFA-A7D3-471DD1B9EE86@goldelico.com> <515048DE-138D-4400-8168-F2B7D61F1005@goldelico.com>
 <CAHCN7xLPCX9rZ0+7KVBiA_bgZ6tg6VeCXqD-UXu+6iwpFMPVrA@mail.gmail.com>
 <7B3D1D77-3E8C-444F-90B9-6DF2641178B8@goldelico.com> <CAHCN7xLW58ggx3CpVL=HdCVHWo6D-MCTB91A_9rtSRoZQ+xJuQ@mail.gmail.com>
 <FA2920FE-B76A-4D44-A264-862A1CCBF7FC@goldelico.com> <CAHCN7xJsPa0i+Z+qpCkWcdAh9+udmGT0RPNchdDsfB=8ptd3Nw@mail.gmail.com>
 <87420DBD-770F-4C32-9499-A3AEA5876E8A@goldelico.com> <20190909163236.GP52127@atomide.com>
 <E001F74D-724E-4C50-9265-CBD33C4F2918@goldelico.com> <F8F08882-8011-441C-9581-ECCE9772EC21@goldelico.com>
 <CAHCN7x+fgtMHMNYU2W7BRQwd-d2g_Tb8-L5QNcnZjCF=VzRXJg@mail.gmail.com>
 <3663B13C-1AAB-4BE3-8CAD-F821B70393FA@goldelico.com> <CAHCN7x+mLCNq4evwGZfk6Ka=3o6EzhL=s38aNdukyLwKB1xO7A@mail.gmail.com>
 <56482888-DBD3-4658-8DB9-FB57653B5AA8@goldelico.com> <CAHCN7x++uBzYx0cK4K6CY6aveofti5TVXnqEeNKnGBy_fzm5GQ@mail.gmail.com>
 <CAHCN7xLPZisrNk==eF-+V8hD+sceQq25qw+sK7vVZAYdd8=Q2Q@mail.gmail.com>
 <CAHCN7xL59cXgbe1YTbNvTjptO9bMnuxprCP7ok5kRuc8UO9Fcw@mail.gmail.com>
 <D7B54A39-D8A3-4EDF-8B47-66D59319B3F4@goldelico.com> <F65E947E-784A-4540-B926-BF3ECB0C01EC@goldelico.com>
 <285FED38-2B2B-4813-9FD2-396C53E9B1B2@goldelico.com> <CAHCN7xKyTnNojwRqsXcE1AsDKtJikBpXoUo8ED=89ZR9-ko9hA@mail.gmail.com>
 <65A23326-70B4-46E3-992D-74256B056900@goldelico.com>
In-Reply-To: <65A23326-70B4-46E3-992D-74256B056900@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 11 Sep 2019 10:56:10 -0500
Message-ID: <CAHCN7xLGx0S3xyd0q-N8pgY8VdBbUUaJdgoxkKxakR59sH+zXQ@mail.gmail.com>
Subject: Re: [Letux-kernel] [RFC PATCH 0/3] Enable 1GHz support on omap36xx
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Sep 11, 2019 at 10:46 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi,
>
> > Am 11.09.2019 um 14:43 schrieb Adam Ford <aford173@gmail.com>:
> >
> >>
> >> I can also see that there are transitions on the voltages (reg.8 is vdd and reg.3 is abb).
> >
> > I concur.  I have good results with the added ti,omap-opp-supply entry.
>
> Great!
>
> There are some subtleties for testing.
>
> * I have added turbo-mode; to OPP6 / OPP1G
> * which means they are available but not used by the ondemand govenor
> * to enable them one has to echo 1 >/sys/devices/system/cpu/cpufreq/boost

Will that be documented somewhere? If not, can we put a comment in the
device tree so people know how to enable it?

>
> Testing is also easily done through cpufreq-set -f 800m or-f 1g
>
> Then I can see the microvolts change and also registers
> PRM_LDO_ABB_CTRL 0x483072F4 bit 3:0 1=bypass 5=FBB
> PRM_LDO_ABB_SETUP 0x483072F0 0x00=bypass 0x11=FBB
>
> I have added both of this as descriptive notes to the commit messages.
>
> What I have to check is if it behaves as expected on a dm3730 without
> 1GHz rating.

I already tested it.  From what I can see, it's behaving normally.

>
> > I noticed the FIXME note on the omap36xx.dtsi file where you added the
> > vdd-supply reference.  For what its worth, I searched for a list of
> > all files that reference omap3630, then built a bunch of dtb's
> >
> > make `cat dtb-list` ARCH=arm CROSS_COMPILE="ccache arm-linux-" -j8
> >  DTC     arch/arm/boot/dts/omap3-beagle-xm.dtb
> >  DTC     arch/arm/boot/dts/omap3-cm-t3730.dtb
> >  DTC     arch/arm/boot/dts/omap3-evm-37xx.dtb
> >  DTC     arch/arm/boot/dts/omap3-igep0020.dtb
> >  DTC     arch/arm/boot/dts/omap3-igep0020-rev-f.dtb
> >  DTC     arch/arm/boot/dts/omap3-igep0030.dtb
> >  DTC     arch/arm/boot/dts/omap3-igep0030-rev-g.dtb
> >  DTC     arch/arm/boot/dts/omap3-lilly-dbb056.dtb
> >  DTC     arch/arm/boot/dts/omap3-n950.dtb
> >  DTC     arch/arm/boot/dts/omap3-n9.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-alto35.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-chestnut43.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-gallop43.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-palo35.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-palo43.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-summit.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-tobi.dtb
> >  DTC     arch/arm/boot/dts/omap3-overo-storm-tobiduo.dtb
> >  DTC     arch/arm/boot/dts/omap3-pandora-1ghz.dtb
> >  DTC     arch/arm/boot/dts/omap3-sbc-t3730.dtb
> >  DTC     arch/arm/boot/dts/omap3-sniper.dtb
> >  DTC     arch/arm/boot/dts/omap3-zoom3.dtb
> >  DTC     arch/arm/boot/dts/omap3-gta04a5.dtb
> >  DTC     arch/arm/boot/dts/omap3-gta04a5one.dtb
> >  DTC     arch/arm/boot/dts/omap3-gta04a3.dtb
> >  DTC     arch/arm/boot/dts/omap3-gta04a4.dtb
>
> Quite a lot...
>
> > I think it's probably safe to leave the vcc-supply there, but you may
> > want to add a note that users who do not use twl4030 should add
> > something to their device tree to specify the vcc-supply.
> >
> > At this point, I doubt anyone will do new designs on omap3 SoC's.
>
> Well, I am not sure if there are out-of-tree boards with omap3
> where we could break everything. I know of at least one such
> board.
>
> Therefore I have looked where the cpu0-supply vs. vdd-supply
> is decoded. It turns out to be also the ti-cpufreq driver
> which we already tweak for omap3 support.
>
> So I just have to modify ca. 10 LOC to add this "cpu0" to the
> SoC description tables and process it once during probe time.
>
> Then, it works with unmodified board.dtb
> defining cpu0-supply = <&vcc> or whatever regulator.
>
> The only question that comes up is if this change is am3517
> compatible. I.e. can we still use the omap36xx_soc_data for
> it as well which now expects two regulators... So you
> might now see an error message that cpu0-supply and vbb-supply
> are missing or not the right number of regulators is given.
>
> We may have to add an am3517_soc_data table, but that would
> be straightforward now.

I will run some tests on the 3517 using the 3430 table instead of the
3630. I didn't look into great detail as to what the tables do, but it
might be sufficient.
Otherwise, I can copy-paste the 3630 table and change the
multi-regulator off and test it that way if you'd prefer.

Let me know your preference, and I can do it.

>
> >
> >> so that you can inspect/compare/test/check before I tidy up and add
> >> the patches for our OPP-v2 patch set.
> >
> > I think it looks good.  Maybe Tony and or TI people have some
> > comments, but it appears to set both regulators now.
> >
> > Nice job!
>
> With your kind help!
>
I am glad to help.

> Now it's time to wrap up and post a new PATCH set version for
> review.
>
> Best regards,
> Nikolaus
>
