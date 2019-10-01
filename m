Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BD4C352B
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 15:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732653AbfJANHB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 09:07:01 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35182 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJANHB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 09:07:01 -0400
Received: by mail-io1-f68.google.com with SMTP id q10so47791756iop.2;
        Tue, 01 Oct 2019 06:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cp/Wd/WE/qtr58O8CIKrw9xVR0kc+YHnKSoI3k7iFoE=;
        b=Xw20c9x/ImWA3eDRYwl/LwBt2HDNu6d0CSqz66wAfceNHwcGfaIBxzWI7v++Q45UOp
         bQhuuCLYn2+LvT73H5QjKXlAJnMBGUjW9gfaJZHOtObCuN9lhE7tKWCbjKBTkXh/jgVv
         EHnYEkMqRNKO3COsBT3KBCxAv9jcWCdvnBXN5HjOcckRbFqhWShAjDpTPs0N5+N9CqDn
         L6mRFPLordUGYgnZp3SaQYbHv5yHuF5zpR1N7ANQWRv+L0lphq4V+CauZgtP+Cxr7mMM
         TQsPctgyzXvt/WkvHGlKfIq30rmk2ASytzv6RU7aj1+LISKDIw34ggx0+DylGkPjxPa4
         tSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cp/Wd/WE/qtr58O8CIKrw9xVR0kc+YHnKSoI3k7iFoE=;
        b=HWH7HVLu6M5EGbRUOBYPva3mP98Zqxy1yOqmeeLi8gXowiSwLCOnpFnK6t8sTD+q1W
         xJf3TpCtbojdWc5g1TjLOInf67YfFJlKZxcTP4DAO4yw8x2qfZyIcd584Lk076FTPkPV
         oYZD0ZbVnvT0Mj4i0/adW5wDinPVMQ3sJgY8jDaQQuSQoQ52OZrMW+wY+t4UF8FJsDxC
         RsO/lM0MKTKEkh8yNyymROg5x4HFkHYMTkFYcU3FhkMnQzUeUUHDA2bbc0c8+ZygR2vX
         yisrztk54GzzQy6yzSm+tlNQqtUP49DZO3XGqZKh5OKmv+E1ZiPRmFbfaAsazAy1dOWb
         XK5Q==
X-Gm-Message-State: APjAAAURn5EJU5gynUtr+pAGh8/uGkJin5dXMSuY4SQeO9lHrIfenx60
        VVHfY95DwDLxV3zpwFLCbWopTkrlwfcptOqQYJ4=
X-Google-Smtp-Source: APXvYqznkJDopjamhtmxc1W8n98xjkqIiKBEnHNL6qVQXQ78v+UpGJqNIQdhGxnLExPr/6/bClFut0YBHttO9x5dH3w=
X-Received: by 2002:a92:3f0a:: with SMTP id m10mr24812690ila.158.1569935218649;
 Tue, 01 Oct 2019 06:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
 <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
 <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
 <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
 <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com> <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
 <CAHCN7xJNJca8W_yw5nNY3AmKDSPoLzJ8voPmR1HS3bNcU8uQGg@mail.gmail.com>
 <6cd7c9f0-cb26-588b-dfd1-faf462732549@ti.com> <ec718740-bb8f-0d31-3622-89a62bd8fede@ti.com>
 <202ae3b3-f72c-5b5b-4344-be22c8368cc7@ti.com> <f01bf6ec-e531-371b-4f66-312b12379273@ti.com>
In-Reply-To: <f01bf6ec-e531-371b-4f66-312b12379273@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 1 Oct 2019 08:06:47 -0500
Message-ID: <CAHCN7xLbcQGEEVzLgP3MTp_ej0JnSdOXMgULt4EVSg9B+AjPdw@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 1, 2019 at 4:31 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 01/10/2019 11:12, Tero Kristo wrote:
> > On 01/10/2019 08:07, Tomi Valkeinen wrote:
> >> On 30/09/2019 20:48, Tero Kristo wrote:
> >>
> >>> Hmmh, after some testing, it seems there is bad stuff happening with
> >>> the divider clock implementation, I am re-working it as of now.
> >>> Basically what is wrong is that with a divider max value of say 16,
> >>> the driver attempts to craft the max value into a mask, but this ends
> >>> up being 0x1f. If the max value is 15, it ends up into 0xf which is
> >>> correct.
> >>
> >> Ok, that explains the max not working.
> >>
> >> It doesn't explain the other issue, where the TRM says the max div is
> >> 32, but it does not work. But taking the max div from the old SoCs,
> >> 16, is not correct either, as it seems that dividers up to 31 work ok.
> >>
> >>   Tomi
> >>
> >
> > Ok, attached a series that hopefully fixes it, any testing feedback
> > welcome before I post this properly.
> >
> > This also supports omap36xx dpll4_m4_ck divider up-to 31, other omap3
> > family is limited to 16.

Thank you!  This works for me.

>
> Works for me. This also needs the change to dss.c to change the max from
> 32 to 31. I'll send a patch for that separately.

Tomi,

Do you want me to push a patch to remove the
CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK hack once these patches have been
posted?  It seems like the divider fix eliminates the need for this
hack.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
