Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160C6C0538
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 14:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfI0MeD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 08:34:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35407 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfI0MeD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 08:34:03 -0400
Received: by mail-io1-f66.google.com with SMTP id q10so15924941iop.2;
        Fri, 27 Sep 2019 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k7d51AEqyE848wkPOLeJprFG9jyWEBZYHtKze/WYS4w=;
        b=OkcngvAZiKPfuIboTpBONfv7BLGF5R/Iq4MnzDRe5U13ORHYdP24mC9azh4Zc/Cd5Q
         zjc/eFi7DxQTt2gfFVEGlz4Zxs03GBIbzFDE/3rK5RvUDj+A1zGCnRrN8YdAGLoBwyRD
         1SvsdCK0DQMAlsxjPDLcx8NpJ9PfZHFCDWlVx7XQv3ibTNAxJPUr7lXN4J+IqpwsMP11
         p5RjNdSw0K+Uj7oL3izhL7pOv+40rEefZwUOMJ8fmBPf5BGQi2sSODcTOMGyjm7Sz/eq
         5EylEn4Z6pYPsCxYY6hFmT/ZqrXxPPjxDhE/2yuR1xYG5IQEnERXL9KfdKmKsrdBRBc9
         YitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k7d51AEqyE848wkPOLeJprFG9jyWEBZYHtKze/WYS4w=;
        b=q+ZebEUd7m48RhuhAGXkCklAdkzML6YldMLvtl9qZW+eq/apG7DLqqTWTfdXW2uLgE
         l7n/sQqTij8ZPnHjfmIkTYbrR5RiLsniskLDUxyvbEANzi1ILr1nF7Rf0TT9v0SfTz87
         4jgigatlCNARCvhlZoGTiTG5s+XDr9kb76gdg20m1nzPO459wHVKgeY3B53HRu6F7+9m
         /hiOPBpBKOetq6OJFaVv7ji2Chysrqt7V/cADFBzMDneKCGI7gkFTwMqjRBSVrhhRXHu
         tP2CTgoPIHM4waG6CtkwNJPEXdpI0riCAPNiX3gmP6D8MqV0LYBCxv9oP1Pbd+ucDrIQ
         v+MQ==
X-Gm-Message-State: APjAAAWg27+b2cN94s9bjTVZSWXF1jciqJR2ul4M/qULRoKeLXURu6UV
        G4haxGb3i9Mhqk/yDKBVQKVxpIMs5Vp0D439g6Y=
X-Google-Smtp-Source: APXvYqyUHMQeWPmJ5lzBV5BB3t5fjqgkf5iuXKrGK12pwMzKhwgqK7OWh4iVg4iwmB77u1+QNcYJGNuPXVDMXoOrZuo=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr7682327iof.58.1569587642060;
 Fri, 27 Sep 2019 05:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
In-Reply-To: <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 27 Sep 2019 07:33:50 -0500
Message-ID: <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
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

On Fri, Sep 27, 2019 at 2:55 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> (dropping folks who're probably not interested...)
>
> On 26/09/2019 17:12, Adam Ford wrote:
> > On Thu, Sep 26, 2019 at 1:55 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> >>
> >> On 25/09/2019 23:51, Adam Ford wrote:
> >>
> >>>> Has anyone debugged why the hang is happening?
> >>> I started to debug this, but I got distracted when I noticed the LCD
> >>> did't work at all on modern kernels.  I have that fixed now, so I can
> >>> go back to investigating this.
>
> I dont' have the same board, but I was testing with omap3 beagle xm. I
> can reproduce rather similar issue, although I don't get a hang but
> instead sync lost and underflow flood (which makes the device unusable).
>
> It looks like a bug in omap clock handling.
>
> DSS uses dss1_alwon_fck_3430es2 as fclk. dss1_alwon_fck_3430es2 comes
> from dpll4_ck, and there's a divider after the PLL, dpll4_m4_ck.
>
> When the DSS driver sets dss1_alwon_fck_3430es2 rate to 27000000 or
> 27870967, which can be created with m4 dividers 32 and 31, it looks like
> the divider goes to bypass, or to a very small value. DSS gets a very
> high clock rate and breaks down.

Is there anything I can do to help troubleshoot this?  I could insert
a hack that checks if we're omap3 and if so make the divider equal to
4, but that seems like just a hack.
I can run more tests or insert code somewhere if you want.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
