Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA211DD05A
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 16:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729764AbgEUOmR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 May 2020 10:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbgEUOmR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 May 2020 10:42:17 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09C6C061A0E;
        Thu, 21 May 2020 07:42:16 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id c16so7694836iol.3;
        Thu, 21 May 2020 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uMf5PSS8v7h+lqCLsnwmzDp+h/BmZ4e0wPer6Vr2cGs=;
        b=NFYhck/AVQ4UWSacJe7ENhzPcbR6sO8iACNZjErSdvwJ9wrqZ9RJFZ6QenBhe562aP
         KfxW0cYjDNR4FLotUvUydBbfp3XT14Bk4PiwBWPOSV5h3DPQYpMd5VYt5+adDW8P78L/
         J5y0pJpf1c0Wt+K5URdoBKLM+JlcXXdbM/ZLd935cpJUasiNfXGfxb1rYepad6dYah8p
         LeTySwVr6Y4japUvkuFylk3x0yGdsHwJv/VVce+PDL/h9F/Xon80FOzJMA23VS1xgS34
         h/l/ignBWZh7FA2s8tCDV2906hkU9GTarwXvq9AOjun/QP6IKSHPTzUOfpZPpHs5mrEH
         Si2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMf5PSS8v7h+lqCLsnwmzDp+h/BmZ4e0wPer6Vr2cGs=;
        b=g2d/ep2F3OvwVODjoFgxD+I6AST6x7OvWCduUvlWkeAqK7l/mB/V4Ckx8DT7iQrmPT
         CZCTnK99GljrtHHCVWSJCYfndFRbahyzXcfjxE3OhCel1+AM0QBD2FHU2KccEIUkgsGY
         NDQky1Wo0SeQ2RI1F5Wfci9ZUggm1C/Y1zcfkiXFO7uX4EM6JeqSlRq2jDK94n47bSIa
         Dqi2MISJVjQlyBk13KUPrjZwggNSRk2nf3REmpXRWhtkbWyei6wTLLTXPCmuEItE88oz
         g2JpVG2WG8eUnNpHESg4lkZ5VlxHteP2ZwtHgjOwpaKfwWzTcLoQFr6MZXpABpv/Pzmy
         Fmpw==
X-Gm-Message-State: AOAM532ISirrC/IczdVL54BfA535R3blAc5Zb5ib+bvFwLvIl6LCcDuI
        G2gex+RRu/h5dizPxC2IT/JRAfSes8TWDz9nhVw=
X-Google-Smtp-Source: ABdhPJzmmoAtqvKiSRzzQdvPOdNku2+q8onAHYeKer64fb+YIN0nrWX+l4VWuyicyEo2/tLD9Pf2CRLDktLkJDnboNE=
X-Received: by 2002:a05:6638:118c:: with SMTP id f12mr4230733jas.6.1590072135956;
 Thu, 21 May 2020 07:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200520214757.GA362547@x1> <71dbf4e6-e65b-f001-319c-0b354f675568@ti.com>
In-Reply-To: <71dbf4e6-e65b-f001-319c-0b354f675568@ti.com>
From:   Robert Nelson <robertcnelson@gmail.com>
Date:   Thu, 21 May 2020 09:41:50 -0500
Message-ID: <CAOCHtYiw2jJuzbnW02FUmPy-xmmtErMmow46QQJUMs0VtX=cKg@mail.gmail.com>
Subject: Re: [PATCH v2] arm: dts: am33xx-bone-common: add gpio-line-names
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux kernel <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> Not sure if it should be in am335x-bone-common.dtsi.
>
> For example:
> am335x-boneblack.dts
>   #include "am335x-bone-common.dtsi"
>   #include "am335x-boneblack-common.dtsi" <-- hdmi defined only here

Ah crap, yeah that's a good point.. So if we stick it in...
am335x-boneblack-common.dtsi

Then the Black-Wireless now has Ethernet...

am335x-boneblack-wireless.dts
#include "am335x-bone-common.dtsi"
#include "am335x-boneblack-common.dtsi"

It's going to be ugly, copy and paste mess, but i guess we might as
well stick it in the device " am335x-boneblack.dts"?

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
