Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43A1010CA55
	for <lists+linux-omap@lfdr.de>; Thu, 28 Nov 2019 15:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1O0h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Nov 2019 09:26:37 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:44429 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1O0h (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Nov 2019 09:26:37 -0500
Received: by mail-io1-f65.google.com with SMTP id j20so29073966ioo.11
        for <linux-omap@vger.kernel.org>; Thu, 28 Nov 2019 06:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+WjteUAT998rOCBDNGJh8RPbUATg9wdwPU0Ze60vXw=;
        b=Jku9iG4ITdUeUkhF4WxOecCJ88cazu+6j5ud1xmQ24nfAWy1nnaXyJrYSlXadE+hHp
         3HZmCLOb50wdfLt7uPMpjUIoloLzfk38h7uRAkEfPCKuxUM1vLUynEs/BKE4ZAxSGDtP
         lrUAxiXkr/v6RgMmqicajSyX4wUxr34zpGX0Gq8sP16gFMXQ/VNtdlPw/B7IXEnP48BT
         mbh+nqvymHg4hZ397aq000Zzx5c8RblVctjWL4fd16OmTIFUtd+2m5vhwceH42eD/931
         WLJPHu/mveK28QYD2gQoXuVgUUTSsd78V3nYtpqEFA3xRHW4Ny+5B27Bm0IW76RLNwJl
         NVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+WjteUAT998rOCBDNGJh8RPbUATg9wdwPU0Ze60vXw=;
        b=ZcDjARskuAJsLSIlZfGCrbFf1SPghW3183cNkTHWRcnqqvdnAV3ZHoapGdAB5vAiqA
         7Euw4ZoNcDzWLXGlVfvjbq6E3You+MEWgfdB1RgDKfY+84MTpFBBAtWx+TJAzFH/9+bv
         9dXje9Ra7k5UKJIqteipJki50KmBYQ9jPRGCcMeS0EBQ4Vf28kzv5poxyrlugvQC6mEe
         grpmFrZqLW9mnwr6Aj5rxyOOo2UqM7sY4RiYCnDtQFg+1pvhcQVOfD5IBe7ly3cEi35z
         CnKs1wNCowsc8Xr2q2LaSiL+LdHwJwbYNH2qw4UyllmJsTEGUrEtKE31gPsOXIYU2/Dt
         KV0g==
X-Gm-Message-State: APjAAAXv6InlPpqs5yaXV4c3aXxJRI8pI+er41/FoQsB4080O8vJg1WZ
        AGh14hr7KHXRl+v/psotILGnkscl+BsFCnquEPc=
X-Google-Smtp-Source: APXvYqxrmmSnigHVjjJZQgdGqSiBjsg8TQuFven5eYUVYvOTCryr13wP6HsHOAxLWzC7fRfKp+oKvuRXxCxWWpO+sKU=
X-Received: by 2002:a02:3309:: with SMTP id c9mr10332526jae.52.1574951194334;
 Thu, 28 Nov 2019 06:26:34 -0800 (PST)
MIME-Version: 1.0
References: <trinity-3f97833c-0914-4f86-8e16-2bfb4ad6dab3-1574862737086@3c-app-gmx-bs22>
 <20191127161909.GA35479@atomide.com>
In-Reply-To: <20191127161909.GA35479@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 28 Nov 2019 08:26:23 -0600
Message-ID: <CAHCN7x+QX=P6b0JnsARK_pzbMjupwMy71JHEWi1NMxAmDLG6wA@mail.gmail.com>
Subject: Re: twl: not initialized and twl6030_uv_to_vsel problems
To:     Tony Lindgren <tony@atomide.com>
Cc:     deffo@gmx.de, Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 27, 2019 at 10:19 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * deffo@gmx.de <deffo@gmx.de> [191127 13:53]:
> > hi there!
> >
> > i'm using the TI OMAP4460 (VAR-SOM-OM44) and i get several errors in dmesg on the latest for-next branch:
> >
> > root@localhost:~# dmesg -l err
> > [    1.146026] twl: not initialized
> > [    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> > [    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> > [    1.146179] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> > [    1.146209] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> > [    1.146270] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> > [    1.146301] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> > [    1.146331] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1410000 Vs max 1316660
> > [    1.522979] omap_dm_timer_set_source: timer_sys_ck not found
>
> Sounds like something needs fixing for sure. Similar messages seem to
> appear for all omap4 with twl PMIC.

Something similar happened to the twl4030 on omap3.  Check out the fix
for it:   https://patchwork.kernel.org/patch/11094653/

It't not exactly the same, but It might be useful in fixing the twl6030.

adam

>
> > which probably leads to the problem, that the cpu cannot run with more than 920 mhz. is this a known problem?
>
> Yes, see the drivers/cpufreq changes recently done for omap3:
>
> $ git log v5.4..3fbeef397212046cc514fe9fcd07e67e6ca32163 drivers/cpufreq
>
> Similar changes are also needed for omap4 to detect the supported rates.
>
> And then we also need to add a regulator controller driver for cpufreq
> to use that manages the voltage controller.
>
> > i need to run the cpus with 1.5 ghz, as it was possible with the v3.4 kernel, how is this possible?
>
> My guess is that v3.4 was missing some critical checks to protect
> the SoC :) But please do check, maybe we're missing some code that
> was there earlier.
>
> Regards,
>
> Tony
