Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C31F13198E
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 21:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgAFUoR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 15:44:17 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35613 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgAFUoQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 15:44:16 -0500
Received: by mail-lf1-f65.google.com with SMTP id 15so37285836lfr.2;
        Mon, 06 Jan 2020 12:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D8SxFdt9jISzNetnnsH1lMAgv8lyKOQwHB2r8WTXUdM=;
        b=UG33oSPB6PPiOotijCTFZ7W0UXPFTzPrDRpgxNLK5qxHuHUxk4D8B590P+S5cc/DEA
         fun2TOQSmt4PlDc3gJOw6UzvLrWecqtS9YOVOavdRMRdhbOd5vAAbOG8vFXTuF0XXPjz
         soFFZZUKbPBw69x7ADFNty/ji/GMbzdGlupR8OZk9TODmNgaqK7KzlE2hpPQumDM+2Mk
         g1Ub6tfzsztc6WG5yDnxr7amOrRKcG8/ZGuLDOkhOrK565c3lwV3wG85CxC5pYqEmxu6
         QdYLar7++FAW/mAO/IgqK+2YJBOBKvepNVfUbNfZWLDx/USMo4PL1d8mBsuxAlQjAtbL
         KDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D8SxFdt9jISzNetnnsH1lMAgv8lyKOQwHB2r8WTXUdM=;
        b=tumdtENro3CMNuMTBXv3Tkih6dkUviDHhwTjCg5SgFtouoy+Edv9Iu7Da1tdjaSao6
         gccekoBK4qgmr3Vy7rYNozmXyTYXQ7vx9P2XZQ8wNfIEHgUdSjYvracRmMVDKTVNrb+d
         V3Nos2dfFSqptnYPDlB3Wdyjftix/vnfeXRj+CEYY3wZOibbcsFUPLvYISKbxNWWNTvT
         LKqshNxxCd9Wb2DDQ+UgmbMdRqo1eUHsu398TECJYrgfKdb76PkyM9lWCJhOKDNswdOY
         7O9T+yGOEkhp1hxsjbmkinJLZEJgQd+T363DRZmSPoh/RbLCTGIwn/S3n0utdM0bzOxn
         RNuA==
X-Gm-Message-State: APjAAAUOuMyLw+wZuTlg5bAHf7fipTnmPNMiwHv8LXNGM8q85djfAlMP
        RUQ+g7YiG2QFkBlOiE34YOaOPZhfon39rlcEeWw=
X-Google-Smtp-Source: APXvYqwg0sCQRcS/njp48Fjz1lVkjVNxDGI5Rh0vPiTBI6wWiAw5TMfWBmf64k4JfLjpgpiyy7ybrDD3zpd5gqVC9wQ=
X-Received: by 2002:ac2:44d9:: with SMTP id d25mr59989849lfm.15.1578343453433;
 Mon, 06 Jan 2020 12:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20200106130909.7697-1-matwey@sai.msu.ru>
In-Reply-To: <20200106130909.7697-1-matwey@sai.msu.ru>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Mon, 6 Jan 2020 14:43:46 -0600
Message-ID: <CAOCHtYgyN+qXXX1YeEcO+nvRFrAL1HAVVMvjfeJ5nvxVjtFKtg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am335x-boneblack-common: fix memory size
To:     "Matwey V. Kornilov" <matwey@sai.msu.ru>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 6, 2020 at 7:10 AM Matwey V. Kornilov <matwey@sai.msu.ru> wrote:
>
> BeagleBone Black series is equipped with 512MB RAM
> whereas only 256MB is included from am335x-bone-common.dtsi

FYI: While all versions from the factory are 512MB, some 3rd parties
offered 1GB reballing upgrades..

and the SanCloud variant which uses this file, was built with 1GB:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-sancloud-bbe.dts

>
> This leads to an issue with unusual setups when devicetree
> is loaded by GRUB2 directly.

It's a miracle, since when did GRUB2 gain this ability?

>
> Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
> ---
>  arch/arm/boot/dts/am335x-boneblack-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> index 7ad079861efd..91f93bc89716 100644
> --- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> @@ -131,6 +131,11 @@
>  };
>
>  / {
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>; /* 512 MB */
> +       };
> +
>         clk_mcasp0_fixed: clk_mcasp0_fixed {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
> --
> 2.16.4
>


-- 
Robert Nelson
https://rcn-ee.com/
