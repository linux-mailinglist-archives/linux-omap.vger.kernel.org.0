Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C162132E85
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 19:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgAGSc6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 13:32:58 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36054 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbgAGSc6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 13:32:58 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so624912ljg.3;
        Tue, 07 Jan 2020 10:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5yQ/2RN1Cvw3xM3qW2gJqwdhulzSTGRTZcA4yZwm3ec=;
        b=szuMX3AMHYI0gSMY6RihsVSowNacVcfSjmGJO7Syk9LEwBnI+H7cvhmHchoj6oPnpf
         CQgUt6FfdHpM9YDs9NRCCuvW2lMoxK8IfABvzZg2oAiIVrSeo8yp1de76qAwMtpnd3jo
         KaAhWqFzKl8W65Ih9gTzURdlbNYLjD6YZvZ+odOSnsTzz9MURnl4L9DPAZrV+U8nTs7Z
         HlH6YSQMlCDQEVt6lbIkSHxSiUHBI4PTZKt0jROYhjeLpny38tsMc1JVRvxWWWhx8oiF
         oE8UUJnja9w5sFmrmhZ/FtRNuGJMcWzOu8XvHG4zqrRNZCDoFTDshhJ4CZwndmt6lgZz
         7sNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5yQ/2RN1Cvw3xM3qW2gJqwdhulzSTGRTZcA4yZwm3ec=;
        b=IfkHpe5d4tivewWodnZ+xSK4bd0I39XfEI/iu2xlGtXiVGR8BeLir77ymdfKzlFjH9
         kaYzarWvHYnkPxCGHUuCFA7lX/NhrpSwvcw9uu2SPpCYOnpIuwklCwNARuCURgwoImcm
         ru/sYYHXsmPgsCPDnhl4LM2sOLlIgxdwX6WZNfu5aIvf/V6spkI2xKRrmSjVbcM9cBD3
         fBhRjHc1uWMuoKF6v1wMU3fpe2JdPvgzO/7kMzSBzeOFCrOeMALwuwB8oynMSdEfMri3
         8R7CKybDMA/DdJR03t0Bmi6jbbwH2wJauznhAi2/g8F0QUbsgM4mowZx5RhxL6zXHtMe
         El4w==
X-Gm-Message-State: APjAAAXK8YE3SV1weHjp2obpxUY8tNDHuSgH0YgwR4RjV4t87AITZP+I
        TYoddXNKdSbxZ5rLpbyk0/b4iZB58NEtNQb1FVk=
X-Google-Smtp-Source: APXvYqymzxa0E0fR2E3OuAmc/FP9tlpw0cmDmDeoe9mooWQr78VIdEE1uYFCuSRmYe08wrAPc9giPkKWA8L17KRVvGg=
X-Received: by 2002:a05:651c:1b0:: with SMTP id c16mr510355ljn.236.1578421976485;
 Tue, 07 Jan 2020 10:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20200106130909.7697-1-matwey@sai.msu.ru> <CAOCHtYgyN+qXXX1YeEcO+nvRFrAL1HAVVMvjfeJ5nvxVjtFKtg@mail.gmail.com>
 <CAJs94EbUL6o9sM+pwxwpqHVDkFqy7wFRirET-Vq3SNVd3grUsA@mail.gmail.com> <20200106210509.GF5885@atomide.com>
In-Reply-To: <20200106210509.GF5885@atomide.com>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Tue, 7 Jan 2020 12:32:30 -0600
Message-ID: <CAOCHtYhKUyUwunnWDT1CuRTpzS78d7xKq3qB3Phys7RgUZnM3w@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am335x-boneblack-common: fix memory size
To:     Tony Lindgren <tony@atomide.com>
Cc:     "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 6, 2020 at 3:05 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Matwey V. Kornilov <matwey@sai.msu.ru> [200106 20:48]:
> > =D0=BF=D0=BD, 6 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 23:44, Robert N=
elson <robertcnelson@gmail.com>:
> > >
> > > On Mon, Jan 6, 2020 at 7:10 AM Matwey V. Kornilov <matwey@sai.msu.ru>=
 wrote:
> > > >
> > > > BeagleBone Black series is equipped with 512MB RAM
> > > > whereas only 256MB is included from am335x-bone-common.dtsi
> > >
> > > FYI: While all versions from the factory are 512MB, some 3rd parties
> > > offered 1GB reballing upgrades..
>
> So what's the conclusion, is it safe to bump the default size to
> 512MB then?
>
> The custom ones could use their own dts file if bootloader is not
> setting the RAM.

Yeah this is safe for factory devices. Classic u-boot will update
these for modified boards.

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
